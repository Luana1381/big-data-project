MATCH (n)
DETACH DELETE n;

// FILM

UNWIND [
    {titolo:'Inception', anno:2010, durata:148, lingua:'Inglese'},
    {titolo:'Titanic', anno:1997, durata:194, lingua:'Inglese'},
    {titolo:'The Wolf of Wall Street', anno:2013, durata:180, lingua:'Inglese'},
    {titolo:'Interstellar', anno:2014, durata:169, lingua:'Inglese'},
    {titolo:'Avatar', anno:2009, durata:162, lingua:'Inglese'},
    {titolo:'Dunkirk', anno:2017, durata:106, lingua:'Inglese'},
    {titolo:'Shutter Island', anno:2010, durata:138, lingua:'Inglese'},
    {titolo:'The Revenant', anno:2015, durata:156, lingua:'Inglese'},
    {titolo:'The Dark Knight', anno:2008, durata:152, lingua:'Inglese'},
    {titolo:'Pulp Fiction', anno:1994, durata:154, lingua:'Inglese'},
    {titolo:'Forrest Gump', anno:1994, durata:142, lingua:'Inglese'},
    {titolo:'The Matrix', anno:1999, durata:136, lingua:'Inglese'},
    {titolo:'Gladiator', anno:2000, durata:155, lingua:'Inglese'},
    {titolo:'Fight Club', anno:1999, durata:139, lingua:'Inglese'},
    {titolo:'The Godfather', anno:1972, durata:175, lingua:'Inglese'},
    {titolo:'Goodfellas', anno:1990, durata:146, lingua:'Inglese'},
    {titolo:'La La Land', anno:2016, durata:128, lingua:'Inglese'},
    {titolo:'Joker', anno:2019, durata:122, lingua:'Inglese'},
    {titolo:'Parasite', anno:2019, durata:132, lingua:'Coreano'},
    {titolo:'The Social Network', anno:2010, durata:120, lingua:'Inglese'},
    {titolo:'Her', anno:2013, durata:126, lingua:'Inglese'},
    {titolo:'Whiplash', anno:2014, durata:106, lingua:'Inglese'},
    {titolo:'Oppenheimer', anno:2023, durata:180, lingua:'Inglese'},
    {titolo:'Barbie', anno:2023, durata:114, lingua:'Inglese'},
    {titolo:'Dune', anno:2021, durata:155, lingua:'Inglese'},
    {titolo:'Arrival', anno:2016, durata:116, lingua:'Inglese'},
    {titolo:'Blade Runner 2049', anno:2017, durata:164, lingua:'Inglese'},
    {titolo:'The Grand Budapest Hotel', anno:2014, durata:99, lingua:'Inglese'},
    {titolo:'The Truman Show', anno:1998, durata:103, lingua:'Inglese'},
    {titolo:'A Beautiful Mind', anno:2001, durata:135, lingua:'Inglese'},
    {titolo:'The Imitation Game', anno:2014, durata:114, lingua:'Inglese'},
    {titolo:'Bohemian Rhapsody', anno:2018, durata:134, lingua:'Inglese'},
    {titolo:'The Theory of Everything', anno:2014, durata:123, lingua:'Inglese'},
    {titolo:'The Silence of the Lambs', anno:1991, durata:118, lingua:'Inglese'},
    {titolo:'Se7en', anno:1995, durata:127, lingua:'Inglese'},
    {titolo:'Memento', anno:2000, durata:113, lingua:'Inglese'},
    {titolo:'The Prestige', anno:2006, durata:130, lingua:'Inglese'},
    {titolo:'Tenet', anno:2020, durata:150, lingua:'Inglese'},
    {titolo:'The Departed', anno:2006, durata:151, lingua:'Inglese'},
    {titolo:'Kill Bill', anno:2003, durata:111, lingua:'Inglese'}
] AS film
CREATE (:Film {
    titolo: film.titolo,
    anno: film.anno,
    durata: film.durata,
    lingua: film.lingua
});

// PERSONE

