# Big Data Project

## Introduzione

Questo progetto è stato sviluppato nell'ambito del corso di **Analisi Dati & Big Data** del Corso di Laurea Magistrale in Data Science presso l'Università del Salento.

L'obiettivo del lavoro è applicare i principali concetti affrontati durante il corso attraverso la progettazione, l'implementazione, il popolamento e l'interrogazione di differenti tipologie di database.

Il progetto comprende tre soluzioni basate su modelli di gestione dei dati differenti:

1. un database relazionale realizzato con **SQLite**;
2. un database NoSQL a grafo realizzato con **Neo4j**;
3. un database NoSQL documentale realizzato con **Elasticsearch**.

Le prime due implementazioni derivano da tracce assegnate dal docente, mentre la terza rappresenta una proposta autonoma sviluppata utilizzando Elasticsearch.

Per ciascun database sono stati progettati la struttura dei dati, il popolamento, le query e l'interazione tramite Python. Inoltre, per rendere il progetto più completo e verificabile, sono stati prodotti diagrammi o schemi descrittivi e sono stati esportati gli output delle query principali.

---

## Obiettivi del progetto

Il progetto è stato realizzato con l'obiettivo di dimostrare la capacità di:

- progettare basi di dati utilizzando differenti modelli di rappresentazione;
- implementare database relazionali e NoSQL;
- modellare entità, relazioni, nodi, collegamenti e documenti;
- popolare i database con dataset progressivamente più ampi;
- sviluppare interrogazioni significative sui dati archiviati;
- utilizzare Python come strumento di interazione con i database;
- esportare e documentare gli output delle query;
- confrontare approcci relazionali, a grafo e documentali;
- gestire e versionare il codice mediante Git e GitHub.

---

## Struttura generale della repository

La repository è organizzata in tre cartelle principali, ciascuna dedicata a una specifica traccia del progetto.

```text
BigData_Project/
│
├── relational_biblioteca/
├── graph_film/
├── elasticsearch_eventi/
└── README.md
```

Ogni cartella contiene il codice necessario per creare, popolare e interrogare il relativo database, oltre alla documentazione specifica della traccia.

---

# Traccia 1 - Database Relazionale con SQLite

## Cartella

```text
relational_biblioteca
```

La prima traccia prevede la realizzazione di un database relazionale per la gestione di una biblioteca scolastica.

Il sistema consente di rappresentare studenti, libri, autori e prestiti attraverso tabelle collegate mediante chiavi primarie e chiavi esterne. La progettazione segue i principi del modello relazionale e permette di gestire correttamente le associazioni tra le entità coinvolte.

Particolare attenzione è stata dedicata alla relazione molti-a-molti tra libri e autori, realizzata mediante la tabella associativa `LIBRO_AUTORE`.

---

## Struttura del database

Il database relazionale contiene le seguenti tabelle:

- `STUDENTE`;
- `LIBRO`;
- `AUTORE`;
- `LIBRO_AUTORE`;
- `PRESTITO`.

La tabella `STUDENTE` contiene le informazioni sugli studenti che possono prendere in prestito libri.  
La tabella `LIBRO` contiene le informazioni sui libri presenti nella biblioteca.  
La tabella `AUTORE` contiene i dati sugli autori.  
La tabella `LIBRO_AUTORE` rappresenta la relazione molti-a-molti tra libri e autori.  
La tabella `PRESTITO` registra i prestiti effettuati dagli studenti.

---

## Popolamento del database

In una prima fase il database è stato popolato con un numero ridotto di dati di esempio, al fine di verificare la correttezza dello schema relazionale e delle query richieste.

Successivamente è stato realizzato uno script di popolamento esteso, che ha permesso di ampliare il database e testare le query su un dataset più consistente.

Il dataset finale contiene:

- 40 studenti;
- 60 libri;
- 25 autori;
- 90 associazioni libro-autore;
- 120 prestiti.

Complessivamente, la traccia relazionale contiene **335 record** distribuiti tra le diverse tabelle.

---

