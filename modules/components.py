
import streamlit as st
from variables import idiomas, mapeo_idiomas
def top_menu():
    mapeo_inverso = {v: k for k, v in mapeo_idiomas.items()}
    if "language" not in st.session_state:
        st.session_state.language = "es" 

    idioma_actual = mapeo_idiomas.get(st.session_state.language, "Español")
    col1, col4, col2, col3 = st.columns([1, 5, 1,1]) 
    if "logged_in" not in st.session_state:
        st.session_state.logged_in = False 

    with col2:
        seleccionado = st.selectbox(
            "",
            idiomas,
            index=idiomas.index(idioma_actual),
            key="language_select"
        )
        st.session_state.language = mapeo_inverso[seleccionado]
    
    if st.session_state.current_page=="login":
        print('login page')
    else:
        with col3:
            st.text('')
            st.write('')
            if hasattr(st, 'user'):
                st.text(st.user.name)
            elif 'logged_in' in st.session_state and st.session_state.logged_in is not None:
                if st.session_state.logged_in:
                    st.text(st.session_state.name)
                else:
                    if st.button("Login"):
                        st.switch_page("pages/login.py")
            else:
                if st.button("Login"):
                    st.switch_page("pages/login.py")
