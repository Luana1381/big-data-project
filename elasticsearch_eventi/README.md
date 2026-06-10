# Traccia 3 - Archivio Eventi con Elasticsearch

## Descrizione

Questa parte del progetto realizza un database NoSQL orientato ai documenti tramite **Elasticsearch**.

La traccia relativa a Elasticsearch era libera; per questo motivo è stato scelto il caso d'uso di un **archivio di eventi scolastici e culturali**. Ogni evento viene rappresentato come un documento JSON, cioè come una struttura flessibile composta da campi testuali, campi numerici, date e liste di tag.

La scelta di Elasticsearch è adatta a questo scenario perché permette di effettuare ricerche testuali sui contenuti descrittivi degli eventi, applicare filtri su campi strutturati e calcolare aggregazioni statistiche sui dati numerici.

---

## Struttura del documento

Ogni documento dell'indice rappresenta un evento e contiene i seguenti campi:

- `titolo`: titolo dell'evento;
- `descrizione`: descrizione testuale dell'evento;
- `categoria`: categoria dell'evento, ad esempio formazione, orientamento, seminario o benessere;
- `data`: data di svolgimento dell'evento;
- `luogo`: luogo in cui si svolge l'evento;
- `organizzatore`: soggetto o struttura che organizza l'evento;
- `tag`: insieme di parole chiave associate all'evento;
- `numero_partecipanti`: numero di partecipanti registrati.

Esempio di documento JSON:

```json
{
  "titolo": "Laboratorio di Python",
  "descrizione": "Laboratorio pratico per studenti sulla programmazione Python e sull'analisi dei dati.",
  "categoria": "formazione",
  "data": "2026-04-10",
  "luogo": "Laboratorio informatico",
  "organizzatore": "Area Data Science",
  "tag": ["python", "programmazione", "dati"],
  "numero_partecipanti": 45
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
- `categoria` e `tag` sono campi di tipo `keyword`, perché vengono usati per filtri esatti;
- `data` è un campo di tipo `date`;
- `numero_partecipanti` è un campo di tipo `integer`, perché viene usato per calcolare aggregazioni statistiche.

---

## File del progetto

La cartella `elasticsearch_eventi` contiene i seguenti file:

- `create_index.py`: crea l'indice Elasticsearch e definisce il mapping dei campi;
- `insert_documents.py`: inserisce documenti di esempio relativi agli eventi;
- `python_queries.py`: esegue le query previste tramite Python;
- `README.md`: descrive la traccia, la struttura dei documenti e le query implementate.

---

## Dati inseriti

Sono stati inseriti eventi di esempio appartenenti a diverse categorie:

- orientamento;
- formazione;
- seminario;
- benessere.

Gli eventi inseriti rappresentano attività scolastiche, universitarie e formative, come open day, laboratori, workshop e seminari.

Questi dati permettono di testare sia le funzionalità di ricerca testuale sia le funzionalità di filtro e aggregazione.

---

## Query implementate

Nel file `python_queries.py` sono state implementate quattro query principali.

### Query 1 - Ricerca tramite titolo

La prima query cerca eventi che contengono una determinata parola nel titolo.

Nel progetto viene cercata la parola:

```text
Python
```

La query restituisce l'evento:

```text
Laboratorio di Python
```

Questa interrogazione mostra l'utilizzo della ricerca testuale su un campo di tipo `text`.

---

### Query 2 - Filtro per categoria

La seconda query filtra gli eventi appartenenti a una specifica categoria.

Nel progetto viene filtrata la categoria:

```text
formazione
```

La query restituisce gli eventi formativi presenti nell'indice, come:

- `Laboratorio di Python`;
- `Workshop Big Data`.

Questa interrogazione mostra l'utilizzo di campi `keyword` per effettuare ricerche esatte.

---

### Query 3 - Ricerca tramite tag

La terza query cerca eventi associati a uno specifico tag.

Nel progetto viene ricercato il tag:

```text
database
```

La query restituisce l'evento:

```text
Workshop Big Data
```

Questa interrogazione mostra come Elasticsearch possa gestire campi multivalore, come una lista di tag.

---

### Query 4 - Aggregazione statistica

La quarta query calcola il numero medio di partecipanti per categoria.

Questa query utilizza:

- una aggregazione `terms` sul campo `categoria`;
- una aggregazione `avg` sul campo `numero_partecipanti`.

Il risultato permette di ottenere, per ogni categoria, la media dei partecipanti agli eventi.

Esempio di output:

```text
formazione -> 52.5
benessere -> 70.0
orientamento -> 120.0
seminario -> 180.0
```

Questa interrogazione dimostra l'utilizzo di Elasticsearch non solo per la ricerca testuale, ma anche per l'analisi aggregata dei dati.

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
python elasticsearch_eventi/insert_documents.py
python elasticsearch_eventi/python_queries.py
```

---

## Tecnologie utilizzate

- Elasticsearch
- Python
- JSON
- Git
- GitHub

---

## Obiettivi della traccia

Questa parte del progetto dimostra la capacità di:

- progettare una struttura documentale;
- creare un indice Elasticsearch;
- definire un mapping coerente con il tipo di dati;
- popolare l'indice con documenti JSON;
- eseguire query full-text;
- eseguire filtri su campi strutturati;
- utilizzare aggregazioni statistiche;
- interagire con Elasticsearch tramite Python.

---

## Considerazioni finali

La soluzione proposta evidenzia le caratteristiche principali di un database NoSQL orientato ai documenti. A differenza del database relazionale, in cui i dati sono organizzati in tabelle, Elasticsearch consente di rappresentare ogni evento come documento autonomo e flessibile.

Questo approccio è particolarmente utile quando i dati contengono molte informazioni testuali e devono essere interrogati tramite parole chiave, filtri e aggregazioni.
