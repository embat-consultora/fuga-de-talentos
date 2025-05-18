import streamlit as st
from docx import Document
import openai

openai.api_key = st.secrets["OPENAI_API_KEY"]  # o directamente ponelo como string

st.title("Analizador de Reportes con IA")

uploaded_file = st.file_uploader("Subí un documento (.docx)", type=["docx"])

def read_docx(file):
    doc = Document(file)
    return "\n".join([p.text for p in doc.paragraphs if p.text.strip() != ""])

if uploaded_file:
    content = read_docx(uploaded_file)
    st.subheader("Contenido del documento:")
    st.text_area("Texto extraído", content, height=300)

    if st.button("Obtener feedback IA"):
        with st.spinner("Analizando con IA..."):
            response = openai.ChatCompletion.create(
                model="gpt-4",
                messages=[
                    {"role": "system", "content": "Sos un experto en revisión de reportes."},
                    {"role": "user", "content": f"Leé este documento y dame feedback claro y profesional:\n\n{content}"}
                ]
            )
            feedback = response['choices'][0]['message']['content']
            st.success("Análisis completado:")
            st.markdown(feedback)
