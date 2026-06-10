# Traccia 1 - Sistema Biblioteca Relazionale

## Descrizione

Il progetto realizza un database relazionale per la gestione di una biblioteca scolastica utilizzando SQLite.

Il sistema permette di gestire:

- Studenti
- Libri
- Autori
- Prestiti

## Struttura del database

Le tabelle implementate sono:

- STUDENTE
- LIBRO
- AUTORE
- LIBRO_AUTORE
- PRESTITO

Le relazioni sono state realizzate mediante chiavi primarie e chiavi esterne.  
Il database è stato progettato seguendo il modello relazionale. Gli studenti possono effettuare prestiti di libri, mentre la relazione tra libri e autori è stata modellata tramite la tabella associativa LIBRO_AUTORE, necessaria per rappresentare correttamente una relazione molti-a-molti.

## File del progetto

- schema.sql → creazione delle tabelle
- insert_data.sql → popolamento del database
- queries.sql → query richieste dalla traccia
- biblioteca.py → script Python per l'esecuzione delle query
- biblioteca.db → database SQLite

## Query implementate

### Query 1

"Visualizzare i libri attualmente in prestito con le informazioni dello studente".
La prima query utilizza una JOIN tra le tabelle PRESTITO, STUDENTE e LIBRO per visualizzare i libri attualmente in prestito e i relativi studenti.

### Query 2

"Individuare gli autori che hanno scritto più di un libro".
La seconda query utilizza aggregazioni e clausole GROUP BY per individuare gli autori che hanno scritto più di un libro.

## Tecnologie utilizzate

- SQLite
- Python
- DBeaver
- GitHub

## Obiettivi della Traccia

Il progetto dimostra l'utilizzo di:

- progettazione di database relazionali;
- chiavi primarie e chiavi esterne;
- relazioni uno-a-molti e molti-a-molti;
- interrogazioni SQL;
- integrazione tra SQLite e Python.
