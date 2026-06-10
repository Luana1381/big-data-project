# Traccia 2 - Film e Persone con Neo4j

## Descrizione

Questa parte del progetto realizza un **Knowledge Graph** mediante **Neo4j** per rappresentare informazioni relative al mondo cinematografico.

L'obiettivo è modellare film, persone e generi cinematografici attraverso una struttura a grafo che consenta di rappresentare in modo naturale le relazioni esistenti tra le diverse entità.

A differenza dei database relazionali, nei quali le connessioni tra le informazioni vengono gestite tramite tabelle e chiavi esterne, il modello a grafo permette di rappresentare direttamente i collegamenti tra gli oggetti del dominio. Questo approccio risulta particolarmente efficace nel contesto cinematografico, dove film, attori, registi e generi sono fortemente interconnessi.

Grazie a Neo4j è possibile esplorare facilmente collaborazioni professionali, relazioni tra persone e film, percorsi tra entità e connessioni che sarebbero più complesse da individuare mediante un database tradizionale.

---

## Progettazione del grafo

Il database è stato progettato seguendo il paradigma dei **Property Graph**, modello utilizzato da Neo4j.

In questo modello:

- le entità vengono rappresentate come nodi;
- i collegamenti tra le entità vengono rappresentati come relazioni;
- sia i nodi sia le relazioni possono possedere proprietà descrittive.

La struttura progettata consente di rappresentare il dominio cinematografico in maniera intuitiva e facilmente interrogabile mediante il linguaggio Cypher.

---

## Nodi del grafo

I nodi principali del grafo sono:

- FILM
- PERSONA
- GENERE

---

### FILM

I nodi di tipo FILM rappresentano le opere cinematografiche presenti nel sistema.

Per ogni film vengono memorizzate le seguenti proprietà:

- titolo;
- anno di uscita;
- durata;
- lingua originale.

Ogni film può essere associato a uno o più generi e può coinvolgere più persone con ruoli differenti.

---

### PERSONA

I nodi di tipo PERSONA rappresentano gli individui coinvolti nella realizzazione dei film.

Per ogni persona vengono memorizzate le seguenti proprietà:

- nome;
- cognome;
- data di nascita;
- nazionalità.

Una stessa persona può partecipare a diversi film e ricoprire ruoli differenti nel corso della propria carriera.

---

### GENERE

I nodi di tipo GENERE rappresentano le categorie cinematografiche a cui appartengono i film.

Ogni genere viene identificato dal proprio nome, ad esempio:

- fantascienza;
- thriller;
- commedia;
- drammatico.

L'introduzione di nodi specifici per i generi consente di effettuare interrogazioni mirate e analizzare le relazioni tra film appartenenti alla stessa categoria.

---

## Relazioni del grafo

Le connessioni tra i nodi vengono rappresentate tramite relazioni direzionali.

Le relazioni implementate sono le seguenti.

### HA_RECITATO_IN

La relazione **HA_RECITATO_IN** collega una persona a un film nel quale ha partecipato come attore o attrice.

Questa relazione permette di individuare rapidamente tutti i film a cui ha preso parte un determinato interprete e, viceversa, tutti gli attori coinvolti in una specifica produzione cinematografica.

---

### HA_DIRETTO

La relazione **HA_DIRETTO** collega una persona a un film del quale è stata regista.

Attraverso questa relazione è possibile analizzare la filmografia di un regista e individuare le collaborazioni sviluppate nel corso della sua carriera.

---

### APPARTIENE_A

La relazione **APPARTIENE_A** collega un film al relativo genere cinematografico.

Grazie a questa connessione è possibile classificare le opere e realizzare interrogazioni basate sulle categorie cinematografiche.

---

## Popolamento del grafo

Il grafo è stato popolato con dati di esempio relativi a:

- film;
- attori;
- registi;
- generi cinematografici;
- relazioni tra persone e film.

I dati inseriti consentono di simulare un piccolo archivio cinematografico e di verificare il corretto funzionamento delle interrogazioni richieste dalla traccia.

---

## File del progetto

La cartella `graph_film` contiene i seguenti file:

- `graph.cypher` → creazione dei nodi e delle relazioni del grafo;
- `queries.cypher` → implementazione delle query richieste dalla traccia;
- `README.md` → documentazione del progetto.

---

## Query implementate

Nel progetto sono state sviluppate le query richieste dalla traccia assegnata.

### Query 1 - Film interpretati da un attore

La prima interrogazione consente di individuare tutti i film in cui ha recitato un determinato attore.

La query attraversa la relazione **HA_RECITATO_IN**, partendo dal nodo PERSONA e raggiungendo i nodi FILM collegati.

Questo tipo di interrogazione evidenzia uno dei principali vantaggi dei database a grafo: la possibilità di seguire direttamente le connessioni tra entità senza dover effettuare complesse operazioni di JOIN.

---

### Query 2 - Collaborazioni con un regista

La seconda interrogazione consente di individuare le persone che hanno collaborato con un determinato regista.

La query sfrutta le relazioni **HA_DIRETTO** e **HA_RECITATO_IN** per individuare gli attori che hanno partecipato ai film diretti da uno specifico regista.

Attraverso questa interrogazione è possibile analizzare le collaborazioni professionali presenti nel grafo e individuare reti di relazioni tra persone e opere cinematografiche.

---

## Utilizzo del linguaggio Cypher

Le interrogazioni sono state sviluppate utilizzando **Cypher**, il linguaggio di query di Neo4j.

Cypher consente di descrivere in modo intuitivo nodi, relazioni e percorsi attraverso una sintassi che richiama la struttura stessa del grafo.

Grazie a questo linguaggio è possibile effettuare ricerche, esplorare connessioni e analizzare le relazioni presenti nel database in maniera semplice ed efficace.

---

## Tecnologie utilizzate

- Neo4j Desktop
- Neo4j Database
- Linguaggio Cypher
- Git
- GitHub

---

## Obiettivi della traccia

Questa parte del progetto dimostra la capacità di:

- progettare un database a grafo;
- modellare entità mediante nodi;
- rappresentare collegamenti tramite relazioni;
- utilizzare il paradigma Property Graph;
- creare e popolare un Knowledge Graph;
- interrogare il database mediante linguaggio Cypher;
- esplorare connessioni tra entità correlate;
- rappresentare dati fortemente relazionati in modo efficiente.

---

## Considerazioni finali

La soluzione sviluppata evidenzia le principali caratteristiche dei database a grafo e mostra come Neo4j possa essere utilizzato per modellare domini caratterizzati da un elevato numero di relazioni tra le informazioni.

Nel contesto cinematografico, il paradigma a grafo consente di rappresentare in modo naturale i collegamenti tra film, persone e generi, facilitando l'esplorazione delle collaborazioni professionali e l'analisi delle connessioni presenti nel sistema.

L'utilizzo di Neo4j e del linguaggio Cypher permette di eseguire interrogazioni complesse in maniera intuitiva, valorizzando le relazioni tra i dati come elemento centrale della modellazione.
