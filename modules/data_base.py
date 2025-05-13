import streamlit as st
from supabase import create_client, Client
from dotenv import load_dotenv
import os
from modules import tables
load_dotenv()

url = os.getenv("SUPABASE_URL")
key = os.getenv("SUPABASE_KEY")
supabase: Client = create_client(url, key)
def get(tableName):
    response = supabase.table(tableName).select('*').execute()
    return response.data

def addUser(user_data):
    response = supabase.table(tables.usersTable).insert(user_data).execute()
    return response

def getUserRolAndCompany(tableName, variable, value):
    response = (
        supabase
        .table(tableName)
        .select("*, roles(rol), company(id,nombre,project_start_date)")
        .eq(variable, value)
        .execute()
    )
    return response.data

def getUserById(user_id):
    response = supabase.table(tables.usersTable).select("*").eq("id", user_id).execute()
    return response.data
def getUserCompany(tableName, variable, value):
    response = (
        supabase
        .table(tableName)
        .select("*, company(id)")
        .eq(variable, value)
        .execute()
    )
    return response.data
def getEqual(tableName, variable, value):
    response = supabase.table(tableName).select('*').eq(variable, value).execute()
    return response.data
def getIdiomas(value):
    response = supabase.table(tables.idiomasTable).select('idioma, id').eq('lang', value).execute()
    return response.data
def getIdiomaNiveles(value):
    response = supabase.table(tables.idiomasNivelesTable).select('nombre, id').eq('lang', value).execute()
    return response.data
def getIdiomaNivelesById(idiomaId):
    response = supabase.table(tables.idiomasNivelesTable).select('nombre').eq('id', idiomaId).execute()
    return response.data
def getIdiomaById(idiomaId):
    response = supabase.table(tables.idiomasTable).select('idioma').eq('id', idiomaId).execute()
    return response.data
def addIdioma(data_idioma):
    response = supabase.table(tables.informeIdiomaNivelesTable).insert(data_idioma).execute()
    return response.data
def getInformeIdiomasByEvaluado(evaluado_id):
    response = supabase.table(tables.informeIdiomaNivelesTable).select("*").eq("evaluadoId", evaluado_id).execute()
    return response.data
def getNivelesCompetencias(value):
    response = supabase.table(tables.nivelesCompetenciasTable).select('nombre,order, id').eq('lang', value).execute()
    return response.data
def getNivelesCompetenciaById(compId):
    response = supabase.table(tables.nivelesCompetenciasTable).select('nombre').eq('id', compId).execute()
    return response.data
def addCompetenciaInforme(data_comp):
    response = supabase.table(tables.informeValoracionCompetencia).insert(data_comp).execute()
    return response.data
def getInformeCompetenciasByEvaluado(evaluado_id):
    response = supabase.table(tables.informeValoracionCompetencia).select("*").eq("evaluadoId", evaluado_id).execute()
    return response.data
def addCompany(data):
    return supabase.table(tables.companyTable).insert(data).execute()

def updateCompanyEstado(company_name, nuevo_estado):
    return supabase.table(tables.companyTable).update({"estado": nuevo_estado}).eq("nombre", company_name).execute()

def saveAuthToken(data):
    return supabase.table(tables.authTokenTable).insert(data).execute()

def getAuthToken(email):
    response = supabase.table(tables.authTokenTable).select('*').eq('email', email).execute()
    if response.data:
        return response.data[0]  # ✅ Devolvemos el primer resultado como dict
    return None

def getPhases():
    response = (
        supabase
        .table(tables.phasesTable)
        .select("*")
        .order("order", desc=False)
        .execute()
    )
    return response.data

def getEvaluadosConsultora(consultoraId):
    response = supabase.table(tables.evaluadoTable).select('*,company(nombre)').eq("consultora", consultoraId).execute()
    return response.data
def getEvaluadoById(evaluadoId):
    response = supabase.table(tables.evaluadoTable).select('*').eq("id", evaluadoId).execute()
    return response.data
def getInforme(consultoraId, evaluadoId):
    response = supabase.table(tables.informeTable).select("id").eq("consultoraId", consultoraId).eq("evaluadoId", evaluadoId).execute()
    return response.data
def getCompleteInforme(consultoraId, evaluadoId):
    response = supabase.table(tables.informeTable).select(
        """
        *,
        informeIdiomaNiveles (
            idiomas (id,idioma),
            idiomaNivel (id, nombre)
        ),
        informeValoracionCompetencia (
            texto, competenciaNombre,
            nivelId: nivelesCompetencias (nombre, id)
        )
        """
    ).eq("consultoraId", consultoraId).eq("evaluadoId", evaluadoId).execute()
    return response.data
