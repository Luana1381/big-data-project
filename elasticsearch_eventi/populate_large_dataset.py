from elasticsearch import Elasticsearch
from datetime import date, timedelta
import random

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "zmEh=vkOg3MUepfR_q91"),
    verify_certs=False
)

index_name = "eventi"

# Elimina l'indice esistente

if es.indices.exists(index=index_name):
    es.indices.delete(index=index_name)

# Ricrea l'indice

mapping = {
    "mappings": {
        "properties": {
            "titolo": {"type": "text"},
            "descrizione": {"type": "text"},
            "categoria": {"type": "keyword"},
            "data": {"type": "date"},
            "luogo": {"type": "text"},
            "organizzatore": {"type": "text"},
            "tag": {"type": "keyword"},
            "numero_partecipanti": {"type": "integer"}
        }
    }
}

es.indices.create(index=index_name, body=mapping)

categorie = [
    "orientamento",
    "formazione",
    "seminario",
    "benessere",
    "workshop",
    "ricerca",
    "innovazione",
    "career day",
    "networking",
    "conferenza",
    "hackathon",
    "summer school"
]

luoghi = [
    "Aula Magna",
    "Studium 5",
    "Laboratorio informatico",
    "Sala Conferenze",
    "Biblioteca",
    "Università del Salento",
    "Campus Ecotekne",
    "Aula Vetrata"
]

organizzatori = [
    "Area Data Science",
    "Corso di Big Data",
    "Università del Salento",
    "Progetto Proben",
    "Dipartimento di Scienze Umane e Sociali"
]

titoli = [
    "Open Day",
    "Workshop",
    "Seminario",
    "Laboratorio",
    "Career Day",
    "Conferenza",
    "Incontro",
    "Hackathon",
    "Evento",
    "Masterclass"
]

argomenti = [
    "Data Science",
    "Python",
    "Big Data",
    "Machine Learning",
    "Intelligenza Artificiale",
    "Benessere Universitario",
    "Ricerca Scientifica",
    "Innovazione Digitale",
    "Database NoSQL",
    "Analisi dei Dati"
]

base_date = date(2026, 1, 1)

for i in range(1, 81):

    argomento = random.choice(argomenti)
    categoria = random.choice(categorie)

    evento = {
        "titolo": f"{random.choice(titoli)} {argomento}",
        "descrizione": f"Evento dedicato a {argomento} con attività formative e divulgative.",
        "categoria": categoria,
        "data": str(base_date + timedelta(days=i * 5)),
        "luogo": random.choice(luoghi),
        "organizzatore": random.choice(organizzatori),
        "tag": [
            argomento.lower(),
            categoria.replace(" ", "_")
        ],
        "numero_partecipanti": random.randint(30, 300)
    }

    es.index(
        index=index_name,
        id=i,
        document=evento
    )

print("Indice popolato con 80 eventi.")