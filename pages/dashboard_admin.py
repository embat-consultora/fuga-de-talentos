import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged
from modules.components import top_menu
from modules.utils import getLanguage
st.session_state["current_page"] = "dashboard_admin"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)

st.title("Panel de Admin")