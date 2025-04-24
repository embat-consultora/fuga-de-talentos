import streamlit as st
from modules.utils import getLanguage
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import is_logged,validate_get_user
apply_page_config()

is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)

st.markdown(
    f"<h2 style='text-align: center;'>{lang['titlePreliminarData']}</h2>",
    unsafe_allow_html=True
)