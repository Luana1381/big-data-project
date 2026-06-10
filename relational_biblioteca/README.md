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

## File del progetto

- schema.sql → creazione delle tabelle
- insert_data.sql → popolamento del database
- queries.sql → query richieste dalla traccia
- biblioteca.py → script Python per l'esecuzione delle query
- biblioteca.db → database SQLite

## Query implementate

### Query 1

Visualizzare i libri attualmente in prestito con le informazioni dello studente.

### Query 2

Individuare gli autori che hanno scritto più di un libro.

## Tecnologie utilizzate

- SQLite
- Python
- DBeaver
- GitHub