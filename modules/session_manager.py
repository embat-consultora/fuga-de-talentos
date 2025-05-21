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
        st.session_state.companyId = user["company"]["id"] if user["company"] and "id" in user["company"] else None
        st.session_state.company = user["company"]["nombre"] if user["company"] and "nombre" in user["company"] else None
        st.session_state.projectStartDate = user["company"]["project_start_date"] if user["company"] and "project_start_date" in user["company"] else None
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

def is_logged():
    if not is_authenticated():
        st.warning("Redirigiendo al inicio de sesión...")
        st.session_state.logged_in = False
        st.session_state.redirected = True
        st.switch_page("app.py")

def loadInforme(informe):
        st.session_state.informe = informe[0]
        idiomasInforme = []
        st.session_state.informe["competencias"] = {}
        for item in informe[0].get("informeIdiomaNiveles", []):
            idioma = item.get("idiomas", {})
            nivel = item.get("idiomaNivel", {})
            idiomasInforme.append({
                "id": idioma.get("id"),
                "nombre": idioma.get("idioma"),
                "nivel": nivel.get("nombre"),
                "nivel_id": nivel.get("id")
            })
        st.session_state.informe["idiomas"] = idiomasInforme

        competencias_dict = {}
        for item in informe[0].get("informeValoracionCompetencia", []):
            nombre_comp = item.get("competenciaNombre", "")
            competencias_dict[nombre_comp] = {
                "competencia": nombre_comp,
                "valoracion": item.get("nivelId", {}).get("nombre", ""),
                "comentario": item.get("texto", ""),
                "nivelId": item.get("nivelId", {}).get("id")
            }
        st.session_state.informe["competencias"] = competencias_dict
        
        st.session_state.informe["fortalezas"] = {}
        fortaleza_dict = {}
        for item in informe[0].get("informeFortalezas", []):
            nombre_form = item.get("nombre", "")
            fortaleza_dict[nombre_form] = {
                "nombreFortaleza": nombre_form,
                "comentario": item.get("comment", ""),
            }
        st.session_state.informe["fortalezas"] = fortaleza_dict
        
        st.session_state.informe["areaDesarrollo"] = {}
        area_dict = {}
        for item in informe[0].get("areaDesarrollo", []):
            nombre_area = item.get("nombre", "")
            area_dict[nombre_area] = {
                "nombreArea": nombre_area,
                "comentario": item.get("comment", ""),
            }
        st.session_state.informe["areaDesarrollo"] = area_dict
        aspiraciones_dict = {}
        for item in informe[0].get("informeAspiraciones", []):
            asp_data = item.get("aspiraciones", {})
            nombre_asp = asp_data.get("nombre", "")
            
            aspiraciones_dict[nombre_asp] = {
                "aspiracionId": asp_data.get("id", ""),
                "comentario": item.get("comment", ""),
                "breveDescripcion": item.get("breveDescripcion", ""),
            }

        st.session_state.informe["aspiraciones"] = aspiraciones_dict
        st.session_state.tipoInformeId = informe[0].get("tipoInformeId")
        