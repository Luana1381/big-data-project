-- Query 1
-- Elencare i libri attualmente in prestito con i dati dello studente che li possiede.

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


-- Query 2
-- Trovare gli autori che hanno scritto più libri presenti in biblioteca.

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