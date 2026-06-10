// FILM

CREATE (f1:Film {
    titolo:'Inception',
    anno:2010,
    durata:148,
    lingua:'Inglese'
});

CREATE (f2:Film {
    titolo:'Titanic',
    anno:1997,
    durata:194,
    lingua:'Inglese'
});

CREATE (f3:Film {
    titolo:'The Wolf of Wall Street',
    anno:2013,
    durata:180,
    lingua:'Inglese'
});

// PERSONE

CREATE (p1:Persona {
    nome:'Leonardo',
    cognome:'DiCaprio',
    data_nascita:'1974-11-11',
    nazionalita:'Statunitense'
});

CREATE (p2:Persona {
    nome:'Christopher',
    cognome:'Nolan',
    data_nascita:'1970-07-30',
    nazionalita:'Britannica'
});

CREATE (p3:Persona {
    nome:'James',
    cognome:'Cameron',
    data_nascita:'1954-08-16',
    nazionalita:'Canadese'
});

CREATE (p4:Persona {
    nome:'Kate',
    cognome:'Winslet',
    data_nascita:'1975-10-05',
    nazionalita:'Britannica'
});

// GENERI

CREATE (g1:Genere {nome:'Fantascienza'});
CREATE (g2:Genere {nome:'Drammatico'});
CREATE (g3:Genere {nome:'Biografico'});

// RELAZIONI

MATCH (leo:Persona {cognome:'DiCaprio'}),
      (inception:Film {titolo:'Inception'})
CREATE (leo)-[:HA_RECITATO_IN]->(inception);

MATCH (leo:Persona {cognome:'DiCaprio'}),
      (titanic:Film {titolo:'Titanic'})
CREATE (leo)-[:HA_RECITATO_IN]->(titanic);

MATCH (leo:Persona {cognome:'DiCaprio'}),
      (wolf:Film {titolo:'The Wolf of Wall Street'})
CREATE (leo)-[:HA_RECITATO_IN]->(wolf);

MATCH (kate:Persona {cognome:'Winslet'}),
      (titanic:Film {titolo:'Titanic'})
CREATE (kate)-[:HA_RECITATO_IN]->(titanic);

MATCH (nolan:Persona {cognome:'Nolan'}),
      (inception:Film {titolo:'Inception'})
CREATE (nolan)-[:HA_DIRETTO]->(inception);

MATCH (cameron:Persona {cognome:'Cameron'}),
      (titanic:Film {titolo:'Titanic'})
CREATE (cameron)-[:HA_DIRETTO]->(titanic);

MATCH (inception:Film {titolo:'Inception'}),
      (fantascienza:Genere {nome:'Fantascienza'})
CREATE (inception)-[:APPARTIENE_A]->(fantascienza);

MATCH (titanic:Film {titolo:'Titanic'}),
      (drammatico:Genere {nome:'Drammatico'})
CREATE (titanic)-[:APPARTIENE_A]->(drammatico);

MATCH (wolf:Film {titolo:'The Wolf of Wall Street'}),
      (biografico:Genere {nome:'Biografico'})
CREATE (wolf)-[:APPARTIENE_A]->(biografico);