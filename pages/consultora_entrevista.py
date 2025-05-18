import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged,loadInforme
from modules.utils import getLanguage
from modules.components import top_menu
from modules import data_base
from datetime import datetime
from modules.files_utils import generarInforme

if "current_page" not in st.session_state:
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
aspiraciones=data_base.getAspiraciones(st.session_state.language)
tiposInformes=data_base.getTipoInforme()
st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleInterview']}</h2>",
    unsafe_allow_html=True
)
consultoraId=st.session_state.userId
if 'informe' not in st.session_state:
    st.session_state.informe = {}
    st.session_state.informe["idiomas"] = []
    st.session_state.informe["competencias"] = {}
    st.session_state.informe["fortalezas"] = {}
    st.session_state.informe["areaDesarrollo"] = {}
    st.session_state.informe["aspiraciones"] = {}
    st.session_state.tipoInformeId = 1
if "informe_cargado" not in st.session_state:
    st.session_state.informe_cargado = False

evaluados=data_base.getEvaluadosConsultora(consultoraId)
nombres = [e['nombre'] for e in evaluados]
evaluadoCol,tipoCol, col3 = st.columns([1.5,1.3, 5])
with evaluadoCol:
    evaluado_seleccionado = st.selectbox(lang["InterviewDropdownText"], nombres,key="evaluado_seleccionado")
    if "evaluado_anterior" not in st.session_state:
        st.session_state.evaluado_anterior = st.session_state.evaluado_seleccionado
    if st.session_state.evaluado_anterior != st.session_state.evaluado_seleccionado:
        st.session_state.informe_cargado = False
        st.session_state.evaluado_anterior = st.session_state.evaluado_seleccionado


evaluado_objeto = next((e for e in evaluados if e['nombre'] == evaluado_seleccionado), None)
if "evaluado_actual_id" not in st.session_state or st.session_state.evaluado_actual_id != evaluado_objeto["id"]:
    st.session_state.evaluado_actual_id = evaluado_objeto["id"]
    st.session_state.informe_cargado = False
    st.session_state.informe = {
        "idiomas": [],
        "competencias": {},
        "fortalezas": {},
        "areaDesarrollo": {},
        "aspiraciones": {},
    }
if not st.session_state.informe_cargado:
    informe = data_base.getCompleteInforme(consultoraId,evaluado_objeto["id"])
    if informe:
        loadInforme(informe)
        if "tipoInformeId" in informe:
            tipo_encontrado = next((t for t in tiposInformes if t["id"] == informe["tipoInformeId"]), None)
            if tipo_encontrado:
                st.session_state.tipoInformeId = tipo_encontrado["id"]
                st.session_state.tipoInforme_seleccionado = tipo_encontrado["tipoInforme"]
    else:
        if not st.session_state.informe_cargado:
            if "informe" not in st.session_state or not st.session_state.informe:
                st.session_state.informe = {}
                st.session_state.informe["idiomas"] = []
                st.session_state.informe["competencias"] = {}
                st.session_state.informe["fortalezas"] = {}
                st.session_state.informe["areaDesarrollo"] = {}
                st.session_state.informe["aspiraciones"] = {}

st.session_state.informe['evaluado'] = evaluado_objeto
st.session_state.informe['updated_date'] = datetime.today().strftime('%d/%m/%Y')
nombreInformes = [e['tipoInforme'] for e in tiposInformes]
tipoInforme_default = None
if "tipoInformeId" in st.session_state:
    tipoInformeId_guardado = st.session_state["tipoInformeId"]
    tipoEncontrado = next((t for t in tiposInformes if t["id"] == tipoInformeId_guardado), None)
    if tipoEncontrado:
        tipoInforme_default = tipoEncontrado["tipoInforme"]
if tipoInforme_default in nombreInformes:
    default_index = nombreInformes.index(tipoInforme_default)
else:
    default_index = 0
with tipoCol:
    tipoInformeSeleccionado = st.selectbox(lang["InterviewTipoInforme"], nombreInformes,key="tipoInforme_seleccionado", index=default_index)
    if "tipoInforme_anterior" not in st.session_state:
        st.session_state.tipoInforme_anterior = st.session_state.tipoInforme_seleccionado
    if st.session_state.tipoInforme_anterior != st.session_state.tipoInforme_seleccionado:
        st.session_state.informe_cargado = False
        st.session_state.tipoInforme_anterior = st.session_state.tipoInforme_seleccionado
