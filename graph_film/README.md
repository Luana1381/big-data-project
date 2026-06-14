# Traccia 2 - Film e Persone con Neo4j

## Descrizione

Questa parte del progetto realizza un **Knowledge Graph** mediante **Neo4j** per rappresentare informazioni relative al mondo cinematografico.

L'obiettivo è modellare film, persone e generi cinematografici attraverso una struttura a grafo che consenta di rappresentare in modo naturale le relazioni esistenti tra le diverse entità.

A differenza dei database relazionali, nei quali le connessioni tra le informazioni vengono gestite tramite tabelle e chiavi esterne, il modello a grafo permette di rappresentare direttamente i collegamenti tra gli oggetti del dominio. Questo approccio risulta particolarmente efficace nel contesto cinematografico, dove film, attori, registi e generi sono fortemente interconnessi.

Grazie a Neo4j è possibile esplorare facilmente collaborazioni professionali, relazioni tra persone e film, percorsi tra entità e connessioni che sarebbero più complesse da individuare mediante un database tradizionale.

---

## Progettazione del grafo

Il database è stato progettato seguendo il paradigma dei **Property Graph**, modello utilizzato da Neo4j.

In questo paradigma:

- le entità vengono rappresentate come nodi;
- le connessioni vengono rappresentate come relazioni orientate;
- nodi e relazioni possono possedere proprietà descrittive;
- le interrogazioni vengono effettuate attraversando direttamente le relazioni presenti nel grafo.

La struttura progettata consente di rappresentare il dominio cinematografico in maniera intuitiva e facilmente interrogabile mediante il linguaggio Cypher.

---

## Struttura del Knowledge Graph

Il grafo è composto da tre tipologie principali di nodi.

### FILM

I nodi di tipo FILM rappresentano le opere cinematografiche presenti nel sistema.

Per ogni film vengono memorizzate le seguenti proprietà:

- titolo;
- anno di uscita;
- durata;
- lingua originale.

Ogni film può essere associato a uno o più generi cinematografici e può coinvolgere numerose persone con ruoli differenti.

### PERSONA

I nodi di tipo PERSONA rappresentano gli individui coinvolti nella produzione cinematografica.

Per ogni persona vengono memorizzate:

- nome;
- cognome;
- data di nascita;
- nazionalità.

Una stessa persona può partecipare a più film e può essere collegata a diverse opere mediante differenti relazioni.

### GENERE

I nodi di tipo GENERE rappresentano le categorie cinematografiche.

Ogni genere viene identificato dal proprio nome e permette di classificare i film in base alle loro caratteristiche narrative e stilistiche.

---

## Relazioni implementate

Le connessioni tra i nodi vengono rappresentate tramite relazioni direzionali.

### HA_RECITATO_IN

La relazione **HA_RECITATO_IN** collega una persona a un film nel quale ha partecipato come attore o attrice.

Essa consente di individuare rapidamente tutti i film interpretati da una determinata persona e, viceversa, tutti gli attori coinvolti in una specifica produzione cinematografica.

### HA_DIRETTO

La relazione **HA_DIRETTO** collega una persona a un film del quale è stata regista.

Questa relazione permette di ricostruire la filmografia di un regista e di analizzare le collaborazioni sviluppate nel corso della sua carriera.

### APPARTIENE_A

La relazione **APPARTIENE_A** collega un film al relativo genere cinematografico.

Grazie a questa connessione è possibile classificare le opere cinematografiche e realizzare interrogazioni basate sulle categorie di appartenenza.

---

## Popolamento del grafo

In una prima fase il progetto è stato sviluppato utilizzando un dataset ridotto, costituito da pochi film, persone e generi cinematografici.

Questo primo popolamento aveva lo scopo di verificare la correttezza della modellazione e il funzionamento delle interrogazioni richieste dalla traccia.

Successivamente il grafo è stato ampliato in modo significativo per simulare un archivio cinematografico più realistico e per verificare le prestazioni delle query su una quantità maggiore di dati.

Il dataset finale contiene:

