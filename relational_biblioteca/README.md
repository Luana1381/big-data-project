# Traccia 1 - Sistema Biblioteca Relazionale

## Descrizione

Questa parte del progetto realizza un database relazionale per la gestione di una biblioteca scolastica utilizzando **SQLite**.

L'obiettivo è rappresentare e gestire le principali attività che caratterizzano il funzionamento di una biblioteca, consentendo di archiviare informazioni relative agli studenti, ai libri disponibili, agli autori e ai prestiti effettuati.

Il sistema permette di monitorare quali libri sono presenti nella biblioteca, quali autori li hanno scritti e quali studenti hanno richiesto un prestito. Attraverso le relazioni tra le diverse tabelle è possibile effettuare interrogazioni utili alla gestione delle attività bibliotecarie e all'analisi dei dati registrati.

---

## Progettazione del database

Il database è stato progettato seguendo il modello relazionale, organizzando i dati in tabelle collegate tra loro mediante chiavi primarie e chiavi esterne.

La progettazione è stata realizzata con l'obiettivo di garantire:

- coerenza dei dati;
- riduzione della ridondanza informativa;
- integrità referenziale tra le tabelle;
- semplicità di interrogazione tramite linguaggio SQL.

Lo schema realizzato rappresenta le principali entità coinvolte nel sistema e le relazioni esistenti tra esse.

---

## Struttura del database

Le tabelle implementate sono le seguenti.

### STUDENTE

La tabella STUDENTE contiene le informazioni anagrafiche degli studenti che possono prendere libri in prestito dalla biblioteca.

Per ogni studente vengono memorizzati dati identificativi come nome, cognome e altre informazioni necessarie alla gestione dei prestiti.

---

### LIBRO

La tabella LIBRO contiene le informazioni relative ai libri presenti nella biblioteca.

Per ogni libro vengono memorizzati dati bibliografici come titolo, anno di pubblicazione e altre caratteristiche descrittive.

---

### AUTORE

La tabella AUTORE raccoglie le informazioni sugli autori dei libri presenti nel catalogo.

Ogni autore viene identificato univocamente e può essere associato a uno o più libri.

---

### LIBRO_AUTORE

La tabella LIBRO_AUTORE rappresenta una tabella associativa utilizzata per collegare libri e autori.

La sua presenza è necessaria per modellare correttamente una relazione **molti-a-molti**:

- un autore può aver scritto più libri;
- un libro può essere stato scritto da più autori.

Attraverso questa tabella è possibile rappresentare tutte le combinazioni tra libri e autori senza duplicare informazioni.

---

### PRESTITO

La tabella PRESTITO registra i prestiti effettuati dagli studenti.

Ogni record collega uno studente a un libro e consente di memorizzare le informazioni relative al prestito, come la data di inizio e la data prevista per la restituzione.

Questa tabella rappresenta il collegamento operativo tra utenti e patrimonio librario.

---

## Relazioni tra le tabelle

Le relazioni implementate nel database sono:

- tra STUDENTE e PRESTITO, poiché uno studente può effettuare più prestiti;
- tra LIBRO e PRESTITO, poiché un libro può essere prestato più volte nel tempo;
- tra LIBRO e AUTORE tramite la tabella LIBRO_AUTORE, per rappresentare una relazione molti-a-molti.

L'utilizzo delle chiavi esterne garantisce l'integrità referenziale del database, evitando la presenza di dati incoerenti o riferimenti non validi.

---

## File del progetto

La cartella `relational_biblioteca` contiene i seguenti file:

- `schema.sql` → definizione dello schema relazionale e creazione delle tabelle;
- `insert_data.sql` → inserimento dei dati di esempio;
- `queries.sql` → raccolta delle query SQL richieste dalla traccia;
- `biblioteca.py` → script Python utilizzato per eseguire le interrogazioni sul database;
- `biblioteca.db` → database SQLite contenente i dati; 
- `populate_large_dataset.py` → script Python per il popolamento esteso del database.


### Materiale aggiuntivo

Per documentare il lavoro svolto sono stati inoltre inclusi:

- `diagramma_ER_biblioteca.png`, contenente il diagramma Entity-Relationship del database;
- `output_query/query1_libri_in_prestito.csv`, contenente l'output della prima interrogazione;
- `output_query/query2_autori_piu_libri.csv`, contenente l'output della seconda interrogazione.

