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
    niveles_etiquetas = {}
    for idioma, datos in idiomas_data.items():
        nivel_nombre = datos["nivel"][0]["nombre"]
        nivel_valor = mapa_niveles.get(nivel_nombre, 0.0)
        idiomas_convertidos[idioma] = nivel_valor
        niveles_etiquetas[idioma] = nivel_nombre
    idiomas = list(idiomas_convertidos.keys())
    niveles = list(idiomas_convertidos.values())

    altura_figura = 0.5 if len(idiomas) == 1 else max(2, 0.5 * len(idiomas))
    altura_barra = 0.1 if len(idiomas) == 1 else 0.1
    fig, ax = plt.subplots(figsize=(5, altura_figura))
    y_pos = range(len(idiomas))

    # Barra de fondo
    # Barra de fondo (gris claro)
    ax.barh(y_pos, [1]*len(idiomas), color='#e6e6e6', edgecolor='none', height=altura_barra)

    # Barra de nivel (color)
    ax.barh(y_pos, niveles, color='#40a9a0', edgecolor='none', height=altura_barra)
    for i, idioma in enumerate(idiomas):
            ax.text(niveles[i] + 0.02, i, niveles_etiquetas[idioma], va='center', ha='left', fontsize=10)
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
    # ax.set_xticks(angulos[:-1])
    # ax.set_xticklabels(nombres, fontsize=9)
    
    ax.set_xticks([])

    # Dibujar etiquetas personalizadas más afuera del círculo
    for i, nombre in enumerate(nombres):
        ang = angulos[i]
        ax.text(
            ang,
            6.2,  # alejarlas del centro; ajustá este valor si querés más o menos distancia
            nombre,
            ha='center',
            va='center',
            fontsize=10,
            wrap=True
        )
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
 