tipo_objeto = next((t for t in tiposInformes if t["tipoInforme"] == tipoInformeSeleccionado), None)
if tipo_objeto:
    st.session_state.tipoInformeId = tipo_objeto["id"]
tipo = st.session_state.tipoInforme_seleccionado  # Ya viene del selectbox
mostrar_balance_emocional = tipo == "Potencial"
mostrar_evaluacion_potencial = tipo == "Potencial"
mostrar_motivaciones_intereses= tipo in ["Potencial", "Competencias"]
mostrar_conclusion= tipo in ["Potencial", "Competencias"]
mostrar_perfil_profesional= tipo in ["Potencial", "Competencias"]
#informe container
if mostrar_perfil_profesional:
    st.subheader(lang["InverviewTitlePerfilProfesional"])
    formacionAcademicaContainer = st.container(key='formacionAcademicaContainer')
    languagesContainer = st.container(key='languagesContainer')
    experienciaProfesionalContainer = st.container(key='experienciaProfesionalContainer')

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
st.subheader(lang["InterviewValoracionCompentencias"])
competenciasContainer = st.container(key="competenciaContainer")
fortalezasAreasDesarrollo = st.container(key="fortalezasContainer")
areasDesarrollo = st.container(key="areasContainer")
with competenciasContainer:
    competenciasNombres = [e['nombre'] for e in nivelesCompetencias]
    with st.expander(lang["InverviewCompetenceTitle"]):
        competenciaNombre = st.text_input(lang["InverviewCompetenceAdd"])
        nivelCompetencia = st.selectbox(lang["SelectValue"], competenciasNombres)
        datos_previos = st.session_state.informe['competencias'].get(competenciaNombre, {})
        comentario_default = datos_previos.get('comentario', "")
        comentario = st.text_area(lang["Comment"], value=comentario_default)
        nivelSeleccionado = next((e for e in nivelesCompetencias if e['nombre'] == nivelCompetencia), None)
        if st.button(lang["AddButton"]):
            if competenciaNombre and nivelSeleccionado:
                st.session_state.informe["competencias"][competenciaNombre] = {
                    'competencia': competenciaNombre,
                    'valoracion': nivelCompetencia,
                    'comentario': comentario,
                    'nivelId': nivelSeleccionado["id"]
                }
        st.write(lang["InverviewCompetenceAdded"])
        competencias = list(st.session_state.informe["competencias"].items())

        if competencias:
            tab_labels = [nombre for nombre, _ in competencias]
            tabs = st.tabs(tab_labels)
            competencia_eliminada = None

            for (nombre, datos), tab in zip(competencias, tabs):
                with tab:
                    st.write(lang["Comment"], datos['comentario'])
                    if st.button(lang["DeleteButton"], key=f"delete_{nombre}"):
                        competencia_eliminada = nombre

            if competencia_eliminada:
                del st.session_state.informe["competencias"][competencia_eliminada]
                st.rerun()
        else:
            st.info(lang["NoDataYet"])
with fortalezasAreasDesarrollo:
    with st.expander(lang["InterviewFortalezayAreasDesarrollo"]):
        fortalezaNombre = st.text_input(lang["InverviewCompetenceAdd"], key="fortalezaNombreText")
        datosPreviosFort = st.session_state.informe['fortalezas'].get(fortalezaNombre, {})
        comentarioFortDefault = datosPreviosFort.get('comentario', "")
        comentarioFort = st.text_area(lang["Comment"], value=comentarioFortDefault, key="fortalezaCommentText")
        if st.button(lang["AddButton"],key="addFortaleza"):
            if fortalezaNombre:
                st.session_state.informe["fortalezas"][fortalezaNombre] = {
                    'nombreFortaleza': fortalezaNombre,
                    'comentario': comentarioFort,
                }
        st.write(lang["InverviewFortalezaAdded"])
        fortalezas = list(st.session_state.informe["fortalezas"].items())

        if fortalezas:
            tab_labels = [nombre for nombre, _ in fortalezas]
            tabs = st.tabs(tab_labels)
            fortaleza_eliminada = None

            for (nombre, datos), tab in zip(fortalezas, tabs):
                with tab:
                    st.write(lang["Comment"], datos['comentario'])
                    if st.button(lang["DeleteButton"], key=f"delete_fort_{nombre}"):
                        fortaleza_eliminada = nombre

            if fortaleza_eliminada:
                del st.session_state.informe["fortalezas"][fortaleza_eliminada]
                st.rerun()
        else:
            st.info(lang["NoDataYet"])
