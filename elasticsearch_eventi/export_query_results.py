from elasticsearch import Elasticsearch
import csv
import os

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "zmEh=vkOg3MUepfR_q91"),
    verify_certs=False
)

index_name = "eventi"

output_dir = "elasticsearch_eventi/output_query"
os.makedirs(output_dir, exist_ok=True)


def esporta_documenti(nome_file, documenti):
    percorso = os.path.join(output_dir, nome_file)

    campi = [
        "titolo",
        "descrizione",
        "categoria",
        "data",
        "luogo",
        "organizzatore",
        "tag",
        "numero_partecipanti"
    ]

    with open(percorso, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=campi)
        writer.writeheader()

        for documento in documenti:
            documento = documento.copy()
            documento["tag"] = ", ".join(documento["tag"])
            writer.writerow(documento)


def esporta_aggregazione(nome_file, buckets):
    percorso = os.path.join(output_dir, nome_file)

    with open(percorso, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["categoria", "media_partecipanti"])

        for bucket in buckets:
            writer.writerow([
                bucket["key"],
                round(bucket["media_partecipanti"]["value"], 2)
            ])


# QUERY 1 - Ricerca per titolo

response = es.search(
    index=index_name,
    query={
        "match": {
            "titolo": "Python"
        }
    },
    size=20
)

documenti_query1 = [hit["_source"] for hit in response["hits"]["hits"]]

esporta_documenti(
    "query1_ricerca_titolo_python.csv",
    documenti_query1
)


# QUERY 2 - Eventi della categoria formazione

response = es.search(
    index=index_name,
    query={
        "term": {
            "categoria": "formazione"
        }
    },
    size=20
)

documenti_query2 = [hit["_source"] for hit in response["hits"]["hits"]]

esporta_documenti(
    "query2_categoria_formazione.csv",
    documenti_query2
)


# QUERY 3 - Ricerca tramite tag

response = es.search(
    index=index_name,
    query={
        "term": {
            "tag": "database nosql"
        }
    },
    size=20
)

documenti_query3 = [hit["_source"] for hit in response["hits"]["hits"]]

esporta_documenti(
    "query3_tag_database_nosql.csv",
    documenti_query3
)


# QUERY 4 - Media partecipanti per categoria

response = es.search(
    index=index_name,
    size=0,
    aggs={
        "media_per_categoria": {
            "terms": {
                "field": "categoria",
                "size": 20
            },
            "aggs": {
                "media_partecipanti": {
                    "avg": {
                        "field": "numero_partecipanti"
                    }
                }
            }
        }
    }
)

buckets = response["aggregations"]["media_per_categoria"]["buckets"]

esporta_aggregazione(
    "query4_media_partecipanti_categoria.csv",
    buckets
)

print("Output delle query esportati correttamente nella cartella elasticsearch_eventi/output_query.")