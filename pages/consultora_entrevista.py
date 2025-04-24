import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config
from modules.session_manager import validate_get_user,is_logged
from modules.utils import getLanguage
apply_page_config()

is_logged()
validate_get_user()
render_menu(st.session_state.role)

lang = getLanguage(st.session_state.language)

st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleInterview']}</h2>",
    unsafe_allow_html=True
)