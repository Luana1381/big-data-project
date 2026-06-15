import sqlite3
import csv
import os


DB_NAME = "relational_biblioteca/biblioteca.db"
OUTPUT_DIR = "relational_biblioteca/output_query"

os.makedirs(OUTPUT_DIR, exist_ok=True)

conn = sqlite3.connect(DB_NAME)
cursor = conn.cursor()

query1 = """
SELECT
    p.id_prestito,
    c.id_copia,
    c.stato,
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
JOIN COPIA c
    ON p.id_copia = c.id_copia
JOIN LIBRO l
    ON c.id_libro = l.id_libro
JOIN STUDENTE s
    ON p.matricola = s.matricola
WHERE p.data_effettiva_restituzione IS NULL
ORDER BY p.data_inizio;
"""

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


def esporta_csv(nome_file, query):
    cursor.execute(query)

    colonne = [descrizione[0] for descrizione in cursor.description]
    righe = cursor.fetchall()

    percorso_file = os.path.join(OUTPUT_DIR, nome_file)

    with open(percorso_file, mode="w", newline="", encoding="utf-8") as file_csv:
        writer = csv.writer(file_csv)
        writer.writerow(colonne)
        writer.writerows(righe)


esporta_csv("query1_copie_in_prestito.csv", query1)
esporta_csv("query2_autori_piu_libri.csv", query2)

conn.close()

print("Output delle query esportati correttamente nella cartella relational_biblioteca/output_query.")