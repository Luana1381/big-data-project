# Traccia 3 - Archivio Eventi con Elasticsearch

## Descrizione

Questa parte del progetto realizza un database NoSQL orientato ai documenti tramite **Elasticsearch**.

La traccia relativa a Elasticsearch era libera; per questo motivo è stato scelto il caso d'uso di un **archivio di eventi universitari, formativi e culturali**.

Ogni evento viene rappresentato come un documento JSON, cioè come una struttura flessibile composta da campi testuali, campi numerici, date e liste di tag.

La scelta di Elasticsearch è adatta a questo scenario perché permette di effettuare ricerche testuali sui contenuti descrittivi degli eventi, applicare filtri su campi strutturati e calcolare aggregazioni statistiche sui dati numerici.

---

## Struttura del documento

Ogni documento dell'indice rappresenta un evento e contiene i seguenti campi:

- `titolo`: titolo dell'evento;
- `descrizione`: descrizione testuale dell'evento;
- `categoria`: categoria dell'evento;
- `data`: data di svolgimento dell'evento;
- `luogo`: luogo in cui si svolge l'evento;
- `organizzatore`: soggetto o struttura che organizza l'evento;
- `tag`: insieme di parole chiave associate all'evento;
- `numero_partecipanti`: numero di partecipanti registrati.

Esempio di documento JSON:

```json
{
  "titolo": "Laboratorio Python",
  "descrizione": "Evento dedicato a Python con attività formative e divulgative.",
  "categoria": "formazione",
  "data": "2026-09-23",
  "luogo": "Campus Ecotekne",
  "organizzatore": "Corso di Big Data",
  "tag": ["python", "formazione"],
  "numero_partecipanti": 267
}
```

---

## Indice Elasticsearch

L'indice creato si chiama:

```text
eventi
```

Il mapping dell'indice viene definito nel file `create_index.py`.

Nel mapping sono stati specificati i tipi dei principali campi:

- `titolo` e `descrizione` sono campi di tipo `text`, perché devono supportare ricerche testuali;
- `categoria` e `tag` sono campi di tipo `keyword`, perché vengono utilizzati per filtri esatti;
- `data` è un campo di tipo `date`;
- `luogo` e `organizzatore` sono campi di tipo `text`;
- `numero_partecipanti` è un campo di tipo `integer`, perché viene utilizzato per calcolare aggregazioni statistiche.

Questa struttura permette di combinare ricerche full-text, filtri puntuali e analisi aggregate.

---

## Popolamento del dataset

Il progetto è stato sviluppato in due fasi.

In una prima fase è stato utilizzato un dataset ridotto composto da 5 documenti di esempio. Questa fase iniziale ha permesso di verificare la correttezza dell'indice, del mapping e delle query implementate.

Successivamente il dataset è stato ampliato mediante lo script `populate_large_dataset.py`, che genera automaticamente un archivio più ampio e realistico.

Il dataset finale contiene:

- 80 eventi;
- 12 categorie;
- 8 luoghi;
- 5 organizzatori.

Le categorie utilizzate sono:

- orientamento;
- formazione;
- seminario;
- benessere;
- workshop;
- ricerca;
- innovazione;
- career day;
- networking;
- conferenza;
- hackathon;
- summer school.

Gli eventi rappresentano attività universitarie, formative, culturali e professionali, come open day, workshop, laboratori, seminari, hackathon, career day, conferenze e masterclass.

L'ampliamento del dataset ha consentito di verificare il funzionamento delle interrogazioni su una quantità maggiore di documenti e di rendere più significative le ricerche, i filtri e le aggregazioni statistiche.

---

## File del progetto

La cartella `elasticsearch_eventi` contiene i seguenti file:

- `create_index.py` → crea l'indice Elasticsearch e definisce il mapping dei campi;
- `insert_documents.py` → inserisce il dataset iniziale ridotto di esempio;
- `populate_large_dataset.py` → genera e inserisce il dataset esteso composto da 80 eventi;
- `python_queries.py` → esegue le query previste tramite Python;
- `export_query_results.py` → esporta i risultati delle query in formato CSV;
- `schema_documentale_elasticsearch.png` → struttura del documento JSON utilizzato nell'indice Elasticsearch;
- `README.md` → documentazione della traccia.

La cartella contiene inoltre:

- `output_query/query1_ricerca_titolo_python.csv` → output della prima query;
- `output_query/query2_categoria_formazione.csv` → output della seconda query;
- `output_query/query3_tag_database_nosql.csv` → output della terza query;
- `output_query/query4_media_partecipanti_categoria.csv` → output della quarta query.

---

## Query implementate

Nel file `python_queries.py` sono state implementate quattro query principali.

