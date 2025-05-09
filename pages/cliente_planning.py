import streamlit as st
from modules.data_base import getPhases
from modules.navigation import render_menu
from modules.session_manager import is_logged,validate_get_user
from modules.utils import getLanguage
from modules.page_utils import apply_page_config
from modules.components import top_menu
from datetime import datetime, timedelta
import pandas as pd
import matplotlib.pyplot as plt
st.session_state["current_page"] = "clients_planning"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)
st.markdown(
    f"<h2 style='text-align: center;'>{lang['menuClientPlanning']}</h2>",
    unsafe_allow_html=True
)

def preparar_gantt(etapas, fecha_base):
    datos = []
    fecha_inicio = fecha_base

    for etapa in etapas:
        dias_desde_anterior = etapa.get('days_from_last') or 0
        dias_duracion = etapa.get('days_duration') or 1
        if etapa.get('order') == 1:
            fecha_inicio = fecha_base
        else:
            fecha_inicio += timedelta(days=dias_desde_anterior)
        
        fecha_fin = fecha_inicio + timedelta(days=dias_duracion)
        datos.append({
            "Task": etapa["etapa"],
            "Start": fecha_inicio,
            "Finish": fecha_fin,
            "Colour": etapa.get("colour"),
            "Days":dias_duracion
        })

        fecha_inicio = fecha_fin

    return pd.DataFrame(datos)

# --- Streamlit app ---

if "projectStartDate" in st.session_state and st.session_state.projectStartDate:
    startDate = datetime.fromisoformat(st.session_state.projectStartDate)
else:
    startDate = datetime.today().date()

etapas = getPhases()
if not etapas:
    st.warning("No se encontraron etapas.")
else:

    df = preparar_gantt(etapas,startDate)
    df = df.sort_values("Start")
    df["Start"] = pd.to_datetime(df["Start"])
    df["Finish"] = pd.to_datetime(df["Finish"])
    fig = plt.figure(figsize=(2, 1))
    plt.barh(y=df["Task"], left=df["Start"], width=df["Days"], color=df["Colour"])
    plt.grid(True)
    plt.xticks(fontsize=2)
    plt.yticks(fontsize=2)
    plt.title("Diagrama de Gantt", fontsize=3)
    plt.xlabel("Fecha", fontsize=3)
    plt.ylabel("Etapas", fontsize=3)
    st.pyplot(fig)
    