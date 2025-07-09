import streamlit as st
from modules.navigation import render_menu
from modules.session_manager import is_logged,validate_get_user
from modules.utils import getLanguage
from modules.page_utils import apply_page_config
from modules.components import top_menu

st.session_state["current_page"] = "clients_dashboard"
apply_page_config()
top_menu()
is_logged()
validate_get_user()
lang = getLanguage(st.session_state.language)
render_menu(st.session_state.role)
st.markdown(
    f"<h2 style='text-align: center;'>{lang['menuClientDashboard']}</h2>",
    unsafe_allow_html=True
)

@st.cache_data
def get_dashboard_looker_url():
    st.components.v1.iframe('https://lookerstudio.google.com/embed/reporting/92a76695-b4eb-401b-a25c-3c92a62fedf1/page/qyBQF', width=1000, height=1000)

get_dashboard_looker_url()