UNWIND [
    {nome:'Leonardo', cognome:'DiCaprio', data_nascita:'1974-11-11', nazionalita:'Statunitense'},
    {nome:'Christopher', cognome:'Nolan', data_nascita:'1970-07-30', nazionalita:'Britannica'},
    {nome:'James', cognome:'Cameron', data_nascita:'1954-08-16', nazionalita:'Canadese'},
    {nome:'Kate', cognome:'Winslet', data_nascita:'1975-10-05', nazionalita:'Britannica'},
    {nome:'Matthew', cognome:'McConaughey', data_nascita:'1969-11-04', nazionalita:'Statunitense'},
    {nome:'Anne', cognome:'Hathaway', data_nascita:'1982-11-12', nazionalita:'Statunitense'},
    {nome:'Tom', cognome:'Hardy', data_nascita:'1977-09-15', nazionalita:'Britannica'},
    {nome:'Christian', cognome:'Bale', data_nascita:'1974-01-30', nazionalita:'Britannica'},
    {nome:'Quentin', cognome:'Tarantino', data_nascita:'1963-03-27', nazionalita:'Statunitense'},
    {nome:'John', cognome:'Travolta', data_nascita:'1954-02-18', nazionalita:'Statunitense'},
    {nome:'Samuel', cognome:'Jackson', data_nascita:'1948-12-21', nazionalita:'Statunitense'},
    {nome:'Tom', cognome:'Hanks', data_nascita:'1956-07-09', nazionalita:'Statunitense'},
    {nome:'Keanu', cognome:'Reeves', data_nascita:'1964-09-02', nazionalita:'Canadese'},
    {nome:'Russell', cognome:'Crowe', data_nascita:'1964-04-07', nazionalita:'Neozelandese'},
    {nome:'Brad', cognome:'Pitt', data_nascita:'1963-12-18', nazionalita:'Statunitense'},
    {nome:'Marlon', cognome:'Brando', data_nascita:'1924-04-03', nazionalita:'Statunitense'},
    {nome:'Robert', cognome:'De Niro', data_nascita:'1943-08-17', nazionalita:'Statunitense'},
    {nome:'Martin', cognome:'Scorsese', data_nascita:'1942-11-17', nazionalita:'Statunitense'},
    {nome:'Emma', cognome:'Stone', data_nascita:'1988-11-06', nazionalita:'Statunitense'},
    {nome:'Ryan', cognome:'Gosling', data_nascita:'1980-11-12', nazionalita:'Canadese'},
    {nome:'Joaquin', cognome:'Phoenix', data_nascita:'1974-10-28', nazionalita:'Statunitense'},
    {nome:'Bong', cognome:'Joon-ho', data_nascita:'1969-09-14', nazionalita:'Coreana'},
    {nome:'Jesse', cognome:'Eisenberg', data_nascita:'1983-10-05', nazionalita:'Statunitense'},
    {nome:'Andrew', cognome:'Garfield', data_nascita:'1983-08-20', nazionalita:'Britannica'},
    {nome:'Scarlett', cognome:'Johansson', data_nascita:'1984-11-22', nazionalita:'Statunitense'},
    {nome:'Miles', cognome:'Teller', data_nascita:'1987-02-20', nazionalita:'Statunitense'},
    {nome:'Cillian', cognome:'Murphy', data_nascita:'1976-05-25', nazionalita:'Irlandese'},
    {nome:'Margot', cognome:'Robbie', data_nascita:'1990-07-02', nazionalita:'Australiana'},
    {nome:'Timothee', cognome:'Chalamet', data_nascita:'1995-12-27', nazionalita:'Statunitense'},
    {nome:'Zendaya', cognome:'Coleman', data_nascita:'1996-09-01', nazionalita:'Statunitense'},
    {nome:'Amy', cognome:'Adams', data_nascita:'1974-08-20', nazionalita:'Statunitense'},
    {nome:'Harrison', cognome:'Ford', data_nascita:'1942-07-13', nazionalita:'Statunitense'},
    {nome:'Ralph', cognome:'Fiennes', data_nascita:'1962-12-22', nazionalita:'Britannica'},
    {nome:'Jim', cognome:'Carrey', data_nascita:'1962-01-17', nazionalita:'Canadese'},
    {nome:'Benedict', cognome:'Cumberbatch', data_nascita:'1976-07-19', nazionalita:'Britannica'},
    {nome:'Rami', cognome:'Malek', data_nascita:'1981-05-12', nazionalita:'Statunitense'},
    {nome:'Eddie', cognome:'Redmayne', data_nascita:'1982-01-06', nazionalita:'Britannica'},
    {nome:'Jodie', cognome:'Foster', data_nascita:'1962-11-19', nazionalita:'Statunitense'},
    {nome:'Anthony', cognome:'Hopkins', data_nascita:'1937-12-31', nazionalita:'Britannica'},
    {nome:'Morgan', cognome:'Freeman', data_nascita:'1937-06-01', nazionalita:'Statunitense'},
    {nome:'Edward', cognome:'Norton', data_nascita:'1969-08-18', nazionalita:'Statunitense'},
    {nome:'Al', cognome:'Pacino', data_nascita:'1940-04-25', nazionalita:'Statunitense'},
    {nome:'David', cognome:'Fincher', data_nascita:'1962-08-28', nazionalita:'Statunitense'},
    {nome:'Denis', cognome:'Villeneuve', data_nascita:'1967-10-03', nazionalita:'Canadese'},
    {nome:'Greta', cognome:'Gerwig', data_nascita:'1983-08-04', nazionalita:'Statunitense'}
] AS persona
CREATE (:Persona {
    nome: persona.nome,
    cognome: persona.cognome,
    data_nascita: persona.data_nascita,
    nazionalita: persona.nazionalita
});

