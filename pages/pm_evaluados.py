import streamlit as st
from modules.data_base import addEvaluado, get,updateEvaluado
from modules.navigation import render_menu
from modules.session_manager import is_logged,validate_get_user
from modules.utils import getLanguage
import pandas as pd
from modules import tables
import pandas as pd
import numpy as np
from modules.page_utils import apply_page_config
from modules.components import top_menu
st.session_state["current_page"] = "pm_usuarios"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)
st.markdown(
    f"<h2 style='text-align: center;'>Evaluados</h2>",
    unsafe_allow_html=True
)

usuarios = get(tables.usersTable) or []
evaluados = get(tables.evaluadoTable) or []

# Diccionario: id → nombre de la compañía
evaluados_dict = {c["id"]: c["nombre"] for c in evaluados if "id" in c and "nombre" in c}

# Filtro de compañías
nombres_companias = sorted(set(u["hotel"] for u in evaluados))
nombres_companias.insert(0, "Todas")
consultoras = [u for u in usuarios if u.get("rol") == 4]
consultoras_dict = {f"{u['nombre']} ({u['email']})": u["id"] for u in consultoras}
consultoras_nombre_por_id = {u["id"]: u["nombre"] for u in consultoras}
col1, col2 = st.columns(2)
filtro_compania = col1.selectbox("Hotel", nombres_companias)
filtro_email = col2.text_input("Emails")
# Aplicar filtros
evaluados_filtrados = [
    u for u in evaluados
    if (filtro_compania == "Todas" or u["hotel"] == filtro_compania)
    and (filtro_email.lower() in u["correo_electronico"].lower())
]
for u in evaluados_filtrados:
    consultora_id = u.get("consultora")
    u["consultora_nombre"] = consultoras_nombre_por_id.get(consultora_id, "—")
# Columnas visibles
columnas_visibles = {
    "nombre": "Nombre",
    "correo_electronico": "Email",
    "hotel":"Hotel",
    "consultora_nombre":"Consultora"
}
evaluados_formateados = [
    {col: u.get(col, "") for col in columnas_visibles.keys()}
    for u in evaluados_filtrados
]

df_evaluados = pd.DataFrame(evaluados_formateados)
df_evaluados.rename(columns=columnas_visibles, inplace=True)

if not df_evaluados.empty:
    st.dataframe(df_evaluados, hide_index=True, use_container_width=True)
else:
    st.info("No se encontraron usuarios con esos filtros.")

# ------------------ CREAR NUEVO USUARIO ------------------
st.divider()
uploaded_file = st.file_uploader("Subí un archivo CSV", type=["csv"])
if uploaded_file is not None:
    try:
        
        df = pd.read_csv(uploaded_file)
        df.rename(columns={
        "ID empleado": "id_empleado",
        "Nombre y Apellidos": "nombre",
        "Correo electrónico ": "correo_electronico",
        "Teléfono": "telefono",
        "Hotel": "hotel",
        "Departamento": "departamento",
        "Posición": "posicion",
        "Fecha de nacimiento": "fecha_nacimiento",
        "Fecha de entrada a la compañía": "fecha_entrada",
        "Región": "region",
        "Evaluación de desempeño 2024": "evaluacion_2024",
        "ASISTENCIA": "cita_ok",
        "País":"pais"
     }, inplace=True)

        df.replace({np.nan: None}, inplace=True)
        # Convertir fechas al formato YYYY-MM-DD y NaN a None
        for col in ["fecha_nacimiento", "fecha_entrada"]:
            df[col] = pd.to_datetime(df[col], errors='coerce').dt.strftime('%Y-%m-%d')
        df = df.where(pd.notnull(df), None)

        # Agregar columnas faltantes con valores por defecto
        columnas_faltantes = {
            "evaluadora": None,
            "entrevista_ok": False,
            "cancelacion_1": False,
            "cancelacion_2": False,
            "cv": False,
            "bfq": False
        }
        for col, default in columnas_faltantes.items():
                if col not in df.columns:
                    df[col] = default

        st.write("Vista previa de los datos:")
        st.dataframe(df.head())

        if st.button("Importar Dato"):
            data = df.to_dict(orient="records")
            response = addEvaluado(data)
            if response.data != None :
                st.success("Datos importados exitosamente.")
                st.rerun()
            else:
                if(response.data.code=='23505'):
                    st.error("Estas intentando agregar emails que ya existen. Eliminalos del csv e intenta nuevamente")
                

    except Exception as e:
        st.error(f"Error al leer el archivo: {e}")



st.divider()


st.subheader("Asignar consultora a un evaluado")

# Elegir evaluado por email o nombre
evaluados_opciones = {f"{e['nombre']} ({e['correo_electronico']})": e["id"] for e in evaluados_filtrados}
evaluado_seleccionado = st.selectbox("Seleccioná un evaluado", list(sorted(evaluados_opciones.keys())))
evaluado_id = evaluados_opciones[evaluado_seleccionado]

# Elegir consultora (usuarios con rol 3)
consultora_seleccionada = st.selectbox("Seleccioná una consultora", list(consultoras_dict.keys()))
consultora_id = consultoras_dict[consultora_seleccionada]

# Botón para guardar
if st.button("Asignar consultora"):
    try:
        response = updateEvaluado(evaluado_id, consultora_id)
        st.success("Consultora asignada correctamente.")
    except Exception as e:
        st.error(f"Error al asignar consultora: {e}")
