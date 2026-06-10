// QUERY 1
// Film in cui ha recitato Leonardo DiCaprio

MATCH (p:Persona {cognome:'DiCaprio'})
      -[:HA_RECITATO_IN]->
      (f:Film)
RETURN f.titolo, f.anno;


// QUERY 2
// Collaboratori di Christopher Nolan

MATCH (regista:Persona {cognome:'Nolan'})
      -[:HA_DIRETTO]->
      (film:Film)
      <-[:HA_RECITATO_IN]-
      (attore:Persona)

RETURN attore.nome,
       attore.cognome,
       COUNT(film) AS numero_film,
       COLLECT(film.titolo) AS film_condivisi;