// GENERI

UNWIND [
    'Fantascienza',
    'Drammatico',
    'Biografico',
    'Thriller',
    'Azione',
    'Avventura',
    'Romantico',
    'Crime',
    'Commedia',
    'Storico',
    'Musicale',
    'Psicologico',
    'Noir',
    'Guerra',
    'Fantasy',
    'Satira',
    'Horror',
    'Mistero',
    'Animazione',
    'Documentario'
] AS nomeGenere
CREATE (:Genere {nome:nomeGenere});

// RELAZIONI HA_RECITATO_IN

UNWIND [
    ['DiCaprio','Inception'],
    ['DiCaprio','Titanic'],
    ['DiCaprio','The Wolf of Wall Street'],
    ['DiCaprio','Shutter Island'],
    ['DiCaprio','The Revenant'],
    ['DiCaprio','The Departed'],
    ['Winslet','Titanic'],
    ['McConaughey','Interstellar'],
    ['Hathaway','Interstellar'],
    ['Hathaway','The Dark Knight'],
    ['Hardy','Inception'],
    ['Hardy','Dunkirk'],
    ['Bale','The Dark Knight'],
    ['Travolta','Pulp Fiction'],
    ['Jackson','Pulp Fiction'],
    ['Jackson','Kill Bill'],
    ['Hanks','Forrest Gump'],
    ['Reeves','The Matrix'],
    ['Crowe','Gladiator'],
    ['Pitt','Fight Club'],
    ['Pitt','Se7en'],
    ['Brando','The Godfather'],
    ['Pacino','The Godfather'],
    ['De Niro','Goodfellas'],
    ['Stone','La La Land'],
    ['Gosling','La La Land'],
    ['Phoenix','Joker'],
    ['Eisenberg','The Social Network'],
    ['Garfield','The Social Network'],
    ['Johansson','Her'],
    ['Teller','Whiplash'],
    ['Murphy','Oppenheimer'],
    ['Robbie','Barbie'],
    ['Chalamet','Dune'],
    ['Coleman','Dune'],
    ['Adams','Arrival'],
    ['Gosling','Blade Runner 2049'],
    ['Ford','Blade Runner 2049'],
    ['Fiennes','The Grand Budapest Hotel'],
    ['Carrey','The Truman Show'],
    ['Crowe','A Beautiful Mind'],
    ['Cumberbatch','The Imitation Game'],
    ['Malek','Bohemian Rhapsody'],
    ['Redmayne','The Theory of Everything'],
    ['Foster','The Silence of the Lambs'],
    ['Hopkins','The Silence of the Lambs'],
    ['Freeman','Se7en'],
    ['Norton','Fight Club'],
    ['Bale','The Prestige'],
    ['Jackson','Pulp Fiction']
] AS relazione
MATCH (p:Persona {cognome: relazione[0]}), (f:Film {titolo: relazione[1]})
CREATE (p)-[:HA_RECITATO_IN]->(f);

