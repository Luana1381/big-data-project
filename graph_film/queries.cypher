// QUERY 1
// Film in cui ha recitato Leonardo DiCaprio

MATCH (p:Persona {cognome:'DiCaprio'})
      -[:HA_RECITATO_IN]->
      (f:Film)
RETURN
    f.titolo AS titolo_film,
    f.anno AS anno_uscita
ORDER BY f.anno;


// QUERY 2
// Collaboratori di Christopher Nolan

MATCH (regista:Persona {cognome:'Nolan'})
      -[:HA_DIRETTO]->
      (film:Film)
      <-[:HA_RECITATO_IN]-
      (attore:Persona)
RETURN
    attore.nome AS nome,
    attore.cognome AS cognome,
    COUNT(film) AS numero_film,
    COLLECT(film.titolo) AS film_condivisi
ORDER BY numero_film DESC, cognome;