with areasDesarrollo:
    with st.expander(lang["InterviewAreaTitle"]):
        areaNombre = st.text_input(lang["InverviewCompetenceAdd"], key="areaNombreText")
        datosPreviosArea = st.session_state.informe['areaDesarrollo'].get(areaNombre, {})
        comentarioAreaDefault = datosPreviosArea.get('comentario', "")
        comentarioArea= st.text_area(lang["Comment"], value=comentarioAreaDefault, key="areaCommentText")
        if st.button(lang["AddButton"],key="addArea"):
            if areaNombre:
                st.session_state.informe["areaDesarrollo"][areaNombre] = {
                    'nombreArea': areaNombre,
                    'comentario': comentarioArea,
                }
        st.write(lang["InverviewAreasAdded"])
        
        areaDesarrollo = list(st.session_state.informe["areaDesarrollo"].items())
        if areaDesarrollo:
            tab_labels = [nombre for nombre, _ in areaDesarrollo]
            tabs = st.tabs(tab_labels)
            area_eliminada = None

            for (nombre, datos), tab in zip(areaDesarrollo, tabs):
                with tab:
                    st.write(lang["Comment"], datos['comentario'])
                    if st.button(lang["DeleteButton"], key=f"delete_area_{nombre}"):
                        area_eliminada = nombre

            if area_eliminada:
                del st.session_state.informe["areaDesarrollo"][area_eliminada]
                st.rerun()
        else:
            st.info(lang["NoDataYet"])
if mostrar_evaluacion_potencial:
    st.subheader(lang["InterviewEvaluacionPotencial"])
    graficoProgresoContainer = st.container(key='graficoProgresoContainer')
    with graficoProgresoContainer:
        with st.expander(lang["InterviewGraficoProgreso"]):
            cpa5 = st.selectbox(lang["InterviewCPA5Title"],lang["InterviewCPA"],key="cpa5Selector")
            st.session_state.informe['cpa5']= cpa5
            cpa10 = st.selectbox(lang["InterviewCPA10Title"],lang["InterviewCPA"],key="cpa10Selector")
            st.session_state.informe['cpa10']= cpa10
            modo = st.selectbox(lang["InterviewModoTitle"],lang["InterviewModo"],key="modoSelector")
            st.session_state.informe['modo']= modo

    capacidadPotencialActualContainer = st.container(key='capacidadPotencialActualContainer')
    with capacidadPotencialActualContainer:
        with st.expander(lang["InterviewCapacidadPotencialActual"]):
            col1, col2, col3 = st.columns([2,3,2])
            with col2:
                st.subheader(lang["InterviewCapacidadPotencialActual"])
            capacidadPotencialActual = st.text_area("",value = st.session_state.informe.get("capacidadPotencialActual", ""),key="capacidadPotencialActualKey")
            st.session_state.informe['capacidadPotencialActual']= capacidadPotencialActual
    capacidadPotencialFuturaContainer = st.container(key='capacidadPotencialFuturaContainer')
    with capacidadPotencialFuturaContainer:
        with st.expander(lang["InterviewCapacidadPotencialFutura"]):
            col1, col2, col3 = st.columns([2,3,2])
            with col2:
                st.subheader(lang["InterviewCapacidadPotencialFutura"])
            capacidadPotencialFutura = st.text_area("",value = st.session_state.informe.get("capacidadPotencialFutura", ""),key="capacidadPotencialFuturaKey")
            st.session_state.informe['capacidadPotencialFutura']= capacidadPotencialFutura
if mostrar_balance_emocional:
    st.subheader(lang["InterviewBalanceEmocional"])
    balanceEmocionalContainer = st.container(key='balanceEmocionalContainer')
