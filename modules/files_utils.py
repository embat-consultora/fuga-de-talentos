import streamlit as st
import io
import os
from modules.data_base import generarInformeCompleto
from docxtpl import DocxTemplate, InlineImage,RichText
from modules.graph_utils import  generar_grafico_radar,generar_barras_idiomas
from docx.shared import Mm
from datetime import datetime

def get_color_por_nivel(nivel_id):
    if nivel_id == 1:
        return "ea5b0d"  # naranja
    elif nivel_id == 2:
        return "f1d255"  # amarillo
    elif nivel_id in [3, 4, 5]:
        return "1eaf8c"  # verde
    else:
        return "000000" 
def generar_docx_con_datos(informe_data):
    base_path = os.path.dirname(os.path.abspath(__file__))
    nombreInforme = f"informe{informe_data["tipoInforme"]}.docx"
    plantilla_path = os.path.join(base_path, "..", "template", nombreInforme)
    doc = DocxTemplate(plantilla_path)
    imagen = "" 
    grafico_radar = "" 
    if informe_data["idiomas"]:
        grafico_idiomas = generar_barras_idiomas(informe_data["idiomas"])
        imagen = InlineImage(doc, grafico_idiomas, width=Mm(120))  # ajustar tamaño según plantilla
    context = {
        "nombre": informe_data["evaluado"]["nombre"],
        "posicion": informe_data["posicion"],
        "departamento": informe_data["departamento"],
        "updated_date": informe_data["updated_date"],
        "formacionAcademica": informe_data["formacionAcademica"],
        "experienciaProfesional": informe_data["experienciaProfesional"],
        "idiomas": imagen,
        "capacidadPotencialFutura": informe_data["capacidadPotencialFutura"],
        "capacidadPotencialActual": informe_data["capacidadPotencialActual"],
        "cpa5": informe_data["cpa5"],
        "cpa10": informe_data["cpa10"],
        "modo": informe_data["modo"],
        "consultoraNombre": informe_data["consultoraNombre"],
        "conclusiones": informe_data["conclusiones"],
        "recomendaciones": informe_data["recomendaciones"],
        "propuestasDesarrollo": informe_data["propuestasDesarrollo"],
        "potencial": informe_data["potencial"],
        "disponibilidad": informe_data["disponibilidad"],
        "breveDescripcionDisponibilidad": informe_data["breveDescripcionDisponibilidad"],
        "comment_disponibilidad": informe_data["disponibilidadComment"],
        "balanceNivel": informe_data["balanceNivel"],
        "balanceDescripcion": informe_data["balanceDescripcion"],
    }
    competencias_context = []

    for nombre, datos in informe_data.get("competencias", {}).items():
        color = get_color_por_nivel(datos["ponderacion"])

        competencia_nivel = RichText()
        competencia_nivel.add(datos["nivelId"], color=color,bold=True)
        competencias_context.append({
            "competenciaNombre":  datos["competenciaNombre"],
            "valor": competencia_nivel,
            "comment": datos["comment"],
            "ponderacion": datos["ponderacion"],
            "anio": datos["anio"],
        })
        context["competencias"] = competencias_context
    competencias_para_grafico = []
    for nombre, datos in informe_data.get("competencias", {}).items():
        competencias_para_grafico.append({
            "competenciaNombre": datos["competenciaNombre"],  # Texto simple
            "valor": datos["nivelId"],
            "ponderacion": datos["ponderacion"],
            "anio": datos["anio"],
        })
    if competencias_para_grafico:
         grafico_radar = generar_grafico_radar(competencias_para_grafico)
         imagenRadar = InlineImage(doc, grafico_radar, width=Mm(120))
         context["radar"] = imagenRadar
    fortaleza_context = []
    
    for nombre, datos in informe_data.get("fortalezas", {}).items():
        fortaleza_context.append({
            "fortalezaNombre": datos["fortalezaNombre"],
            "comment": datos["comment"]
        })
    context["fortalezas"] = fortaleza_context
    
    areaDesarrollo_context = []
    for nombre, datos in informe_data.get("areaDesarrollo", {}).items():
        areaDesarrollo_context.append({
            "areaNombre": datos["areaNombre"],
            "comment": datos["comment"]
        })

    context["areaDesarrollo"] = areaDesarrollo_context
    context["currentYear"] = datetime.now().year
    motivaciones_context = []
    for nombre, datos in informe_data.get("motivaciones", {}).items():
        motivaciones_context.append({
            "aspiracion": nombre,
            "comment": datos["comment"],
            "breveDescripcion": datos["breveDescripcion"]
        })

    context["motivaciones"] = motivaciones_context
    doc.render(context)
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)
    return buffer


def generarInforme():
    informe = generarInformeCompleto(
            st.session_state.informe["evaluado"]["consultora"],
            st.session_state.informe["evaluado"]["id"]
        )
    if informe:
        buffer = generar_docx_con_datos(informe)
        nombre = informe['evaluado']['nombre'].strip().replace(" ", "_")
        file_name = f"informe_{informe["tipoInforme"]}_{nombre}"
        st.download_button(
            label="Descargar informe DOCX",
            data=buffer,
            file_name=f"{file_name}.docx",
            mime="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        )