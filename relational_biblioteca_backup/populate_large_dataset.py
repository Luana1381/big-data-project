import sqlite3
from datetime import date, timedelta
import random


DB_NAME = "relational_biblioteca/biblioteca.db"

random.seed(42)

conn = sqlite3.connect(DB_NAME)
cursor = conn.cursor()

cursor.execute("PRAGMA foreign_keys = ON;")

cursor.executescript("""
DROP TABLE IF EXISTS PRESTITO;
DROP TABLE IF EXISTS LIBRO_AUTORE;
DROP TABLE IF EXISTS AUTORE;
DROP TABLE IF EXISTS LIBRO;
DROP TABLE IF EXISTS STUDENTE;

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
    FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro),
    FOREIGN KEY (id_autore) REFERENCES AUTORE(id_autore)
);

CREATE TABLE PRESTITO (
    id_prestito INTEGER PRIMARY KEY AUTOINCREMENT,
    matricola TEXT NOT NULL,
    id_libro INTEGER NOT NULL,
    data_inizio TEXT NOT NULL,
    data_prevista_restituzione TEXT NOT NULL,
    data_effettiva_restituzione TEXT,
    FOREIGN KEY (matricola) REFERENCES STUDENTE(matricola),
    FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro)
);
""")

nomi = [
    "Giulia", "Marco", "Anna", "Luca", "Sara", "Francesca", "Alessandro",
    "Martina", "Davide", "Chiara", "Elena", "Matteo", "Giorgia", "Andrea",
    "Simone", "Valentina", "Federico", "Aurora", "Riccardo", "Camilla"
]

cognomi = [
    "Rossi", "Bianchi", "Verdi", "Esposito", "Romano", "Colombo", "Ricci",
    "Marino", "Greco", "Bruno", "Gallo", "Conti", "De Luca", "Mancini",
    "Costa", "Giordano", "Rizzo", "Lombardi", "Moretti", "Barbieri"
]

indirizzi = [
    "Liceo Scientifico",
    "Liceo Classico",
    "Liceo Linguistico",
    "Istituto Tecnico Informatico",
    "Istituto Tecnico Economico"
]

classi = ["1A", "2A", "3A", "4A", "5A", "1B", "2B", "3B", "4B", "5B"]

studenti = []

for i in range(1, 41):
    matricola = f"S{i:03d}"
    nome = random.choice(nomi)
    cognome = random.choice(cognomi)
    classe = random.choice(classi)
    indirizzo = random.choice(indirizzi)
    studenti.append((matricola, nome, cognome, classe, indirizzo))

cursor.executemany("""
INSERT INTO STUDENTE (matricola, nome, cognome, classe, indirizzo_studio)
VALUES (?, ?, ?, ?, ?);
""", studenti)

editori = [
    "Einaudi", "Mondadori", "Feltrinelli", "Bompiani", "Laterza",
    "Rizzoli", "Garzanti", "Salani", "Adelphi", "Zanichelli"
]

titoli_base = [
    "Il viaggio della conoscenza", "Storie di scuola", "Matematica e realtà",
    "Introduzione alla letteratura", "Percorsi di storia", "Scienza e società",
    "Il mondo dei dati", "La città invisibile", "Racconti del Novecento",
    "Pensiero critico", "Fondamenti di informatica", "La biblioteca dei sogni"
]

libri = []

for i in range(1, 61):
    titolo = f"{random.choice(titoli_base)} - Volume {i}"
    anno = random.randint(1950, 2025)
    editore = random.choice(editori)
    copie = random.randint(1, 8)
    libri.append((titolo, anno, editore, copie))

cursor.executemany("""
INSERT INTO LIBRO (titolo, anno_pubblicazione, editore, copie_disponibili)
VALUES (?, ?, ?, ?);
""", libri)

nazionalita = ["Italiana", "Britannica", "Francese", "Statunitense", "Spagnola", "Tedesca"]

autori = []

for i in range(1, 26):
    nome = random.choice(nomi)
    cognome = random.choice(cognomi)
    naz = random.choice(nazionalita)
    anno = random.randint(1940, 1990)
    mese = random.randint(1, 12)
    giorno = random.randint(1, 28)
    data_nascita = f"{anno}-{mese:02d}-{giorno:02d}"
    autori.append((nome, cognome, naz, data_nascita))

cursor.executemany("""
INSERT INTO AUTORE (nome, cognome, nazionalita, data_nascita)
VALUES (?, ?, ?, ?);
""", autori)

associazioni = set()

for id_libro in range(1, 61):
    numero_autori = random.choice([1, 1, 1, 2])
    autori_scelti = random.sample(range(1, 26), numero_autori)

    for id_autore in autori_scelti:
        associazioni.add((id_libro, id_autore))

while len(associazioni) < 90:
    associazioni.add((random.randint(1, 60), random.randint(1, 25)))

cursor.executemany("""
INSERT INTO LIBRO_AUTORE (id_libro, id_autore)
VALUES (?, ?);
""", list(associazioni))

prestiti = []
data_base = date(2026, 1, 10)

for i in range(1, 121):
    matricola = random.choice(studenti)[0]
    id_libro = random.randint(1, 60)

    data_inizio = data_base + timedelta(days=random.randint(0, 160))
    data_prevista = data_inizio + timedelta(days=14)

    if random.random() < 0.65:
        data_effettiva = data_inizio + timedelta(days=random.randint(7, 20))
        data_effettiva_str = data_effettiva.isoformat()
    else:
        data_effettiva_str = None

    prestiti.append((
        matricola,
        id_libro,
        data_inizio.isoformat(),
        data_prevista.isoformat(),
        data_effettiva_str
    ))

cursor.executemany("""
INSERT INTO PRESTITO (
    matricola,
    id_libro,
    data_inizio,
    data_prevista_restituzione,
    data_effettiva_restituzione
)
VALUES (?, ?, ?, ?, ?);
""", prestiti)

conn.commit()

print("Database biblioteca.db popolato correttamente.")
print(f"Studenti inseriti: {len(studenti)}")
print(f"Libri inseriti: {len(libri)}")
print(f"Autori inseriti: {len(autori)}")
print(f"Associazioni libro-autore inserite: {len(associazioni)}")
print(f"Prestiti inseriti: {len(prestiti)}")

conn.close()