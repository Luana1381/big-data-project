# Traccia 2 - Film e Persone con Neo4j

## Descrizione

Il progetto realizza un Knowledge Graph mediante Neo4j per rappresentare informazioni relative a film, persone e generi cinematografici.
Il modello a grafo risulta particolarmente adatto alla rappresentazione del dominio cinematografico, poiché consente di descrivere in modo naturale le relazioni tra film, attori, registi e generi. Attraverso Neo4j è possibile esplorare facilmente le connessioni tra le diverse entità e individuare collaborazioni o percorsi tra persone e opere cinematografiche.

I nodi principali del grafo sono:

- Film
- Persona
- Genere

Ogni film possiede:

- titolo
- anno di uscita
- durata
- lingua originale

Ogni persona possiede:

- nome
- cognome
- data di nascita
- nazionalità

Ogni genere è identificato dal proprio nome.

## Relazioni

Le relazioni implementate sono:

- HA_RECITATO_IN che collega una persona a un film in cui ha interpretato un ruolo;
- HA_DIRETTO che collega una persona a un film di cui è stata regista;
- APPARTIENE_A che collega un film al relativo genere cinematografico.

## Query implementate

### Query 1

"Trovare tutti i film in cui ha recitato un determinato attore".
La query attraversa la relazione HA_RECITATO_IN per individuare tutti i film associati a un determinato attore.

### Query 2

"Individuare le persone che hanno collaborato con un determinato regista".
La seconda query utilizza le relazioni presenti nel grafo per identificare gli attori che hanno collaborato con uno specifico regista attraverso i film diretti da quest’ultimo.

## Tecnologie utilizzate

- Neo4j Desktop
- Linguaggio Cypher
- GitHub

## Obiettivi della Traccia 

Il progetto dimostra l'utilizzo di:

- modellazione a grafo mediante Neo4j;
- creazione di nodi e relazioni;
- interrogazioni tramite linguaggio Cypher;
- esplorazione delle connessioni tra entità;
- rappresentazione di dati fortemente relazionati.