if mostrar_motivaciones_intereses:
    st.subheader(lang["InterviewMotivacionIntereses"])
    motivacionesContainer = st.container(key='motivacionesContainers')
    with motivacionesContainer:
        with st.expander(lang["InterviewMotivacionesSubtitle"]):
            nombresAspiraciones = [e['nombre'] for e in aspiraciones]
            aspiracionesSelected=st.selectbox(lang["InterviewMotivacionesSubtitle"],nombresAspiraciones)
            motivacionBreveDescripcion = st.text_input(lang["InterviewBreveDescripcion"],key="motivacionBreveDescripcion")
            motivacionDescripcion = st.text_area(lang["Comment"],key="motivacionDescripcion")
            aspiracion_objeto = next((e for e in aspiraciones if e['nombre'] == aspiracionesSelected), None)
            if st.button(lang["AddButton"],key="addMotivation"):
                    if aspiracionesSelected:
                        st.session_state.informe["aspiraciones"][aspiracionesSelected] = {
                            'aspiracionId': aspiracion_objeto["id"],
                            'breveDescripcion': motivacionBreveDescripcion,
                            'comentario': motivacionDescripcion
                        }
            st.write(lang["InverviewMotivacionAdded"])
            aspiraciones = list(st.session_state.informe["aspiraciones"].items())
            if aspiraciones:
                tab_labels = [nombre for nombre, _ in aspiraciones]
                tabs = st.tabs(tab_labels)
                aspiraciones_eliminada = None
                for (nombre, datos), tab in zip(aspiraciones, tabs):
                    with tab:
                        st.write(lang["InterviewBreveDescripcion"], datos['breveDescripcion'])
                        st.write(lang["Comment"], datos['comentario'])
                        if st.button(lang["DeleteButton"], key=f"delete_mot_{nombre}"):
                            aspiraciones_eliminada = nombre

                if aspiraciones_eliminada:
                    del st.session_state.informe["aspiraciones"][aspiraciones_eliminada]
                    st.rerun()
            else:
                st.info(lang["NoDataYet"])
        with st.expander(lang["InterviewDisponibildadGeografica"]):
            disponibilidadSelected=st.selectbox("",lang["InterviewDisponibilidadList"])
            dispBreveDescripcion = st.text_input(lang["InterviewBreveDescripcion"], value=st.session_state.informe.get("breveDescripcionDisponibilidad", ""),key="dispBreveDescripcion")
            dispDescripcion = st.text_area(lang["Comment"], value=st.session_state.informe.get("disponibilidadComment", ""),key="dispDescripcion")
            st.session_state.informe["disponibilidad"] = disponibilidadSelected
            st.session_state.informe["breveDescripcion"] = dispBreveDescripcion
            st.session_state.informe["disponibilidadComment"] = dispDescripcion
if mostrar_conclusion:
    st.subheader(lang["InterviewConclusionesTitle"])
    conclusionesContainer = st.container(key='conclusionesContainer')
    with conclusionesContainer:
        with st.expander(lang["InterviewConclusiones"]):
            col1, col2, col3 = st.columns([2,3,2])
            with col2:
                st.subheader(lang["InterviewConclusiones"])
            conclusiones = st.text_area("",value = st.session_state.informe.get("conclusiones", ""),key="conclusionesKey")
            st.session_state.informe['conclusiones']= conclusiones

    potencialNivel = st.selectbox(lang["InverviewPotencial"],lang["InterviewPotencialNivel"])
    st.session_state.informe['potencialNivel']= potencialNivel
    recomendacionesContainer = st.container(key='recomendacionesContainer')
    with recomendacionesContainer:
        with st.expander(lang["InterviewRecomendaciones"]):
            col1, col2, col3 = st.columns([2,3,2])
            with col2:
                st.subheader(lang["InterviewRecomendaciones"])
            recomendaciones = st.text_area("",value = st.session_state.informe.get("recomendaciones", ""),key="recomendacionesKey")
            st.session_state.informe['recomendaciones']= recomendaciones
propuestaDesarrolloContainer = st.container(key='propuestaDesarrolloContainer')
with propuestaDesarrolloContainer:
    with st.expander(lang["InterviewAccionesDesarrollo"]):
        col1, col2, col3 = st.columns([2,3,2])
        with col2:
            st.subheader(lang["InterviewAccionesDesarrollo"])
        propuestas = st.text_area("",value = st.session_state.informe.get("propuestasDesarrollo", ""),key="propuestasKey")
        st.session_state.informe['propuestasDesarrollo']= propuestas


saveButton, col, fileButton = st.columns([2,6,2])
with saveButton:
    if st.button(lang["InterviewSaveButton"]):
        data_base.saveInforme()
with fileButton:
    if st.button(lang["InterviewCreateFile"]):
       generarInforme()