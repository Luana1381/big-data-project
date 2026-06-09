INSERT INTO STUDENTE (matricola, nome, cognome, classe, indirizzo_studio) VALUES
('S001', 'Giulia', 'Rossi', '3A', 'Liceo Scientifico'),
('S002', 'Marco', 'Bianchi', '4B', 'Liceo Classico'),
('S003', 'Anna', 'Verdi', '5C', 'Istituto Tecnico Informatico'),
('S004', 'Luca', 'Esposito', '2A', 'Liceo Linguistico'),
('S005', 'Sara', 'Romano', '3D', 'Liceo Scientifico');

INSERT INTO LIBRO (titolo, anno_pubblicazione, editore, copie_disponibili) VALUES
('Il nome della rosa', 1980, 'Bompiani', 3),
('Se questo è un uomo', 1947, 'Einaudi', 2),
('La coscienza di Zeno', 1923, 'Cappelli', 4),
('Il barone rampante', 1957, 'Einaudi', 2),
('Harry Potter e la pietra filosofale', 1997, 'Salani', 5),
('1984', 1949, 'Secker & Warburg', 3),
('Le città invisibili', 1972, 'Einaudi', 2);

INSERT INTO AUTORE (nome, cognome, nazionalita, data_nascita) VALUES
('Umberto', 'Eco', 'Italiana', '1932-01-05'),
('Primo', 'Levi', 'Italiana', '1919-07-31'),
('Italo', 'Svevo', 'Italiana', '1861-12-19'),
('Italo', 'Calvino', 'Italiana', '1923-10-15'),
('J.K.', 'Rowling', 'Britannica', '1965-07-31'),
('George', 'Orwell', 'Britannica', '1903-06-25');

INSERT INTO LIBRO_AUTORE (id_libro, id_autore) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 4);

INSERT INTO PRESTITO (
    matricola,
    id_libro,
    data_inizio,
    data_prevista_restituzione,
    data_effettiva_restituzione
) VALUES
('S001', 1, '2026-05-10', '2026-05-24', NULL),
('S002', 2, '2026-05-12', '2026-05-26', '2026-05-25'),
('S003', 5, '2026-05-15', '2026-05-29', NULL),
('S004', 6, '2026-05-20', '2026-06-03', NULL),
('S005', 3, '2026-04-28', '2026-05-12', '2026-05-11');