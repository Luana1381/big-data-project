from elasticsearch import Elasticsearch

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "zmEh=vkOg3MUepfR_q91"),
    verify_certs=False
)

index_name = "eventi"

eventi = [
    {
        "titolo": "Open Day Data Science",
        "descrizione": "Evento di orientamento dedicato alla presentazione del corso di laurea magistrale in Data Science.",
        "categoria": "orientamento",
        "data": "2026-03-15",
        "luogo": "Università del Salento",
        "organizzatore": "Dipartimento di Scienze Umane e Sociali",
        "tag": ["data science", "università", "orientamento"],
        "numero_partecipanti": 120
    },
    {
        "titolo": "Laboratorio di Python",
        "descrizione": "Laboratorio pratico per studenti sulla programmazione Python e sull'analisi dei dati.",
        "categoria": "formazione",
        "data": "2026-04-10",
        "luogo": "Laboratorio informatico",
        "organizzatore": "Area Data Science",
        "tag": ["python", "programmazione", "dati"],
        "numero_partecipanti": 45
    },
    {
        "titolo": "Seminario su Intelligenza Artificiale",
        "descrizione": "Seminario dedicato alle applicazioni sociali e tecnologiche dell'intelligenza artificiale.",
        "categoria": "seminario",
        "data": "2026-05-08",
        "luogo": "Aula Magna",
        "organizzatore": "Università del Salento",
        "tag": ["AI", "tecnologia", "società"],
        "numero_partecipanti": 180
    },
    {
        "titolo": "Incontro sul benessere universitario",
        "descrizione": "Evento dedicato al benessere psicologico, relazionale e sociale degli studenti universitari.",
        "categoria": "benessere",
        "data": "2026-05-20",
        "luogo": "Studium 5",
        "organizzatore": "Progetto Proben",
        "tag": ["benessere", "studenti", "università"],
        "numero_partecipanti": 70
    },
    {
        "titolo": "Workshop Big Data",
        "descrizione": "Workshop sulle tecnologie Big Data, database NoSQL e analisi di grandi quantità di dati.",
        "categoria": "formazione",
        "data": "2026-06-12",
        "luogo": "Aula informatica",
        "organizzatore": "Corso di Big Data",
        "tag": ["big data", "nosql", "database"],
        "numero_partecipanti": 60
    }
]

for i, evento in enumerate(eventi, start=1):
    es.index(index=index_name, id=i, document=evento)

print("Documenti inseriti correttamente")
