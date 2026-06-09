import sqlite3

conn = sqlite3.connect("biblioteca.db")

cursor = conn.cursor()

query1 = """
SELECT
    l.id_libro,
    l.titolo,
    l.anno_pubblicazione,
    l.editore,
    p.data_inizio,
    p.data_prevista_restituzione,
    s.matricola,
    s.nome,
    s.cognome,
    s.classe,
    s.indirizzo_studio
FROM PRESTITO p
JOIN LIBRO l
    ON p.id_libro = l.id_libro
JOIN STUDENTE s
    ON p.matricola = s.matricola
WHERE p.data_effettiva_restituzione IS NULL;
"""

cursor.execute(query1)

print("LIBRI ATTUALMENTE IN PRESTITO\n")

for riga in cursor.fetchall():
    print(riga)

query2 = """
SELECT
    a.id_autore,
    a.nome,
    a.cognome,
    a.nazionalita,
    COUNT(la.id_libro) AS numero_libri
FROM AUTORE a
JOIN LIBRO_AUTORE la
    ON a.id_autore = la.id_autore
GROUP BY
    a.id_autore,
    a.nome,
    a.cognome,
    a.nazionalita
HAVING COUNT(la.id_libro) > 1
ORDER BY numero_libri DESC;
"""

cursor.execute(query2)

print("\nAUTORI CON PIÙ DI UN LIBRO\n")

for riga in cursor.fetchall():
    print(riga)

conn.close()