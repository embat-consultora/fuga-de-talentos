import streamlit as st
from modules.data_base import addUser, get
import random
from modules.navigation import render_menu
from modules.session_manager import is_logged,validate_get_user
from modules.utils import getLanguage
import string
from variables import languages, roles
import pandas as pd
from modules.page_utils import apply_page_config

apply_page_config()

is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)
st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleUsers']}</h2>",
    unsafe_allow_html=True
)

usuarios = get("users") or []
companias = get("company") or []

# Diccionario: id → nombre de la compañía
companias_dict = {c["id"]: c["nombre"] for c in companias if "id" in c and "nombre" in c}

# Agregar nombre de compañía a cada usuario
for u in usuarios:
    company_id = u.get("companyId")
    u["company_nombre"] = companias_dict.get(company_id, "—")

# Filtro de compañías
nombres_companias = sorted(set(u["company_nombre"] for u in usuarios))
nombres_companias.insert(0, "Todas")

col1, col2, col3 = st.columns(3)
filtro_compania = col1.selectbox("Compañía", nombres_companias)
filtro_email = col2.text_input("Emails")
filtro_estado = col3.selectbox("Estado", ["Todos", "Activo", "Inactivo"])

# Aplicar filtros
usuarios_filtrados = [
    u for u in usuarios
    if (filtro_compania == "Todas" or u["company_nombre"] == filtro_compania)
    and (filtro_email.lower() in u["email"].lower())
    and (filtro_estado == "Todos" or u["estado"] == filtro_estado)
]

# Columnas visibles
columnas_visibles = {
    "name": "Nombre",
    "email": "Email",
    "company_nombre": "Compañía",
    "language": "Lenguaje",
    "role": "Rol",
    "password": "Contraseña"
}

usuarios_formateados = [
    {col: u.get(col, "") for col in columnas_visibles.keys()}
    for u in usuarios_filtrados
]

df_usuarios = pd.DataFrame(usuarios_formateados)
df_usuarios.rename(columns=columnas_visibles, inplace=True)

if not df_usuarios.empty:
    st.dataframe(df_usuarios, hide_index=True, use_container_width=True)
else:
    st.info("No se encontraron usuarios con esos filtros.")

# ------------------ CREAR NUEVO USUARIO ------------------

st.subheader("👤 Nuevo usuario")

name = st.text_input("Nombre completo")
email = st.text_input("Email")

# Selección de compañía por nombre, guardando el ID
company_names = {c["nombre"]: c["id"] for c in companias}
selected_company_name = st.selectbox("Compañía", list(company_names.keys()))
company_id = company_names[selected_company_name]

language = st.selectbox("Idioma", languages)
rol = st.selectbox("Rol", roles)
def generate_password(length=10):
    chars = string.ascii_letters + string.digits
    return ''.join(random.choice(chars) for _ in range(length))

if st.button("Crear usuario"):
    if name and email and company_id:
        password = generate_password()

        user_data = {
            "name": name,
            "email": email,
            "companyId": company_id,
            "language": language,
            "password": password,
            "estado": "Activo",
            "role":rol
        }

        try:
            addUser(user_data)
            st.success(f"Usuario creado correctamente. Contraseña: `{password}`")
            st.rerun()
        except Exception as e:
            st.error(f"Ocurrió un error al guardar el usuario: {e}")
    else:
        st.warning("Por favor completá todos los campos.")
