# Big Data Project

## Introduzione

Questo progetto è stato sviluppato nell’ambito del corso di **Analisi Dati & Big Data** del Corso di Laurea Magistrale in Data Science presso l’Università del Salento.

L’obiettivo del lavoro è quello di applicare i principali concetti affrontati durante il corso attraverso la progettazione, l’implementazione e l’interrogazione di differenti tipologie di database. In particolare, il progetto prevede la realizzazione di tre soluzioni basate su modelli di gestione dei dati differenti: un database relazionale, un database NoSQL a grafo e un database NoSQL orientato ai documenti.

Per ciascun database sono stati progettati i dati, implementata la struttura di archiviazione, inseriti dati di esempio e sviluppate query interrogabili tramite Python. Il progetto consente quindi di confrontare approcci differenti alla gestione delle informazioni e di evidenziare i punti di forza dei vari modelli di database in relazione ai diversi contesti applicativi.

Le prime due implementazioni derivano dalle tracce assegnate dal docente, mentre la terza rappresenta una proposta autonoma sviluppata utilizzando Elasticsearch.

⸻

## Obiettivi del progetto

Il progetto è stato realizzato con l’obiettivo di dimostrare la capacità di:

* progettare basi di dati utilizzando differenti modelli di rappresentazione;
* implementare database relazionali e NoSQL;
* modellare correttamente entità, relazioni e documenti;
* popolare i database con dati di esempio;
* sviluppare interrogazioni significative sui dati archiviati;
* utilizzare Python come strumento di interazione con i database;
* comprendere le differenze tra approcci relazionali, grafi e database documentali;
* gestire e versionare il codice mediante Git e GitHub.

⸻

## Struttura della repository

La repository è organizzata in tre cartelle principali, ciascuna dedicata a una delle tracce sviluppate.

⸻

# Traccia 1 – Database Relazionale (SQLite)

## Cartella

relational_biblioteca

La prima traccia prevede la realizzazione di un database relazionale per la gestione di una biblioteca scolastica utilizzando SQLite.

Il sistema consente di gestire studenti, libri, autori e prestiti attraverso un insieme di tabelle collegate mediante chiavi primarie e chiavi esterne. La progettazione segue i principi del modello relazionale e garantisce la corretta rappresentazione delle relazioni tra le entità coinvolte.

Particolare attenzione è stata dedicata alla modellazione delle relazioni molti-a-molti tra libri e autori mediante una tabella associativa dedicata.

## Attività svolte

* progettazione dello schema relazionale;
* definizione delle tabelle e delle relazioni;
* implementazione delle chiavi primarie e delle chiavi esterne;
* inserimento di dati di esempio;
* sviluppo delle query SQL richieste dalla traccia;
* utilizzo di Python per l’esecuzione delle interrogazioni.

## File principali

* schema.sql
* insert_data.sql
* queries.sql
* biblioteca.py
* biblioteca.db

⸻

# Traccia 2 – Database a Grafo (Neo4j)

## Cartella

graph_film

La seconda traccia prevede la realizzazione di un Knowledge Graph dedicato al dominio cinematografico mediante Neo4j.

Il database rappresenta film, persone e generi cinematografici attraverso nodi e relazioni. Questo approccio consente di modellare in maniera naturale le connessioni tra attori, registi e opere cinematografiche, valorizzando il concetto di relazione come elemento centrale della struttura dati.

Grazie al paradigma a grafo è possibile esplorare collaborazioni professionali, connessioni tra film e persone e percorsi tra entità correlate.

## Attività svolte

* progettazione del grafo;
* definizione dei nodi e delle relazioni;
* popolamento del database con dati di esempio;
* sviluppo delle interrogazioni tramite linguaggio Cypher;
* analisi delle connessioni tra le entità del sistema.

## File principali

* graph.cypher
* queries.cypher

⸻

# Traccia 3 – Database Documentale (Elasticsearch)

## Cartella

elasticsearch_eventi

La terza traccia rappresenta una proposta autonoma sviluppata mediante Elasticsearch.

È stato realizzato un archivio di eventi culturali, scolastici e formativi in cui ogni evento viene rappresentato come un documento JSON. Questo approccio consente di archiviare dati eterogenei e di effettuare ricerche testuali avanzate, filtri e aggregazioni statistiche.

L’utilizzo di Elasticsearch permette di evidenziare le caratteristiche dei database documentali e dei motori di ricerca distribuiti, particolarmente adatti alla gestione di grandi quantità di dati testuali.

## Attività svolte

* progettazione della struttura documentale;
* creazione dell’indice Elasticsearch;
* definizione del mapping dei campi;
* inserimento dei documenti JSON;
* sviluppo di query full-text;
* implementazione di filtri e aggregazioni;
* utilizzo di Python per interagire con il database.

## Query implementate

* ricerca di eventi tramite titolo;
* filtraggio degli eventi per categoria;
* ricerca di eventi tramite tag;
* calcolo del numero medio di partecipanti per categoria.

## File principali

* create_index.py
* insert_documents.py
* python_queries.py

⸻

# Tecnologie utilizzate

Nel progetto sono state utilizzate diverse tecnologie e strumenti:

* Python
* SQLite
* SQL
* Neo4j
* Cypher
* Elasticsearch
* JSON
* Git
* GitHub
* Visual Studio Code
* Neo4j Desktop

⸻

# Conclusioni

Il progetto ha consentito di confrontare tre differenti paradigmi di gestione dei dati, mettendo in evidenza vantaggi e caratteristiche specifiche di ciascun approccio.

Il database relazionale ha mostrato l’efficacia delle strutture tabellari e delle relazioni basate su chiavi. Il database a grafo ha evidenziato la capacità di rappresentare e interrogare reti di connessioni complesse. Il database documentale ha permesso di gestire informazioni flessibili e di sfruttare funzionalità avanzate di ricerca e aggregazione.

L’integrazione con Python ha inoltre dimostrato come sia possibile automatizzare l’interazione con database appartenenti a modelli differenti, sviluppando applicazioni capaci di accedere, interrogare e analizzare i dati in maniera efficiente.

⸻

# Autori

Luana Fasiello
Sofia Pascali

Corso di Laurea Magistrale in Data Science
Università del Salento

Anno Accademico 2025/2026
