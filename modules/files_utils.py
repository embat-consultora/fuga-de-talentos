from docxtpl import DocxTemplate
import io
import os
from modules.data_base import generarInformeCompleto
import streamlit as st
from modules.graph_utils import crear_grafico_idiomas
from docx.shared import Mm
from docxtpl import DocxTemplate, InlineImage

def generar_docx_con_datos(informe_data):
    base_path = os.path.dirname(os.path.abspath(__file__))
    plantilla_path = os.path.join(base_path, "..", "template", "informeCompleto.docx")
    doc = DocxTemplate(plantilla_path)
    grafico_idiomas = crear_grafico_idiomas(informe_data["idiomas"])
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
        "consutoraNombre": informe_data["consultoraNombre"],
        "conclusiones": informe_data["conclusiones"],
        "recomendaciones": informe_data["recomendaciones"],
        "propuestasDesarrollo": informe_data["propuestasDesarrollo"],
    }
    competencias_context = []

    for nombre, datos in informe_data.get("Competencias", {}).items():
        competencias_context.append({
            "competenciaNombre": datos["competenciaNombre"],
            "valor": datos["nivelId"][0]["nombre"],
            "comment": datos["comment"]
        })

    context["competencias"] = competencias_context
    doc.render(context)
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)
    return buffer


def generarInforme():
    informe = generarInformeCompleto(
            st.session_state["userId"],
            st.session_state.informe["evaluado"]["id"]
        )
    if informe:
        buffer = generar_docx_con_datos(informe)
        st.download_button(
            label="Descargar informe DOCX",
            data=buffer,
            file_name=f"informe_{informe['evaluado']['nombre']}.docx",
            mime="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        )