// RELAZIONI HA_DIRETTO

UNWIND [
    ['Nolan','Inception'],
    ['Nolan','Interstellar'],
    ['Nolan','Dunkirk'],
    ['Nolan','The Dark Knight'],
    ['Nolan','Memento'],
    ['Nolan','The Prestige'],
    ['Nolan','Tenet'],
    ['Nolan','Oppenheimer'],
    ['Cameron','Titanic'],
    ['Cameron','Avatar'],
    ['Scorsese','The Wolf of Wall Street'],
    ['Scorsese','Shutter Island'],
    ['Scorsese','Goodfellas'],
    ['Scorsese','The Departed'],
    ['Tarantino','Pulp Fiction'],
    ['Tarantino','Kill Bill'],
    ['Fincher','Fight Club'],
    ['Fincher','Se7en'],
    ['Fincher','The Social Network'],
    ['Villeneuve','Dune'],
    ['Villeneuve','Arrival'],
    ['Villeneuve','Blade Runner 2049'],
    ['Gerwig','Barbie'],
    ['Bong','Parasite']
] AS relazione
MATCH (p:Persona {cognome: relazione[0]}), (f:Film {titolo: relazione[1]})
CREATE (p)-[:HA_DIRETTO]->(f);

// RELAZIONI APPARTIENE_A

UNWIND [
    ['Inception','Fantascienza'],
    ['Titanic','Drammatico'],
    ['The Wolf of Wall Street','Biografico'],
    ['Interstellar','Fantascienza'],
    ['Avatar','Fantascienza'],
    ['Dunkirk','Guerra'],
    ['Shutter Island','Thriller'],
    ['The Revenant','Avventura'],
    ['The Dark Knight','Azione'],
    ['Pulp Fiction','Crime'],
    ['Forrest Gump','Drammatico'],
    ['The Matrix','Fantascienza'],
    ['Gladiator','Storico'],
    ['Fight Club','Psicologico'],
    ['The Godfather','Crime'],
    ['Goodfellas','Crime'],
    ['La La Land','Musicale'],
    ['Joker','Psicologico'],
    ['Parasite','Satira'],
    ['The Social Network','Biografico'],
    ['Her','Romantico'],
    ['Whiplash','Drammatico'],
    ['Oppenheimer','Biografico'],
    ['Barbie','Commedia'],
    ['Dune','Fantascienza'],
    ['Arrival','Fantascienza'],
    ['Blade Runner 2049','Fantascienza'],
    ['The Grand Budapest Hotel','Commedia'],
    ['The Truman Show','Satira'],
    ['A Beautiful Mind','Biografico'],
    ['The Imitation Game','Biografico'],
    ['Bohemian Rhapsody','Biografico'],
    ['The Theory of Everything','Biografico'],
    ['The Silence of the Lambs','Thriller'],
    ['Se7en','Thriller'],
    ['Memento','Mistero'],
    ['The Prestige','Mistero'],
    ['Tenet','Fantascienza'],
    ['The Departed','Crime'],
    ['Kill Bill','Azione']
] AS relazione
MATCH (f:Film {titolo: relazione[0]}), (g:Genere {nome: relazione[1]})
CREATE (f)-[:APPARTIENE_A]->(g);

// QUERY DI CONTROLLO NUMERO NODI

MATCH (n)
RETURN labels(n) AS tipo_nodo, count(n) AS numero_nodi;