## Query implementate

Sono state implementate due query principali:

1. visualizzazione dei libri attualmente in prestito con le informazioni dello studente;
2. individuazione degli autori che hanno scritto più di un libro.

Gli output delle query sono stati esportati e inseriti nella cartella del progetto.

---

## File principali

La cartella `relational_biblioteca` contiene:

- `schema.sql` → creazione delle tabelle;
- `insert_data.sql` → popolamento iniziale del database;
- `populate_large_dataset.py` → popolamento esteso del database;
- `queries.sql` → query SQL richieste dalla traccia;
- `biblioteca.py` → script Python per l'esecuzione delle query;
- `biblioteca.db` → database SQLite;
- `diagramma_ER_biblioteca.png` → diagramma ER del database;
- `output_query/` → cartella contenente gli output delle query.

---

# Traccia 2 - Database a Grafo con Neo4j

## Cartella

```text
graph_film
```

La seconda traccia prevede la realizzazione di un **Knowledge Graph** dedicato al dominio cinematografico mediante Neo4j.

Il database rappresenta film, persone e generi cinematografici attraverso nodi e relazioni. Questo approccio consente di modellare in maniera naturale le connessioni tra attori, registi, opere cinematografiche e generi.

Il paradigma a grafo risulta particolarmente adatto a questo dominio perché permette di esplorare collaborazioni professionali e connessioni tra entità fortemente relazionate.

---

## Struttura del grafo

Il Knowledge Graph contiene tre tipologie principali di nodi:

- `Film`;
- `Persona`;
- `Genere`.

Le relazioni implementate sono:

- `HA_RECITATO_IN`, che collega una persona a un film in cui ha recitato;
- `HA_DIRETTO`, che collega una persona a un film che ha diretto;
- `APPARTIENE_A`, che collega un film al relativo genere cinematografico.

---

## Popolamento del grafo

In una prima fase il grafo è stato popolato con un dataset ridotto, utile per verificare la correttezza della modellazione e delle query.

Successivamente il dataset è stato ampliato per rendere il Knowledge Graph più realistico e coerente con la richiesta di lavorare su una quantità maggiore di dati.

Il dataset finale contiene:

- 40 nodi `Film`;
- 45 nodi `Persona`;
- 20 nodi `Genere`;
- 113 relazioni.

Complessivamente, il grafo contiene **105 nodi** e **113 relazioni**.

---

## Query implementate

Sono state implementate due query principali:

1. ricerca dei film in cui ha recitato un determinato attore;
2. individuazione delle persone che hanno collaborato con un determinato regista.

Le query sono state scritte in linguaggio Cypher e sono state testate sul grafo ampliato. Gli output sono stati esportati in formato CSV e inseriti nella cartella del progetto.

---

## File principali

La cartella `graph_film` contiene:

- `graph.cypher` → creazione e popolamento del Knowledge Graph;
- `queries.cypher` → query Cypher richieste dalla traccia;
- `README.md` → documentazione specifica della traccia;
- `schema_knowledge_graph_neo4j.png` → schema concettuale del grafo;
- `output_query/` → cartella contenente gli output delle query.

---

# Traccia 3 - Database Documentale con Elasticsearch

## Cartella

```text
elasticsearch_eventi
```

La terza traccia rappresenta una proposta autonoma sviluppata mediante Elasticsearch.

È stato realizzato un archivio di eventi universitari, formativi e culturali, in cui ogni evento viene rappresentato come documento JSON. Questo approccio consente di archiviare dati flessibili e di effettuare ricerche testuali, filtri e aggregazioni statistiche.

Elasticsearch è stato scelto perché particolarmente adatto alla gestione di dati testuali e semi-strutturati, permettendo interrogazioni full-text e analisi aggregate.

---

## Struttura documentale

Ogni documento rappresenta un evento e contiene i seguenti campi:

- `titolo`;
- `descrizione`;
- `categoria`;
- `data`;
- `luogo`;
- `organizzatore`;
- `tag`;
- `numero_partecipanti`.

