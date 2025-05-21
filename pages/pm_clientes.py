import streamlit as st
from modules.data_base import get, addCompany, updateCompanyEstado, addCompetencias, addCompetenciasCompany
from modules.utils import getLanguage
import pandas as pd
from modules.page_utils import apply_page_config
from modules.navigation import render_menu
from modules.session_manager import is_logged,validate_get_user
from modules.components import top_menu
from modules import tables
st.session_state["current_page"] = "pm_clientes"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)

st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleClients']}</h2>",
    unsafe_allow_html=True
)

companies = get(tables.companyTable) or []
competencias = get(tables.competenciasTable) or []
competenciaXcompany = get(tables.competenciasCompany) or []

# Obtener estados únicos y agregar opción "Todos"
estados_disponibles = sorted(set(c["estado"] for c in companies if "estado" in c))
estados_disponibles.insert(0, "Todos")

col1, col2 = st.columns(2)
filtro_nombre = col1.text_input("Nombre")
filtro_estado = col2.selectbox("Estado", estados_disponibles)

# Filtrar compañías
companias_filtradas = [
    c for c in companies
    if (filtro_nombre.lower() in c["nombre"].lower())
    and (filtro_estado == "Todos" or c["estado"] == filtro_estado)
]

# Mostrar tabla filtrada
columnas_visibles = {
    "nombre": "Nombre",
    "telefono": "Teléfono",
    "emailContacto": "Email de contacto",
    "estado": "Estado"
}

companias_formateadas = [
    {col: c.get(col, "") for col in columnas_visibles.keys()}
    for c in companias_filtradas
]

df_companias = pd.DataFrame(companias_formateadas)
df_companias.rename(columns=columnas_visibles, inplace=True)

if not df_companias.empty:
    st.dataframe(df_companias, use_container_width=True, hide_index=True)
else:
    st.info("No se encontraron compañías con esos filtros.")

with st.expander("🏢 Nueva compañía"):
    col1, col2 = st.columns(2)
    nombre = col1.text_input("Nombre de la compañía")
    telefono = col2.text_input("Teléfono")
    col3, col4 = st.columns(2)
    email_contacto = col3.text_input("Email de contacto")
    estado = col4.selectbox("Estado", ["Activo", "Inactivo"])

    if st.button("Crear compañía"):
        if nombre and telefono and email_contacto:
            data = {
                "nombre": nombre,
                "telefono": telefono,
                "emailContacto": email_contacto,
                "estado": estado
            }

            try:
                addCompany(data)
                st.success(f"Compañía '{nombre}' creada correctamente.")
                st.rerun()
            except Exception as e:
                st.error(f"Ocurrió un error al guardar la compañía: {e}")
        else:
            st.warning("Por favor completá todos los campos.")

with st.expander("Agregar competencias a compañía"):
    company_names = [c["nombre"] for c in companies]
    selected_company = st.selectbox("Seleccionar compañía", company_names, key="companySelector")
    companySelected = next((e for e in companies if e['nombre'] == selected_company), None)

    st.write("Seleccioná competencias para asignar:")
    selected_to_add = []

    if competencias:
        for comp in competencias:
            already_assigned = any(
                rel["companyId"] == companySelected["id"] and rel["competenciaId"] == comp["id"]
                for rel in competenciaXcompany
            )

            if st.checkbox(comp["nombre"], value=already_assigned, key=f"{companySelected['id']}_{comp['id']}"):
                data_comp_comp = {
                "competenciaId": comp['id'],
                "companyId": companySelected['id']
            }
                datac= addCompetenciasCompany(data_comp_comp)
                if datac:
                    st.toast("Competencia asignada")
    else:
        st.info("No hay competencias disponibles.")

    new_comp = st.text_input("No esta la competencia que buscas? Agregala")
    if st.button("Agregar competencia(s)"):
        data_comp = {
                "nombre":new_comp
            }
        data = addCompetencias(data_comp)
        if data:
            st.toast("Competencia agregada")



with st.expander("🔄 Cambiar estado de una compañía"):
    company_names = [c["nombre"] for c in companies]
    selected_company = st.selectbox("Seleccionar compañía", company_names)
    nuevo_estado = st.selectbox("Nuevo estado", ["Activo", "Inactivo"])

    if st.button("Actualizar estado"):
        try:
            updateCompanyEstado(selected_company, nuevo_estado)
            st.success(f"Estado de '{selected_company}' actualizado a {nuevo_estado}.")
            st.rerun()
        except Exception as e:
            st.error(f"No se pudo actualizar el estado: {e}")
