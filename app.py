import streamlit as st
from modules.data_base import getEqual
import importlib
from modules.session_manager import redirect_by_role, load_user, validate_get_user

# Configuración inicial
st.set_page_config(page_title="Inicio", page_icon="🧠")
lang_module = importlib.import_module("location.es")
t = lang_module.texts
st.image("images/embat.png", width=200)

st.markdown(
    f"<h1 style='text-align: center;'>{t['title']}</h1>",
    unsafe_allow_html=True
)

st.session_state["current_page"] = "streamlit_app"

# ✅ Si ya está logueado por cualquier medio, redirige
if st.session_state.get("logged_in"):
    redirect_by_role()
    st.stop()

# ✅ Si viene del login con Google y no hay sesión cargada aún
islogged =validate_get_user()
if islogged:
    redirect_by_role()
# 💻 Login tradicional
username = st.text_input(t["username"], placeholder="Ingrese email")
password = st.text_input(t["password"], type="password", placeholder="Ingrese contraseña")
st.markdown(
    f'<div style="text-align: right;"><a href="mailto:support@embatconsultora.com">{t["forgotPassword"]}</a></div>',
    unsafe_allow_html=True
)
if st.button(t["loginButton"], type="primary"):
    response = getEqual("users", "email", username)
    if response:
        user = response[0]
        if user["password"] == password:
            load_user(user["email"])
            st.rerun()
        else:
            st.error(t["IncorrectPassword"])
    else:
        st.error(t["IncorrectPassword"])

st.write('')
if st.button("Iniciar sesión con Google"):
    st.login("google")

