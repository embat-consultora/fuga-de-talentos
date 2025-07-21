import matplotlib.pyplot as plt
import io
import numpy as np

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
    paleta = ['#40a9a0', '#f4b400', '#e67c73', '#34a853', '#4285f4', '#9c27b0']
    colores = [paleta[i % len(paleta)] for i in range(len(idiomas))]
    altura_figura = 0.5 if len(idiomas) == 1 else max(1.5, 0.45 * len(idiomas))
    altura_barra = 0.1 if len(idiomas) == 1 else 0.5
    fig, ax = plt.subplots(figsize=(5, altura_figura))
    y_pos = range(len(idiomas))

    # Barra de fondo
    # Barra de fondo (gris claro)
    ax.barh(y_pos, [1]*len(idiomas), color='#e6e6e6', edgecolor='none', height=altura_barra)

    # Barra de nivel (color)
    ax.barh(y_pos, niveles, color=colores, edgecolor='none', height=altura_barra)
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
    ax.set_theta_zero_location('N')       # 0° apunta hacia arriba
    ax.set_theta_direction(-1)   
    # Graficar
    ax.plot(angulos, valores_ext, label=anio, linestyle='solid', color='navy')
    ax.fill(angulos, valores_ext, alpha=0.1, color='navy')
    
    ax.set_xticks(angulos[:-1]) 
    ax.set_xticklabels([''] * len(nombres)) 
    # Dibujar etiquetas personalizadas más afuera del círculo
    for i, nombre in enumerate(nombres):
        ang = angulos[i]
        ax.text(
            ang,
            6,  # alejarlas del centro; ajustá este valor si querés más o menos distancia
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

# def generar_grafico_radar(categorias):
#     df = pd.DataFrame({
#         "variable": [c["competenciaNombre"] for c in categorias],
#         "valor": [c["ponderacion"] for c in categorias]
#     })
#     df = pd.concat([df, df.iloc[[0]]], ignore_index=True)

#     fig = px.line_polar(
#         df,
#         r="valor",
#         theta="variable",
#         line_close=True,
#         range_r=[0, 5],
#         title=categorias[0].get("anio", "Evaluación"),
#         template="plotly_white"
#     )

#     fig.update_traces(line_color="navy", fill=None)

#     fig.update_layout(
#         showlegend=False,
#         polar=dict(
#             radialaxis=dict(
#                 tickvals=[1, 2, 3, 4, 5],
#                 tickfont_size=10,
#                 visible=True,
#                 range=[0, 5],
#                 showline=True,
#                 showgrid=True,
#                 gridcolor='gray',    # 👉 color más oscuro
#                 gridwidth=1   
#             ),  
#             angularaxis=dict(
#                 showline=True,
#                 showgrid=True,
#                 gridcolor='gray',    # 👉 también afecta las líneas radiales
#                 gridwidth=1
#             )
#         ),
#         margin=dict(l=80, r=80, t=80, b=80),
#     )

#     # Guardar como imagen en BytesIO
#     buffer = io.BytesIO()
#     pio.write_image(fig, buffer, format="png", width=500, height=500)
#     buffer.seek(0)
#     return buffer

 

