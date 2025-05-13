import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged,loadInforme
from modules.utils import getLanguage
from modules.components import top_menu
from modules import data_base
from datetime import datetime
from modules.files_utils import generarInforme

st.session_state["current_page"] = "consultora_entrevista"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
render_menu(st.session_state.role)

lang = getLanguage(st.session_state.language)
idiomas= data_base.getIdiomas(st.session_state.language)
idiomaNiveles=data_base.getIdiomaNiveles(st.session_state.language)
nivelesCompetencias=data_base.getNivelesCompetencias(st.session_state.language)
st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleInterview']}</h2>",
    unsafe_allow_html=True
)
consultoraId=st.session_state.userId
if 'informe' not in st.session_state:
    st.session_state.informe = {}
    st.session_state.informe["idiomas"] = []
    st.session_state.informe["competencias"] = {}
if "informe_cargado" not in st.session_state:
    st.session_state.informe_cargado = False
evaluados=data_base.getEvaluadosConsultora(consultoraId)
nombres = [e['nombre'] for e in evaluados]
evaluadoCol,col2, generarInformeCol = st.columns([1.5,4,1])

with evaluadoCol:
    evaluado_seleccionado = st.selectbox(lang["InterviewDropdownText"], nombres,key="evaluado_seleccionado")
    if "evaluado_anterior" not in st.session_state:
        st.session_state.evaluado_anterior = st.session_state.evaluado_seleccionado
    if st.session_state.evaluado_anterior != st.session_state.evaluado_seleccionado:
        st.session_state.informe_cargado = False
        st.session_state.evaluado_anterior = st.session_state.evaluado_seleccionado

with generarInformeCol:
    if st.button(lang["InterviewCreateFile"]):
       generarInforme()

evaluado_objeto = next((e for e in evaluados if e['nombre'] == evaluado_seleccionado), None)
if not st.session_state.informe_cargado:
    informe = data_base.getCompleteInforme(consultoraId,evaluado_objeto["id"])
    if informe:
        loadInforme(informe)
    else:
        st.session_state.informe = {}
        st.session_state.informe["idiomas"] = []
        st.session_state.informe["competencias"] = {}

st.session_state.informe['evaluado'] = evaluado_objeto
st.session_state.informe['updated_date'] = datetime.today().strftime('%d/%m/%Y')

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
        formacionAcademica = st.text_area("", value=st.session_state.informe.get("formacionAcademica", ""))
        st.session_state.informe['formacionAcademica']= formacionAcademica
with languagesContainer:
    with st.expander(lang["InterviewLanguages"]):
        col1, col2, col3 = st.columns([2,1,2])
        with col2:
            st.subheader(lang["InterviewLanguages"])
        idiomasCol, nivelCol = st.columns([4,4])
        idiomasList = [e['idioma'] for e in idiomas]
        nivelesList = [e['nombre'] for e in idiomaNiveles]
        with idiomasCol:
            idioma_seleccionado = st.selectbox(lang["InterviewSelectLang"], idiomasList)
        with nivelCol:
            nivel_seleccionado = st.selectbox(lang["InterviewSelectLangNivel"], nivelesList)
        if st.button(lang["InterviewSelectAddLang"]):
            idioma = next((i for i in idiomas if i["idioma"] == idioma_seleccionado), None)
            nivel = next((n for n in idiomaNiveles if n["nombre"] == nivel_seleccionado), None)
            if idioma and nivel:
                nuevo = {
                    "id": idioma["id"],
                    "nombre": idioma["idioma"],
                    "nivel": nivel["nombre"],
                    "nivel_id": nivel["id"]
                }
                ya_agregado = any(i["id"] == nuevo["id"] for i in st.session_state.informe["idiomas"])
                if not ya_agregado:
                    st.session_state.informe["idiomas"].append(nuevo)
                else:
                    st.warning(lang["InterviewLangAlreadyAdded"])
        if st.session_state.informe["idiomas"]:
            st.write(lang["InterviewSelectAddedLang"])
            for idx, idioma in enumerate(st.session_state.informe["idiomas"]):
                            col1, col2 = st.columns([6, 1])
                            with col1:
                                st.write(f"- {idioma['nombre']} ({idioma['nivel']})")
                            with col2:
                                eliminar = st.button("🗑️", key=f"eliminar_{idioma['id']}")
                                if eliminar:
                                    st.session_state.informe["idiomas"].pop(idx)
                                    st.rerun()  
with experienciaProfesionalContainer:
    with st.expander(lang["InterviewExperienciaProfesional"]):
        col1, col2, col3 = st.columns([2,2,2])
        with col2:
            st.subheader(lang["InterviewExperienciaProfesional"])
        experienciaProfesional = st.text_area("", value=st.session_state.informe.get("experienciaProfesional", ""),height=168)

        st.session_state.informe['experienciaProfesional']= experienciaProfesional
with competenciasContainer:
    competenciasNombres = [e['nombre'] for e in nivelesCompetencias]
    with st.expander(lang["InverviewCompetenceTitle"]):
        competenciaNombre = st.text_input(lang["InverviewCompetenceAdd"])
        nivelCompetencia = st.selectbox(lang["SelectValue"], competenciasNombres)
        datos_previos = st.session_state.informe['competencias'].get(competenciaNombre, {})
        comentario_default = datos_previos.get('comentario', "")
        comentario = st.text_area(lang["Comment"])
        nivelSeleccionado = next((e for e in nivelesCompetencias if e['nombre'] == nivelCompetencia), None)
        st.session_state.informe['competencias'][competenciaNombre] = {
                    'competencia': competenciaNombre,
                    'valoracion': nivelCompetencia,
                    'comentario': comentario,
                    'nivelId': nivelSeleccionado["id"]
                }
with capacidadPotencialActualContainer:
    with st.expander(lang["InterviewCapacidadPotencialActual"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewCapacidadPotencialActual"])
        capacidadPotencialActual = st.text_area("",value = st.session_state.informe.get("capacidadPotencialActual", ""),key="capacidadPotencialActualKey")
        st.session_state.informe['capacidadPotencialActual']= capacidadPotencialActual
with capacidadPotencialFuturaContainer:
    with st.expander(lang["InterviewCapacidadPotencialFutura"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewCapacidadPotencialFutura"])
        capacidadPotencialFutura = st.text_area("",value = st.session_state.informe.get("capacidadPotencialFutura", ""),key="capacidadPotencialFuturaKey")
        st.session_state.informe['capacidadPotencialFutura']= capacidadPotencialFutura
with conclusionesContainer:
    with st.expander(lang["InterviewConclusiones"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewConclusiones"])
        conclusiones = st.text_area("",value = st.session_state.informe.get("conclusiones", ""),key="conclusionesKey")
        st.session_state.informe['conclusiones']= conclusiones
with recomendacionesContainer:
    with st.expander(lang["InterviewRecomendaciones"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewRecomendaciones"])
        recomendaciones = st.text_area("",value = st.session_state.informe.get("recomendaciones", ""),key="recomendacionesKey")
        st.session_state.informe['recomendaciones']= recomendaciones
with propuestaDesarrolloContainer:
    with st.expander(lang["InterviewAccionesDesarrollo"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewAccionesDesarrollo"])
        propuestas = st.text_area("",value = st.session_state.informe.get("propuestas", ""),key="propuestasKey")
        st.session_state.informe['propuestas']= propuestas

if st.button(lang["InterviewSaveButton"]):
    data_base.saveInforme()