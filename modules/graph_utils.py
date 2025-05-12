import matplotlib.pyplot as plt
from docxtpl import DocxTemplate, InlineImage
from docx.shared import Mm
import io

def crear_grafico_idiomas(idiomas_data):
    fig, ax = plt.subplots(figsize=(6, 2))
    niveles = [info["nivel"] for info in idiomas_data.values()]
    etiquetas = list(idiomas_data.keys())
    colores = ['#f28e8e', '#f7ca88', '#a8d5a2', '#99d9ea']  # colores suaves

    ax.barh(etiquetas, niveles, color=colores[:len(etiquetas)])
    ax.set_xlim(0, 10)
    ax.set_xlabel('Nivel')
    ax.set_title('Idiomas y nivel')

    for i, v in enumerate(niveles):
        ax.text(v + 0.2, i, str(v), va='center')

    plt.tight_layout()

    img_stream = io.BytesIO()
    plt.savefig(img_stream, format='png')
    img_stream.seek(0)
    plt.close()
    return img_stream
