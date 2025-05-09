import streamlit as st
from modules.data_base import getUserRolAndCompany

def redirect_by_role():
    rutas = {
        "admin": "pages/dashboard_admin.py",
        "psicologo": "pages/dashboard_psicologos.py",
        "pm": "pages/pm_usuarios.py",
        "consultora": "pages/consultora_calendar.py",
        "cliente": "pages/cliente_planning.py"
    }
    rol = st.session_state.get("role")
    if rol in rutas:
        st.switch_page(rutas[rol])
    else:
        st.error("Rol no reconocido.")

def load_user(email):
    response = getUserRolAndCompany("users", "email", email)
    if response:
        user = response[0]
        st.session_state.username = user["name"]
        st.session_state.userId = user["id"]
        st.session_state.role = user["roles"]["rol"]
        st.session_state.companyId = user["company"]["id"]
        st.session_state.company = user["company"]["nombre"]
        st.session_state.projectStartDate = user["company"]["project_start_date"]
        st.session_state.language = user["language"]
        st.session_state.logged_in = True
        return True
    return False

def is_authenticated():
    return (
        st.session_state.get("logged_in") or
        (hasattr(st, "user") and st.user and st.user.is_logged_in)
    )

def validate_get_user():
    if hasattr(st, "user") and st.user and st.user.is_logged_in:
        if "role" not in st.session_state:
            email = st.user.email
            if load_user(email):
                print('user loaded correctly')
                return True
            else:
                st.error("Tu cuenta de Google no está autorizada.")
                st.stop()

# Verificación inicial en cualquier página protegida
def is_logged():
    if not is_authenticated():
        st.warning("Redirigiendo al inicio de sesión...")
        st.session_state.logged_in = False
        st.session_state.redirected = True
        st.switch_page("app.py")
