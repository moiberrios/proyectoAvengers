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