import matplotlib.pyplot as plt
import io
import numpy as np
import tempfile
import streamlit as st


def generar_barras_idiomas(idiomas_data):
    mapa_niveles = {
    "Básico": 0.4,
    "Intermedio": 0.6,
    "Avanzado": 0.8,
    "Nativo": 1.0
}
    idiomas_convertidos = {}
    for idioma, datos in idiomas_data.items():
        nivel_nombre = datos["nivel"][0]["nombre"]
        nivel_valor = mapa_niveles.get(nivel_nombre, 0.0)
        idiomas_convertidos[idioma] = nivel_valor

    idiomas = list(idiomas_convertidos.keys())
    niveles = list(idiomas_convertidos.values())

    fig, ax = plt.subplots(figsize=(4, 2))
    y_pos = range(len(idiomas))

    # Barra de fondo
    ax.barh(y_pos, [1]*len(idiomas), color='#e6e6e6', edgecolor='none', height=0.3)

    # Barra de nivel
    ax.barh(y_pos, niveles, color='#a6c8e0', edgecolor='none', height=0.3)

    # Etiquetas
    ax.set_yticks(y_pos)
    ax.set_yticklabels(idiomas)

    # Estética
    ax.set_xlim(0, 1)
    ax.set_xticks([])
    ax.invert_yaxis()
    ax.spines[['top', 'right', 'bottom', 'left']].set_visible(False)
    ax.tick_params(left=False)

    # Guardar en un buffer
    buffer = io.BytesIO()
    plt.tight_layout()
    plt.savefig(buffer, format='png', bbox_inches='tight', transparent=True)
    plt.close(fig)
    buffer.seek(0)

    return buffer
 

def generar_grafico_radar(categorias):
       # Extraer nombres y ponderaciones
    nombres = [c["competenciaNombre"] for c in categorias]
    valores = [c["ponderacion"] for c in categorias]
    anio = categorias[0].get("anio", "Evaluación")
    # Cerrar el círculo
    nombres_ext = nombres + [nombres[0]]
    valores_ext = valores + [valores[0]]

    # Calcular ángulos
    angulos = np.linspace(0, 2 * np.pi, len(nombres_ext), endpoint=True)

    # Crear gráfico
    fig, ax = plt.subplots(figsize=(6, 6), subplot_kw=dict(polar=True))

    # Graficar
    ax.plot(angulos, valores_ext, label=anio, linestyle='solid', color='navy')
    ax.fill(angulos, valores_ext, alpha=0.1, color='navy')

    # Estética
    ax.set_xticks(angulos[:-1])  # Sin el duplicado
    ax.set_xticklabels(nombres)

    ax.set_ylim(0, 5) 
    ax.set_yticks([1, 2, 3, 4, 5])
    ax.set_yticklabels(['1', '2', '3', '4', '5'], color='gray', size=8)

    ax.legend(loc='upper right', bbox_to_anchor=(1.1, 1.1))

    # Guardar a buffer
    buffer = io.BytesIO()
    plt.tight_layout()
    plt.savefig(buffer, format='png', bbox_inches='tight', transparent=True)
    plt.close(fig)
    buffer.seek(0)

    return buffer
 

