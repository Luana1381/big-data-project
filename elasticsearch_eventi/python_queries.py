from elasticsearch import Elasticsearch

es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "zmEh=vkOg3MUepfR_q91"),
    verify_certs=False
)

index_name = "eventi"

# QUERY 1
print("\n=== QUERY 1: Ricerca per titolo ===")

response = es.search(
    index=index_name,
    query={
        "match": {
            "titolo": "Python"
        }
    }
)

for hit in response["hits"]["hits"]:
    print(hit["_source"])


# QUERY 2
print("\n=== QUERY 2: Eventi della categoria formazione ===")

response = es.search(
    index=index_name,
    query={
        "term": {
            "categoria": "formazione"
        }
    }
)

for hit in response["hits"]["hits"]:
    print(hit["_source"])


# QUERY 3
print("\n=== QUERY 3: Ricerca tramite tag ===")

response = es.search(
    index=index_name,
    query={
        "term": {
            "tag": "database"
        }
    }
)

for hit in response["hits"]["hits"]:
    print(hit["_source"])


# QUERY 4
print("\n=== QUERY 4: Media partecipanti per categoria ===")

response = es.search(
    index=index_name,
    size=0,
    aggs={
        "media_per_categoria": {
            "terms": {
                "field": "categoria"
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

for bucket in response["aggregations"]["media_per_categoria"]["buckets"]:
    print(
        bucket["key"],
        "->",
        round(bucket["media_partecipanti"]["value"], 2)
    )