- 40 nodi FILM;
- 45 nodi PERSONA;
- 20 nodi GENERE;

per un totale di **105 nodi**.

Le relazioni create tra i nodi sono complessivamente **113**, distribuite tra:

- HA_RECITATO_IN;
- HA_DIRETTO;
- APPARTIENE_A.

L'ampliamento del dataset ha consentito di verificare il corretto funzionamento delle interrogazioni anche in presenza di un numero elevato di connessioni tra le entità.

---

## File del progetto

La cartella `graph_film` contiene i seguenti file:

- `graph.cypher` → creazione e popolamento del Knowledge Graph;
- `queries.cypher` → implementazione delle query richieste dalla traccia;
- `README.md` → documentazione del progetto;
- `output_query/query1_film_dicaprio.csv` → risultato della prima interrogazione;
- `output_query/query2_collaboratori_nolan.csv` → risultato della seconda interrogazione.

---

## Query implementate

Nel progetto sono state sviluppate le interrogazioni richieste dalla traccia assegnata.

### Query 1 - Film interpretati da un attore

La prima interrogazione consente di individuare tutti i film in cui ha recitato un determinato attore.

Nel caso di test è stato utilizzato Leonardo DiCaprio.

La query attraversa la relazione **HA_RECITATO_IN**, partendo dal nodo PERSONA e raggiungendo tutti i nodi FILM collegati.

Questo tipo di interrogazione evidenzia uno dei principali vantaggi dei database a grafo: la possibilità di seguire direttamente le connessioni tra entità senza dover effettuare operazioni di JOIN.

### Query 2 - Collaborazioni con un regista

La seconda interrogazione consente di individuare le persone che hanno collaborato con un determinato regista.

Nel caso di test è stato utilizzato Christopher Nolan.

La query sfrutta le relazioni **HA_DIRETTO** e **HA_RECITATO_IN** per individuare gli attori che hanno partecipato ai film diretti dal regista selezionato.

L'interrogazione permette inoltre di calcolare il numero di collaborazioni e di visualizzare l'elenco dei film condivisi.

---

## Utilizzo del linguaggio Cypher

Le interrogazioni sono state sviluppate utilizzando **Cypher**, il linguaggio di query di Neo4j.

Cypher consente di descrivere nodi, relazioni e percorsi attraverso una sintassi intuitiva che richiama direttamente la struttura del grafo.

Grazie a questo linguaggio è possibile effettuare ricerche, esplorare connessioni e analizzare relazioni tra entità in modo semplice ed efficiente.

---

## Tecnologie utilizzate

- Neo4j Desktop
- Neo4j Database
- Linguaggio Cypher
- Git
- GitHub
- Visual Studio Code

---

## Obiettivi della traccia

Questa parte del progetto dimostra la capacità di:

- progettare un database a grafo;
- utilizzare il paradigma Property Graph;
- modellare entità tramite nodi;
- rappresentare collegamenti tramite relazioni;
- creare e popolare un Knowledge Graph;
- interrogare il database mediante Cypher;
- esplorare connessioni tra entità correlate;
- analizzare collaborazioni professionali all'interno di un dominio complesso;
- gestire dataset di dimensioni superiori rispetto all'esempio iniziale.

---

## Considerazioni finali

La soluzione sviluppata evidenzia le principali caratteristiche dei database a grafo e mostra come Neo4j possa essere utilizzato per modellare domini caratterizzati da un elevato numero di relazioni tra le informazioni.

Nel contesto cinematografico il paradigma a grafo consente di rappresentare in modo naturale i collegamenti tra film, persone e generi, facilitando l'esplorazione delle collaborazioni professionali e l'analisi delle connessioni presenti nel sistema.

L'ampliamento del dataset fino a oltre cento nodi ha inoltre permesso di verificare il corretto funzionamento delle interrogazioni su un insieme di dati più ampio e realistico, evidenziando uno dei principali punti di forza dei database a grafo: la capacità di gestire ed esplorare relazioni complesse in maniera efficiente.