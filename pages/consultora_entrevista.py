import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged
from modules.utils import getLanguage
from modules.components import top_menu
from modules.data_base import getEvaluadosConsultora,saveInforme,getIdiomas,getCompetencias
from datetime import datetime
from modules.files_utils import generarInforme
st.session_state["current_page"] = "consultora_entrevista"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
render_menu(st.session_state.role)

lang = getLanguage(st.session_state.language)
idiomas= getIdiomas(st.session_state.language)
st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleInterview']}</h2>",
    unsafe_allow_html=True
)
consultoraId=st.session_state.userId
if 'informe' not in st.session_state:
    st.session_state.informe = {}
    st.session_state.informe['competencias'] ={}
evaluados=getEvaluadosConsultora(consultoraId)
competencias=getCompetencias(st.session_state.language)
nombres = [e['nombre'] for e in evaluados]
evaluadoCol,col2, generarInformeCol = st.columns([1,4,1])
with evaluadoCol:
    evaluado_seleccionado = st.selectbox(lang["InterviewDropdownText"], nombres)
with generarInformeCol:
    if st.button(lang["InterviewCreateFile"]):
       generarInforme()

evaluado_objeto = next((e for e in evaluados if e['nombre'] == evaluado_seleccionado), None)
st.session_state.informe['evaluado'] = evaluado_objeto
st.session_state.informe['fecha'] = datetime.today().strftime('%d/%m/%Y')


#informe container
formacionAcademicaContainer = st.container(key='formacionAcademicaContainer')
languagesContainer = st.container(key='languagesContainer')
experienciaProfesionalContainer = st.container(key='experienciaProfesionalContainer')
competenciasContainer = st.container(key="competenciaContainer")
capacidadPotencialActualContainer = st.container(key='capacidadPotencialActualContainer')
capacidadPotencialFuturaContainer = st.container(key='capacidadPotencialFuturaContainer')
balanceEmocionalContainer = st.container(key='balanceEmocionalContainer')
conclusionesContainer = st.container(key='conclusionesContainer')
recomendacionesContainer = st.container(key='recomendacionesContainer')
propuestaDesarrolloContainer = st.container(key='propuestaDesarrolloContainer')


with formacionAcademicaContainer:
    with st.expander(lang["InterviewFormacionAcademicaText"]):
        col1, col2, col3 = st.columns([2,2,2])
        with col2:
            st.subheader(lang["InterviewFormacionAcademicaText"])
        formacionAcademica = st.text_area("")
        st.session_state.informe['formacionAcademica']= formacionAcademica
with languagesContainer:
    with st.expander(lang["InterviewLanguages"]):
        col1, col2, col3 = st.columns([2,1,2])
        with col2:
            st.subheader(lang["InterviewLanguages"])
        idiomasCol, col2 = st.columns([4,4])
        with idiomasCol:
            espanol = st.slider(idiomas[0]["idioma"], 1, 10, 5)
            ingles = st.slider(idiomas[1]["idioma"], 1, 10, 5)
            portugues = st.slider(idiomas[2]["idioma"], 1, 10, 5)

            st.session_state.informe['Idiomas'] = {
                'Español': {
                    'id': idiomas[0]['id'],
                    'nivel': espanol
                },
                'Inglés': {
                    'id': idiomas[1]['id'],
                    'nivel': ingles
                },
                'Portugués': {
                    'id': idiomas[2]['id'],
                    'nivel': portugues
                }
            }
with experienciaProfesionalContainer:
    with st.expander(lang["InterviewExperienciaProfesional"]):
        col1, col2, col3 = st.columns([2,2,2])
        with col2:
            st.subheader(lang["InterviewExperienciaProfesional"])
        experienciaProfesional = st.text_area("",key="experienciaProfesional", height=168)

        st.session_state.informe['experienciaProfesional']= experienciaProfesional
with competenciasContainer:
    competenciasNombres = [e['nombre'] for e in competencias]
    with st.expander(lang["InverviewCompetenceTitle"]):
        competenciaSeleccionada = st.selectbox(lang["SelectValue"], competenciasNombres)
        datos_previos = st.session_state.informe['competencias'].get(competenciaSeleccionada, {})
        valoracion_default = datos_previos.get('valoracion', 5)
        comentario_default = datos_previos.get('comentario', "")
        valoracion = st.selectbox(lang["Valor"],options=list(range(1, 11)),index=valoracion_default - 1)
        comentario = st.text_area(f"{competenciaSeleccionada}:")
        competenciaEvaluada = next((e for e in competencias if e['nombre'] == competenciaSeleccionada), None)
        st.session_state.informe['competencias'][competenciaSeleccionada] = {
                    'nombre': competenciaSeleccionada,
                    'valoracion': valoracion,
                    'comentario': comentario,
                    'competenciaId': competenciaEvaluada["id"]
                }
with capacidadPotencialActualContainer:
    with st.expander(lang["InterviewCapacidadPotencialActual"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewCapacidadPotencialActual"])
        capacidadPotencialActual = st.text_area("",key="capacidadPotencialActualKey")
        st.session_state.informe['capacidadPotencialActual']= capacidadPotencialActual
with capacidadPotencialFuturaContainer:
    with st.expander(lang["InterviewCapacidadPotencialFutura"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewCapacidadPotencialFutura"])
        capacidadPotencialFutura = st.text_area("",key="capacidadPotencialFuturaKey")
        st.session_state.informe['capacidadPotencialFutura']= capacidadPotencialFutura

with conclusionesContainer:
    with st.expander(lang["InterviewConclusiones"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewConclusiones"])
        conclusiones = st.text_area("",key="conclusionesKey")
        st.session_state.informe['conclusiones']= conclusiones
with recomendacionesContainer:
    with st.expander(lang["InterviewRecomendaciones"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewRecomendaciones"])
        recomendaciones = st.text_area("",key="recomendacionesKey")
        st.session_state.informe['recomendaciones']= recomendaciones
with propuestaDesarrolloContainer:
    with st.expander(lang["InterviewAccionesDesarrollo"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewAccionesDesarrollo"])
        propuestas = st.text_area("",key="propuestasKey")
        st.session_state.informe['propuestas']= propuestas

if st.button(lang["InterviewSaveButton"]):
    saveInforme()