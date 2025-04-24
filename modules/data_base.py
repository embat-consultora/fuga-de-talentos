import streamlit as st
from supabase import create_client, Client
from dotenv import load_dotenv
import os

load_dotenv()

url = os.getenv("SUPABASE_URL")
key = os.getenv("SUPABASE_KEY")

supabase: Client = create_client(url, key)

def get(tableName):
    response = supabase.table(tableName).select('*').execute()
    return response.data

def addUser(user_data):
    response = supabase.table('users').insert(user_data).execute()
    return response


def getEqual(tableName, variable, value):
    response = supabase.table(tableName).select('*').eq(variable, value).execute()
    return response.data

def addCompany(data):
    return supabase.table('company').insert(data).execute()

def updateCompanyEstado(company_name, nuevo_estado):
    return supabase.table('company').update({"estado": nuevo_estado}).eq("nombre", company_name).execute()

def saveAuthToken(data):
    return supabase.table('auth_tokens').insert(data).execute()

def getAuthToken(email):
    response = supabase.table('auth_tokens').select('*').eq('email', email).execute()
    if response.data:
        return response.data[0]  # ✅ Devolvemos el primer resultado como dict
    return None