def createInforme(dataInforme):
    response = supabase.table(tables.informeTable).insert(dataInforme).execute()
    return response.data
def updateInforme(informeId,dataInforme):
    response = supabase.table(tables.informeTable).update(dataInforme).eq("id", informeId).execute()
    return response.data

def saveInforme():
    consultora_id = st.session_state.get("userId")
    evaluado_id = st.session_state.informe["evaluado"]["id"]

    existing = getInforme(consultora_id, evaluado_id)
    dataInforme = {
        "consultoraId": consultora_id,
        "updated_date": st.session_state.informe.get("updated_date"),
        "evaluadoId": evaluado_id,
        "formacionAcademica": st.session_state.informe.get("formacionAcademica", ""),
        "experienciaProfesional": st.session_state.informe.get("experienciaProfesional", ""),
        "capacidadPotencialActual": st.session_state.informe.get("capacidadPotencialActual", ""),
        "capacidadPotencialFutura": st.session_state.informe.get("capacidadPotencialFutura", ""),
        "conclusiones": st.session_state.informe.get("conclusiones", ""),
        "recomendaciones": st.session_state.informe.get("recomendaciones", ""),
        "propuestasDesarrollo": st.session_state.informe.get("propuestas", "")

    }
    if existing and existing[0] and len(existing[0]) > 0:
        informe_id = existing[0]["id"]
        response = updateInforme(informe_id, dataInforme)
    else:
        response = createInforme(dataInforme)
        st.write(response)
        informe_id =response[0]["id"]
    if response[0]:
        supabase.table(tables.informeIdiomaNivelesTable).delete().eq("evaluadoId", evaluado_id).execute()
        for info in st.session_state.informe["idiomas"]:
            idioma_id = info["id"]
            nivel = info["nivel_id"]
            data_idioma = {
                "idiomaId": idioma_id,
                "evaluadoId": evaluado_id,
                "nivelId": nivel,
                "informeId":informe_id
            }
            addIdioma(data_idioma)
        supabase.table(tables.informeValoracionCompetencia).delete().eq("evaluadoId", evaluado_id).execute()
        for nombre, infoComp in st.session_state.informe["competencias"].items():
            competenciaNombre = infoComp["competencia"]
            nivel = infoComp["nivelId"]
            comment =infoComp["comentario"]
            data_competencia = {
                "competenciaNombre": competenciaNombre,
                "evaluadoId": evaluado_id,
                "nivelId": nivel,
                "texto":comment,
                "informeId":informe_id
            }
            addCompetenciaInforme(data_competencia)

        st.success("Guardado correctamente.")
        st.rerun()
    else:
        st.error("Hubo un error al guardar el informe.")

def generarInformeCompleto(consultora_id, evaluado_id):
    response = supabase.table(tables.informeTable).select("* , evaluado (*)").eq("consultoraId", consultora_id).eq("evaluadoId", evaluado_id).limit(1).execute()
    if response.data:
        informe = response.data[0]
        idiomas = getInformeIdiomasByEvaluado(evaluado_id)
        compentencias = getInformeCompetenciasByEvaluado(evaluado_id)
        evaluado = getEvaluadoById(evaluado_id)
        consultora = getUserById(consultora_id)
        informe["posicion"] = evaluado[0]["posicion"]
        informe["departamento"] = evaluado[0]["departamento"]
        informe["consultoraNombre"]= consultora[0]["name"]
        idioma_dict = {}
        for i in idiomas:
            idioma_nombre = getIdiomaById(i["idiomaId"])
            idioma_nivel_nombre = getIdiomaNivelesById(i["nivelId"])
            idioma_dict[idioma_nombre[0]['idioma']] = {
                "id": i["idiomaId"],
                "nivel": idioma_nivel_nombre
            }
        informe["idiomas"] = idioma_dict
        compentencias_dict = {}
        for i in compentencias:
            nivelCompetencia = getNivelesCompetenciaById(i["nivelId"])
            compentencias_dict[i["competenciaNombre"]] = {
                "competenciaNombre": i["competenciaNombre"],
                "nivelId": nivelCompetencia,
                "comment": i["texto"]
            }
        informe["Competencias"] = compentencias_dict
        return informe
    else:
        st.error("No se encontró el informe.")
        return None