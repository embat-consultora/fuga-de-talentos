from docxtpl import DocxTemplate
import io
import os
from modules.data_base import generarInformeCompleto
import streamlit as st
def generar_docx_con_datos(informe_data):
    base_path = os.path.dirname(os.path.abspath(__file__))
    plantilla_path = os.path.join(base_path, "..", "template", "informeCompleto.docx")
    doc = DocxTemplate(plantilla_path)
    context = {
        "nombre": informe_data["evaluado"]["nombre"],
        "posicion": informe_data["posicion"],
        "departamento": informe_data["departamento"],
        "fecha": informe_data["fecha"],
        "formacionAcademica": informe_data["formacionAcademica"],
        "experienciaProfesional": informe_data["experienciaProfesional"],
        "idiomas": ", ".join([
            f'{idioma}: nivel {info["nivel"]}'
            for idioma, info in informe_data["Idiomas"].items()
        ])
    }

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