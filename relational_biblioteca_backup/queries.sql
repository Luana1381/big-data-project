-- Verifica popolamento database

SELECT 'STUDENTE' AS tabella, COUNT(*) AS numero_record FROM STUDENTE
UNION ALL
SELECT 'LIBRO', COUNT(*) FROM LIBRO
UNION ALL
SELECT 'AUTORE', COUNT(*) FROM AUTORE
UNION ALL
SELECT 'LIBRO_AUTORE', COUNT(*) FROM LIBRO_AUTORE
UNION ALL
SELECT 'PRESTITO', COUNT(*) FROM PRESTITO;


-- Query 1
-- Visualizzare i libri attualmente in prestito con le informazioni dello studente

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
-- Individuare gli autori che hanno scritto più di un libro

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