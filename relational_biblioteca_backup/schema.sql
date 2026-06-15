CREATE TABLE STUDENTE (
    matricola TEXT PRIMARY KEY,
    nome TEXT NOT NULL,
    cognome TEXT NOT NULL,
    classe TEXT NOT NULL,
    indirizzo_studio TEXT NOT NULL
);

CREATE TABLE LIBRO (
    id_libro INTEGER PRIMARY KEY AUTOINCREMENT,
    titolo TEXT NOT NULL,
    anno_pubblicazione INTEGER NOT NULL,
    editore TEXT NOT NULL,
    copie_disponibili INTEGER NOT NULL
);

CREATE TABLE AUTORE (
    id_autore INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cognome TEXT NOT NULL,
    nazionalita TEXT,
    data_nascita TEXT
);

CREATE TABLE LIBRO_AUTORE (
    id_libro INTEGER NOT NULL,
    id_autore INTEGER NOT NULL,

    PRIMARY KEY (id_libro, id_autore),

    FOREIGN KEY (id_libro)
        REFERENCES LIBRO(id_libro),

    FOREIGN KEY (id_autore)
        REFERENCES AUTORE(id_autore)
);

CREATE TABLE PRESTITO (
    id_prestito INTEGER PRIMARY KEY AUTOINCREMENT,
    matricola TEXT NOT NULL,
    id_libro INTEGER NOT NULL,
    data_inizio TEXT NOT NULL,
    data_prevista_restituzione TEXT NOT NULL,
    data_effettiva_restituzione TEXT,

    FOREIGN KEY (matricola)
        REFERENCES STUDENTE(matricola),

    FOREIGN KEY (id_libro)
        REFERENCES LIBRO(id_libro)
);