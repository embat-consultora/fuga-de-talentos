import streamlit as st
from modules.navigation import render_menu
from modules.page_utils import apply_page_config, createCalendar
from modules.session_manager import validate_get_user, is_logged
from googleapiclient.discovery import build
from google.oauth2.credentials import Credentials
from modules.data_base import getAuthToken, saveAuthToken
import datetime
from modules.utils import getLanguage
from streamlit_oauth import OAuth2Component
from datetime import datetime,timezone
st.session_state["current_page"] = "consultora_calendar"
apply_page_config()
is_logged()
validate_get_user()
render_menu(st.session_state.role)
lang = getLanguage(st.session_state.language)

st.markdown(
    f"<h2 style='text-align: center;'>{lang['titleCalendar']}</h2>",
    unsafe_allow_html=True
)

CLIENT_ID=st.secrets["auth"]["google"]["client_id"]
CLIENT_SECRET=st.secrets["auth"]["google"]["client_secret"]
AUTHORIZE_URL=st.secrets["auth"]["google"]["authorize_url"]
TOKEN_URL=st.secrets["auth"]["google"]["token_url"]
SCOPE=st.secrets["auth"]["google"]["scope"]
REDIRECT_URI=st.secrets["auth"]["google"]["redirect_uri"]
oauth2 = OAuth2Component(CLIENT_ID, CLIENT_SECRET, AUTHORIZE_URL, TOKEN_URL)

email = getattr(st.experimental_user, "email", None) 

# Intentar obtener token guardado
token_data = getAuthToken(email)
if token_data and 'token' not in st.session_state:
    st.session_state.token = token_data

# Autorización del usuario
if 'token' not in st.session_state:
    result = oauth2.authorize_button(lang["connectToGoogle"], REDIRECT_URI, SCOPE, extras_params={"access_type": "offline", "prompt": "consent"})
    if result and 'token' in result:
        st.session_state.token = result.get('token')
        expires_at_unix = result['token'].get('expires_at')
        expires_at_dt = datetime.fromtimestamp(expires_at_unix, tz=timezone.utc) if expires_at_unix else None
        expires_at_str = expires_at_dt.isoformat() if expires_at_dt else None
        data = {
        "email": email,
        "access_token": result['token']['access_token'],
        "refresh_token":  result['token']['refresh_token'],
        "token_expiry": expires_at_str
    }
        saveAuthToken(data)
        st.rerun()
else:
    token = st.session_state.token
    google_creds = Credentials(
        token= token.get('access_token'),
        refresh_token=token.get('refresh_token'),
        token_uri=TOKEN_URL,
        client_id=CLIENT_ID,
        client_secret=CLIENT_SECRET
    )

    service = build("calendar", "v3", credentials=google_creds)
    now = datetime.now(timezone.utc).isoformat()
    events_result = service.events().list(
        calendarId='primary', timeMin=now, maxResults=10, singleEvents=True, orderBy='startTime'
    ).execute()
    events = events_result.get("items", [])
    col1,col2,col3 = st.columns(3)
    with col3:
        st.link_button(lang["calendarLinkButton"], "https://calendar.google.com")
    if not events:
            st.info(lang["calendarNoEvents"])
    else:
        createCalendar(events)
