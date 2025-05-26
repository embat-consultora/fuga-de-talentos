import streamlit as st
import importlib
from modules.components import top_menu
from modules.navigation import render_menu
from modules.session_manager import redirect_by_role ,validate_get_user
st.set_page_config(page_title="Inicio", page_icon="🧠", layout="wide")
if 'language' not in st.session_state:
    st.session_state.language = 'es' 
st.session_state["current_page"] = "home"
top_menu()
validate_get_user()
if 'role' in st.session_state:
    render_menu(st.session_state.role)
    redirect_by_role()
lang_module = importlib.import_module(f"location.{st.session_state.language}")
t = lang_module.texts
title, photo = st.columns([4,2])
with title: 
    st.title(t['homePageTitle'])
    st.subheader(t['homePageSubtitle'])
with photo:
    st.image("images/homePhoto.png")
# Benefits section
st.header(t['homeBenefits'])
st.write("""
- **Optimización del reclutamiento**: Ahorre tiempo con la inteligencia artificial que filtra y evalúa a los candidatos automáticamente.
- **Desarrollo continuo**: Capacite a su equipo con las mejores prácticas basadas en ciencia de comportamiento.
- **Mayor rendimiento**: Mejore el desempeño de sus empleados con herramientas personalizadas que se ajustan a sus habilidades y crecimiento.
- **Reducción de rotación**: Encuentre a los candidatos ideales para su empresa y mantenga una fuerza laboral estable.
""")

# Client Testimonials (Cards)
st.header(t['homeClientsTitle'])


for a in t['homeTestimonial']:
    with st.expander(a['name']):
        st.write(a['testimonial'])



st.markdown("""
<hr style="margin-top: 50px;"/>
<div style='text-align: center; padding: 10px; font-size: 0.9em; color: gray;'>
    © 2025 P+Data · 
    <a href="https://p-data.streamlit.app/privacy" target="_blank">Privacy Policy</a> · 
    <a href="https://p-data.streamlit.app/terms" target="_blank">Terms & Conditions</a>
</div>
""", unsafe_allow_html=True)