In una fase iniziale il sistema è stato sviluppato utilizzando un dataset ridotto, utile per verificare la correttezza dello schema relazionale e delle query implementate. Successivamente il database è stato ampliato mediante uno script Python dedicato, generando un dataset più realistico composto da decine di studenti, libri, autori e prestiti, al fine di testare il corretto funzionamento delle interrogazioni su una quantità maggiore di dati.

---

## Popolamento del database

Dopo la creazione delle tabelle, il database è stato popolato con dati di esempio relativi a:

- studenti;
- libri;
- autori;
- relazioni tra libri e autori;
- prestiti.

I dati inseriti consentono di simulare il funzionamento reale di una biblioteca e permettono di verificare il corretto funzionamento delle query implementate.

---

## Evoluzione del popolamento

Durante la fase iniziale di sviluppo il database è stato popolato con un numero limitato di record di esempio. Questa scelta ha permesso di verificare progressivamente la correttezza dello schema relazionale, delle relazioni tra le tabelle e delle query richieste dalla traccia.

Una volta completata e verificata l'implementazione del sistema, il database è stato ampliato mediante uno script Python dedicato (`populate_large_dataset.py`) che genera automaticamente un dataset più esteso e realistico.

L'ampliamento del dataset ha consentito di testare il corretto funzionamento delle interrogazioni su una quantità maggiore di dati e di simulare uno scenario più vicino a un contesto reale di gestione bibliotecaria.

Il popolamento finale del database comprende:

- 40 studenti;
- 60 libri;
- 25 autori;
- 90 associazioni libro-autore;
- 120 prestiti.

Complessivamente il database contiene 335 record distribuiti tra le diverse tabelle.

---

## Query implementate

Nel progetto sono state sviluppate le query richieste dalla traccia assegnata.

### Query 1 - Libri attualmente in prestito

La prima interrogazione consente di visualizzare tutti i libri che risultano attualmente in prestito, associando a ciascun prestito le informazioni relative al libro e allo studente che lo ha richiesto.

La query utilizza operazioni di JOIN tra le tabelle PRESTITO, LIBRO e STUDENTE e seleziona esclusivamente i prestiti non ancora conclusi, ossia quelli per i quali la data di restituzione effettiva risulta assente.

L'esecuzione della query sul dataset esteso restituisce numerosi record e dimostra il corretto funzionamento delle relazioni tra le tabelle del database.

---

### Query 2 - Autori con più di un libro

La seconda interrogazione permette di individuare gli autori che hanno scritto più di un libro presente nel catalogo.

La query utilizza la tabella associativa LIBRO_AUTORE per contare il numero di opere attribuite a ciascun autore e restituisce solamente quelli con almeno due libri associati.

I risultati vengono ordinati in ordine decrescente rispetto al numero di libri pubblicati, consentendo di identificare immediatamente gli autori maggiormente rappresentati all'interno del catalogo.

L'esecuzione della query sul dataset esteso produce un insieme significativo di risultati e conferma la corretta implementazione della relazione molti-a-molti tra libri e autori.

---

## Utilizzo tramite Python

Le interrogazioni al database vengono eseguite mediante Python utilizzando il modulo standard `sqlite3`.

Lo script `biblioteca.py` stabilisce una connessione al database SQLite, esegue le query e mostra i risultati ottenuti.

Questo approccio consente di integrare il database all'interno di applicazioni software e automatizzare le operazioni di interrogazione.

---

## Tecnologie utilizzate

- SQLite
- SQL
- Python
- DBeaver
- Git
- GitHub

---

## Obiettivi della traccia

Questa parte del progetto dimostra la capacità di:

- progettare un database relazionale;
- definire tabelle e relazioni;
- utilizzare chiavi primarie e chiavi esterne;
- modellare relazioni uno-a-molti e molti-a-molti;
- garantire l'integrità referenziale dei dati;
- eseguire interrogazioni SQL;
- utilizzare Python per interagire con il database;
- gestire e versionare il codice tramite Git e GitHub.

---

## Considerazioni finali

La soluzione sviluppata mostra le caratteristiche fondamentali del modello relazionale, basato sull'organizzazione dei dati in tabelle collegate tra loro.

L'utilizzo di SQLite ha permesso di realizzare un sistema semplice ma completo, in grado di gestire efficacemente le informazioni relative a studenti, libri, autori e prestiti. Attraverso le query implementate è possibile estrarre informazioni significative e supportare le principali attività di gestione della biblioteca.
