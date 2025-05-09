import streamlit as st
from modules.utils import createCalendario
from modules.navigation import render_menu
from modules.sheet_connection import get_google_sheet, get_sheets
from variables import sheet_id, sheet_psicologos, sheet_agenda
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged
st.session_state["current_page"] = "dashboard_psicologos"
apply_page_config()
is_logged()
validate_get_user()
render_menu(st.session_state.role)

def getCandidatos():
    return get_google_sheet("gsheets", sheet_id)
def getPsicologos():
    return get_sheets(sheet_psicologos, [sheet_psicologos])[0]

def getAgenda():
    return get_sheets(sheet_agenda, [sheet_agenda])[0]

# Cargar datos
candidatos = getCandidatos()
agenda = getAgenda()
psicologos = getPsicologos()

st.title("Panel de Psicólogos")
st.subheader("Candidatos")

# Validaciones
if candidatos.empty:
    st.error("No hay datos de candidatos disponibles.")
elif agenda.empty:
    st.error("No hay datos de agenda disponibles.")
elif psicologos.empty:
    st.error("No hay datos de psicólogos disponibles.")
else:
    df_agenda_psico = agenda.merge(
        psicologos,
        on="email_psicologo",
        how="left",
        suffixes=('', '_psico')
    ).rename(columns={"nombre": "nombre_psicologo"})

    df_resultado = candidatos.merge(
        df_agenda_psico,
        on="email_candidato",
        how="left"
    ).rename(columns={"nombre": "nombre_candidato"})

    df_resultado_final = df_resultado[[
        "nombre_candidato", "email_candidato", "edad",
        "nombre_psicologo", "email_psicologo", "especialidad",
        "fecha", "hora", "estado", "titulo"
    ]].rename(columns={
        "nombre_candidato": "Candidato",
        "email_candidato": "Email del Candidato",
        "edad": "Edad",
        "nombre_psicologo": "Psicólogo",
        "email_psicologo": "Email del Psicólogo",
        "especialidad": "Especialidad",
        "fecha": "Fecha",
        "hora": "Hora",
        "estado": "Estado",
        "titulo": "Titulo"
    })

    st.dataframe(df_resultado_final, hide_index=True)

# # Mostrar candidatos con índice seleccionable
# df_sin_psicologo = df_resultado_final[df_resultado_final["Psicólogo"].isna()].reset_index(drop=True)

# st.write("Asignar Psicólogo")
# candidato_idx = st.selectbox(
#     "Candidato",
#     options=df_sin_psicologo.index,
#     format_func=lambda i: f"{df_sin_psicologo.at[i, 'Candidato']} ({df_sin_psicologo.at[i, 'Email del Candidato']})"
# )

# candidato = candidatos.loc[candidato_idx]

# psicologo_nombre = st.selectbox("Elegí un psicólogo", psicologos["nombre"].tolist())

# # Buscar email del psicólogo
# psicologo_email = psicologos[psicologos["nombre"] == psicologo_nombre]["email_psicologo"].values[0]

# # Mostrar resultado
# if st.button("Asignar"):
#     st.success(f"Asignado {psicologo_nombre} a {candidato['nombre']}")
#     # Acá podrías guardar en una hoja o base de datos
#     asignacion = {
#         "email_candidato": candidato["email_candidato"],
#         "email_psicologo": psicologo_email
#     }
#     st.json(asignacion)

createCalendario(agenda)