---

### Query 1 - Ricerca tramite titolo

La prima query esegue una ricerca full-text sul campo `titolo`.

Nel progetto viene cercata la parola:

```text
Python
```

La query restituisce tutti gli eventi che contengono la parola `Python` nel titolo, ad esempio laboratori, seminari, workshop, conferenze o career day dedicati a questo argomento.

Questa interrogazione mostra il funzionamento della ricerca testuale su un campo di tipo `text`.

---

### Query 2 - Filtro per categoria

La seconda query filtra gli eventi appartenenti a una specifica categoria.

Nel progetto viene filtrata la categoria:

```text
formazione
```

La query restituisce tutti gli eventi classificati come formativi.

Questa interrogazione mostra l'utilizzo di un campo di tipo `keyword`, adatto a ricerche esatte e filtri puntuali.

---

### Query 3 - Ricerca tramite tag

La terza query ricerca eventi associati a uno specifico tag.

Nel dataset finale viene ricercato il tag:

```text
database nosql
```

Questa scelta è coerente con il nuovo dataset generato automaticamente, nel quale i tag vengono costruiti a partire dall'argomento dell'evento e dalla categoria.

La query restituisce gli eventi associati al tema dei database NoSQL.

Questa interrogazione mostra come Elasticsearch possa gestire campi multivalore, come una lista di tag, ed effettuare ricerche esatte su parole chiave specifiche.

---

### Query 4 - Aggregazione statistica

La quarta query calcola il numero medio di partecipanti per categoria.

La query utilizza:

- una aggregazione `terms` sul campo `categoria`;
- una aggregazione `avg` sul campo `numero_partecipanti`.

Il risultato consente di ottenere, per ogni categoria, la media dei partecipanti agli eventi.

Questa interrogazione dimostra che Elasticsearch non è utile solo per la ricerca testuale, ma anche per effettuare analisi aggregate sui dati.

---

## Esportazione degli output

Per documentare i risultati delle interrogazioni è stato realizzato lo script `export_query_results.py`.

Lo script esegue le stesse query presenti in `python_queries.py` ed esporta i risultati nella cartella `output_query` in formato CSV.

Sono stati esportati quattro file:

- `query1_ricerca_titolo_python.csv`;
- `query2_categoria_formazione.csv`;
- `query3_tag_database_nosql.csv`;
- `query4_media_partecipanti_categoria.csv`.

Questi file permettono di consultare gli output delle query anche senza eseguire nuovamente il codice Python.

---

## Utilizzo tramite Python

Il progetto interagisce con Elasticsearch tramite Python e la libreria ufficiale `elasticsearch`.

La connessione viene effettuata verso l'istanza locale di Elasticsearch:

```python
es = Elasticsearch(
    "https://localhost:9200",
    basic_auth=("elastic", "password"),
    verify_certs=False
)
```

Nel progetto reale la password è quella generata da Elasticsearch al primo avvio.

Gli script devono essere eseguiti nel seguente ordine:

```bash
python elasticsearch_eventi/create_index.py
python elasticsearch_eventi/populate_large_dataset.py
python elasticsearch_eventi/python_queries.py
python elasticsearch_eventi/export_query_results.py
```

Lo script `insert_documents.py` rimane disponibile come versione iniziale del popolamento, ma per la versione finale del progetto viene utilizzato `populate_large_dataset.py`, che genera il dataset esteso da 80 eventi.

---

## Tecnologie utilizzate

- Elasticsearch
- Python
- JSON
- CSV
- Git
- GitHub
- Visual Studio Code

---

## Obiettivi della traccia

Questa parte del progetto dimostra la capacità di:

- progettare una struttura documentale;
- creare un indice Elasticsearch;
- definire un mapping coerente con il tipo di dati;
- popolare l'indice con documenti JSON;
- ampliare un dataset iniziale ridotto;
- eseguire query full-text;
- eseguire filtri su campi strutturati;
- interrogare campi multivalore;
- utilizzare aggregazioni statistiche;
- esportare gli output delle query;
- interagire con Elasticsearch tramite Python.

---

## Considerazioni finali

La soluzione proposta evidenzia le caratteristiche principali di un database NoSQL orientato ai documenti.

A differenza del database relazionale, in cui i dati sono organizzati in tabelle, Elasticsearch consente di rappresentare ogni evento come documento autonomo e flessibile.

Questo approccio è particolarmente utile quando i dati contengono molte informazioni testuali e devono essere interrogati tramite parole chiave, filtri e aggregazioni.

L'ampliamento del dataset da 5 a 80 documenti ha permesso di rendere il progetto più realistico e di verificare il corretto funzionamento delle query su un insieme di dati più consistente.