Il mapping dell'indice definisce i campi testuali, i campi keyword, il campo data e il campo numerico utilizzato per le aggregazioni.

L'indice Elasticsearch utilizzato si chiama:

```text
eventi
```

---

## Popolamento del dataset

In una prima fase il database documentale è stato popolato con 5 documenti di esempio, utilizzati per verificare il corretto funzionamento dell'indice e delle query.

Successivamente il dataset è stato ampliato tramite uno script Python dedicato.

Il dataset finale contiene:

- 80 eventi;
- 12 categorie;
- 8 luoghi;
- 5 organizzatori.

L'ampliamento ha permesso di testare le ricerche full-text, i filtri e le aggregazioni statistiche su una quantità maggiore di documenti.

---

## Query implementate

Sono state implementate quattro query principali:

1. ricerca full-text di eventi tramite titolo, utilizzando la parola `Python`;
2. filtro degli eventi appartenenti alla categoria `formazione`;
3. ricerca di eventi tramite tag, utilizzando il tag `database nosql`;
4. calcolo della media dei partecipanti per categoria.

Gli output delle quattro query sono stati esportati in formato CSV e inseriti nella cartella del progetto.

---

## File principali

La cartella `elasticsearch_eventi` contiene:

- `create_index.py` → creazione dell'indice Elasticsearch e definizione del mapping;
- `insert_documents.py` → popolamento iniziale ridotto;
- `populate_large_dataset.py` → popolamento esteso con 80 eventi;
- `python_queries.py` → esecuzione delle query tramite Python;
- `export_query_results.py` → esportazione degli output delle query;
- `README.md` → documentazione specifica della traccia;
- `schema_documentale_elasticsearch.png` → schema documentale dell'indice;
- `output_query/` → cartella contenente gli output delle query.

---

# Tecnologie utilizzate

Nel progetto sono state utilizzate le seguenti tecnologie:

- Python;
- SQLite;
- SQL;
- Neo4j;
- Cypher;
- Elasticsearch;
- JSON;
- CSV;
- Git;
- GitHub;
- Visual Studio Code;
- Neo4j Desktop;
- DBeaver.

---

# Confronto tra i tre modelli

Il progetto consente di confrontare tre diversi paradigmi di gestione dei dati.

Il database relazionale con SQLite è adatto alla rappresentazione di dati strutturati e relazioni definite tramite chiavi primarie e chiavi esterne. Questo modello è particolarmente efficace quando lo schema dei dati è stabile e le relazioni tra le entità sono chiaramente definite.

Il database a grafo con Neo4j è adatto alla rappresentazione di domini fortemente relazionati. In questo caso le connessioni tra i dati diventano l'elemento centrale del modello e possono essere interrogate in modo diretto attraverso il linguaggio Cypher.

Il database documentale con Elasticsearch è adatto alla gestione di dati semi-strutturati e testuali. La rappresentazione tramite documenti JSON consente maggiore flessibilità e permette di effettuare ricerche full-text, filtri e aggregazioni statistiche.

---

# Conclusioni

Il progetto ha permesso di sperimentare tre differenti approcci alla progettazione e alla gestione dei dati.

La prima traccia ha evidenziato l'importanza del modello relazionale, delle chiavi e dei vincoli di integrità.  
La seconda traccia ha mostrato la capacità dei grafi di rappresentare relazioni complesse in modo naturale.  
La terza traccia ha dimostrato l'efficacia dei database documentali nella gestione di informazioni testuali, flessibili e interrogabili tramite ricerche avanzate.

L'integrazione con Python ha permesso di automatizzare l'interazione con i database, eseguire query e salvare gli output in formato consultabile.

L'intero progetto è stato sviluppato e versionato mediante Git e GitHub, documentando progressivamente l'evoluzione del lavoro, dal dataset iniziale di test fino ai dataset finali ampliati.

---

# Autori

**Luana Fasiello**  
**Sofia Pascali**

Corso di Laurea Magistrale in Data Science  
Università del Salento

Anno Accademico 2025/2026