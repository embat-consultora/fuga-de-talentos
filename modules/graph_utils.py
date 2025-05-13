import matplotlib.pyplot as plt
import io

niveles_valor = {
    "Básico": 30,
    "Intermedio": 60,
    "Avanzado": 90,
    "Nativo": 100
}

def crear_grafico_idiomas(idiomas_data):
    labels = []
    values = []
    
    for idioma, datos in idiomas_data.items():
        nivel_nombre = datos["nivel"][0]["nombre"]
        valor = niveles_valor.get(nivel_nombre, 0)
        labels.append(f"{idioma} - {nivel_nombre}")
        values.append(valor)

    colors = ['#EF5350', '#FFCA28', '#81C784', '#64B5F6'] * ((len(labels) // 4) + 1)
    colors = colors[:len(labels)]

    fig, ax = plt.subplots(figsize=(6, 0.6 * len(labels)))
    for spine in ax.spines.values():
        spine.set_visible(False)
    bars = ax.barh(range(len(labels)), values, color=colors, height=0.4)

    # Mostrar etiquetas personalizadas
    ax.set_yticks(range(len(labels)))
    ax.set_yticklabels(labels)
    ax.invert_yaxis()
    ax.set_xlim(0, 100)
    ax.tick_params(left=False, bottom=False)
    ax.set_xticks([])

    # Mostrar porcentajes
    plt.tight_layout()

    # Guardar en un buffer
    buffer = io.BytesIO()
    plt.savefig(buffer, format='png', bbox_inches='tight')
    plt.close(fig)
    buffer.seek(0)
    return buffer


