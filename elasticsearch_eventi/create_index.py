from elasticsearch import Elasticsearch

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "zmEh=vkOg3MUepfR_q91"),
    verify_certs=False
)

index_name = "eventi"

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

if not es.indices.exists(index=index_name):
    es.indices.create(index=index_name, body=mapping)
    print("Indice creato")
else:
    print("Indice già esistente")