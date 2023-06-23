-- 7. [ ] Liste los personajes de películas más vistas para identificar que personajes prefieren los usuarios
create view personajes_peliculas_mas_vistas as 
select * 
from perMed pm in (select m.medID
                    from medio m, rating r 
                    where medPelicula is not NULL
                    and m.medID = r.medID
                    and r.medID IN (select medID
                                        from rating
                                        where ratingPuntaje = 5)
);

-- Nombre de superhéroe o supervillano que poseen poderes artificiales y que han sido líderes. 
select P.personajeID, P.perNombre1, P.perApellido1, PH.persHeroeID,PH.superHeroeNombre
from personaje P join persHeroe PH on P.personajeHeroe = PH.PersHeroeID 
-- where P.personajeHeroe = 1

UNION all

select P.personajeID, P.perNombre1, P.perApellido1, PV.persVillanoID,PV.persVillanoNombre
from personaje P join persVillano PV on P.personajeVillano = PV.persVillanoID
-- where P.personajeVillano = 1

