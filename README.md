# Big Data Project

## Descrizione del progetto

Questo progetto è stato realizzato per il corso di **Big Data** e ha l'obiettivo di mostrare la progettazione, l'implementazione e l'interrogazione di differenti tipologie di database attraverso l'utilizzo di Python.

Sono stati sviluppati tre database appartenenti a modelli differenti:

1. Database relazionale (SQLite)
2. Database NoSQL a grafo (Neo4j)
3. Database NoSQL documentale (Elasticsearch)

Per ciascun database sono stati progettati lo schema dei dati, inseriti dati di esempio e implementate le query richieste dalla traccia d'esame.

---

## Struttura della repository

### Traccia 1 - Database Relazionale (SQLite)

Cartella:

`relational_biblioteca`

È stato sviluppato un sistema di gestione di una biblioteca utilizzando SQLite.

Attività svolte:

- progettazione dello schema relazionale;
- creazione delle tabelle;
- inserimento di dati di esempio;
- interrogazione del database mediante query SQL;
- utilizzo di Python per l'esecuzione delle query.

File principali:

- `schema.sql`
- `insert_data.sql`
- `queries.sql`
- `biblioteca.py`
- `biblioteca.db`

---

### Traccia 2 - Database a Grafo (Neo4j)

Cartella:

`graph_film`

È stato sviluppato un database a grafo dedicato al dominio cinematografico.

Il database rappresenta:

- film;
- attori;
- registi;
- generi cinematografici;
- relazioni tra persone e film.

Attività svolte:

- modellazione tramite nodi e relazioni;
- popolamento del grafo;
- interrogazioni mediante linguaggio Cypher;
- analisi delle connessioni tra entità.

File principali:

- `graph.cypher`
- `queries.cypher`

---

### Traccia 3 - Database Documentale (Elasticsearch)

Cartella:

`elasticsearch_eventi`

È stato sviluppato un archivio di eventi culturali e formativi utilizzando Elasticsearch.

Ogni evento è rappresentato come documento JSON contenente:

- titolo;
- descrizione;
- categoria;
- data;
- luogo;
- organizzatore;
- tag;
- numero di partecipanti.

Attività svolte:

- creazione dell'indice Elasticsearch;
- definizione del mapping;
- inserimento dei documenti;
- ricerca full-text;
- filtri sui campi;
- aggregazioni statistiche.

Query implementate:

1. Ricerca di eventi tramite titolo.
2. Filtraggio degli eventi per categoria.
3. Ricerca di eventi tramite tag.
4. Calcolo del numero medio di partecipanti per categoria.

File principali:

- `create_index.py`
- `insert_documents.py`
- `python_queries.py`

---

## Tecnologie utilizzate

- Python
- SQLite
- Neo4j
- Elasticsearch
- Git
- GitHub

---

## Obiettivi del progetto

Il progetto dimostra la capacità di:

- progettare database appartenenti a modelli differenti;
- implementare strutture dati relazionali e NoSQL;
- utilizzare query per l'interrogazione dei dati;
- interagire con i database tramite Python;
- gestire e versionare il codice mediante Git e GitHub.

---

## Autore

**Luana Fasiello** e **Sofia Pascali**

Corso di Laurea Magistrale in Data Science  
Università del Salento
