# Traccia 2 - Film e Persone con Neo4j

## Descrizione

Il progetto realizza un Knowledge Graph mediante Neo4j per rappresentare informazioni relative a film, persone e generi cinematografici.

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

- HA_RECITATO_IN
- HA_DIRETTO
- APPARTIENE_A

## Query implementate

### Query 1

Trovare tutti i film in cui ha recitato un determinato attore.

### Query 2

Individuare le persone che hanno collaborato con un determinato regista.

## Tecnologie utilizzate

- Neo4j Desktop
- Linguaggio Cypher
- GitHub