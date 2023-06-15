INSERT INTO personaje (perNombre1, perApellido1, perGenero, perColorPelo, perColorOjos, perEdoMarital, perPrimeraAparicionComic, perFraseMasCelebre, personajeHeroe, personajeVillano, personajeCivil)
VALUES 
('Peter', 'Parker', 'M', 'Café', 'Azul', 'Soltero', 15, '¡Un gran poder conlleva una gran responsabilidad!', 1, 0, 0),
('Bruce', 'Wayne', 'M', 'Negro', 'Azul', 'Soltero', 27, 'Soy Batman', 1, 0, 0),
('Diana', 'Prince', 'F', 'Negro', 'Azul', 'Soltera', 8, 'La verdad es la única forma de liberarse', 1, 0, 0),
('Clark', 'Kent', 'M', 'Negro', 'Azul', 'Soltero', 1, '¡Hasta el infinito y más allá!', 1, 0, 0),
('Tony', 'Stark', 'M', 'Negro', 'Marrón', 'Soltero', 39, 'Soy Iron Man', 1, 0, 0),
('Natasha', 'Romanoff', 'F', 'Rojo', 'Verde', 'Soltera', 52, 'En la venganza como en el amor, la mujer es más bárbara que el hombre', 1, 0, 0),
('Wade', 'Wilson', 'M', 'No tiene', 'Azul', 'Soltero', 98, '¡Máxima esfuerzo!', 1, 0, 0),
('Carol', 'Danvers', 'F', 'Rubio', 'Azul', 'Soltera', 13, 'Mayor, más rápido, mejor', 1, 0, 0),
('Scott', 'Lang', 'M', 'Marrón', 'Verde', 'Divorciado', 181, '¿Alguna vez has robado algo que en realidad ya era tuyo?', 1, 0, 0),
('Thor', '', 'M', 'Rubio', 'Azul', 'Soltero', 83, '¡Por Odín!', 1, 0, 0),
('Loki', '', 'M', 'Negro', 'Verde', 'Soltero', 85, 'Sí, lo soy. ¿Qué tal si me divierto un poco?', 0, 1, 0),
('Jean', 'Grey', 'F', 'Rojo', 'Verde', 'Casada', 1, 'La muerte no es el final', 1, 0, 0),
('Bruce', 'Banner', 'M', 'Negro', 'Marrón', 'Soltero', 1, '¡No me hagas enojar!', 1, 0, 0),
('James', 'Logan', 'M', 'Negro', 'Marrón', 'Soltero', 1, '¡Soy el mejor en lo que hago!', 1, 0, 0),
('Maria', 'Hill', 'F', 'Negro', 'Marrón', 'Soltera', 1, '¿Alguna vez te has sentido responsable de la muerte de miles?', 0, 0, 1),
('Nick', 'Fury', 'M', 'Negro', 'Marrón', 'Soltero', 1, 'La cuestión es, ¿confías en mí?', 1, 0, 0),
('Sam', 'Wilson', 'M', 'Negro', 'Marrón', 'Soltero', 9, 'En tus marcas, listos, ¡ya!', 1, 0, 0),
('TChalla', '', 'M', 'Negro', 'Marrón', 'Soltero', 52, 'Wakanda para siempre', 1, 0, 0),
('Peggy', 'Carter', 'F', 'Rubio', 'Azul', 'Soltera', 1, 'Los hombres la llevan a la guerra y las mujeres la traen de vuelta', 0, 0, 1),
('Steve', 'Rogers', 'M', 'Rubio', 'Azul', 'Soltero', 1, '¡Avengers, reuníos!', 1, 0, 0);

INSERT INTO actor (actorNombre1, actorNombre2, actorApell1, actorApell2)
VALUES 
('Tom', 'Hanks', 'Hanks', NULL),
('Meryl', 'Streep', 'Streep', NULL),
('Leonardo', NULL, 'DiCaprio', NULL),
('Kate', NULL, 'Winslet', NULL),
('Robert', NULL, 'De Niro', NULL),
('Al', 'Pacino', 'Pacino', NULL),
('Denzel', NULL, 'Washington', NULL),
('Anne', NULL, 'Hathaway', NULL),
('Emma', NULL, 'Stone', NULL),
('Brad', NULL, 'Pitt', NULL),
('Angelina', NULL, 'Jolie', NULL),
('Johnny', NULL, 'Depp', NULL),
('Tom', 'Cruise', 'Cruise', NULL),
('Natalie', NULL, 'Portman', NULL),
('Jennifer', NULL, 'Lawrence', NULL),
('Will', NULL, 'Smith', NULL),
('Matt', NULL, 'Damon', NULL),
('Charlize', NULL, 'Theron', NULL),
('Scarlett', NULL, 'Johansson', NULL),
('Daniel', NULL, 'Craig', NULL);

INSERT INTO organizacion (orgNombre, orgEslogan, orgLiderMasConocido, orgTipoOrg, orgObjetivoPpal, orgLugarCreacion, orgFundador, orgPrimerAparComics)
VALUES 
('SHIELD', 'Proteger al mundo de amenazas sobrenaturales', 1, 'Agencia de espionaje', 'Mantener la paz y la seguridad mundial', 1965, 1, 1965),
('Liga de la Justicia', 'La justicia siempre prevalecerá!', 1, 'Superhéroes', 'Proteger al mundo de amenazas sobrenaturales', 1960, 1, 1960),
('X-Men', 'Protegiendo a una humanidad que les teme!', 1, 'Superhéroes', 'Promover la coexistencia pacífica entre humanos y mutantes', 1963, 1, 1963),
('Los Vengadores', '¡Unidos venceremos!', 1, 'Superhéroes', 'Proteger al mundo de amenazas sobrenaturales', 1963, 1, 1963),
('La Liga de la Justicia Oscura', 'Protegiendo al mundo de lo sobrenatural!',1, 'Superhéroes', 'Proteger al mundo de amenazas sobrenaturales', 2011, 1, 2011),
('Hydra', 'Cortar una cabeza y crecerán dos más en su lugar', 1, 'Supervillanos', 'Establecer el control global', 1965, 1, 1965),
('La Hermandad de Mutantes', 'Los mutantes son el futuro!', 1, 'Supervillanos', 'Establecer la supremacía mutante', 1964, 1, 1964),
('Los Cuatro Fantásticos', 'Unidos somos invencibles!', 1, 'Superhéroes', 'Explorar el universo y proteger a la Tierra de amenazas extraterrestres', 1961, 1, 1961),
('La Patrulla-X', 'Protegiendo un mundo que los odia!', 1, 'Superhéroes', 'Promover la coexistencia pacífica entre humanos y mutantes', 1963, 1, 1963),
('Los Inhumanos', 'Unidos somos una fuerza imparable!', 1, 'Superhéroes', 'Proteger a los Inhumanos de amenazas externas', 1965, 1, 1965);

INSERT INTO poder (poderNombre, poderDescripcion)
VALUES 
('Superfuerza', 'Capacidad sobrehumana de fuerza física'),
('Vuelo', 'Habilidad de volar o levitar en el aire'),
('Teletransporte', 'Capacidad de moverse instantáneamente de un lugar a otro'),
('Regeneración', 'Habilidad de regenerar células y tejidos del cuerpo'),
('Invisibilidad', 'Habilidad de volverse invisible a voluntad'),
('Control mental', 'Habilidad de controlar la mente de otros seres'),
('Telepatía', 'Habilidad de leer los pensamientos de otros seres'),
('Telequinesis', 'Habilidad de mover objetos con la mente'),
('Manipulación del tiempo', 'Capacidad de manipular el flujo del tiempo'),
('Control elemental', 'Habilidad de controlar los elementos naturales, como el agua, el fuego, el aire y la tierra'),
('Teleportación', 'Habilidad de moverse instantáneamente de un lugar a otro'),
('Super velocidad', 'Capacidad sobrehumana de moverse a velocidades extremas'),
('Piroquinesis', 'Habilidad de controlar el fuego'),
('Criokinesis', 'Habilidad de controlar el hielo'),
('Electroquinesis', 'Habilidad de controlar la electricidad'),
('Transformación', 'Habilidad de cambiar de forma, tamaño o apariencia'),
('Fuerza sobrehumana', 'Capacidad sobrehumana de fuerza física'),
('Inmortalidad', 'Incapacidad de morir o envejecer'),
('Lanzamiento de rayos', 'Habilidad de lanzar rayos de energía'),
('Armadura corporal', 'Habilidad de crear una armadura protectora alrededor del cuerpo');

INSERT INTO tipoObjeto (tipoObjetoNombre)
VALUES 
('Mjonir'),
('soejf'),
('jsejf'),
('jsojef'),
('jsejof'),
('soeofje'),
('sjeoef'),
('sjof'),
('sief'),
('seojf'),
('seojf'),
('seoja'),
('sejof'),
('sjefo'),
('efjo'),
('eosf'),
('eosjfo'),
('sej2'),
('isoe'),
('3j3');

INSERT INTO objeto (objetoNombre, objetoMaterialFabricacion, objetoTipoFK, objetoDescripcion)
VALUES 
('Martillo de Thor', 'Uru', 1, 'Poderoso martillo mágico que solo puede ser levantado por aquellos que son dignos'),
('Escudo del Capitán América', 'Vibranium', 2, 'Escudo circular indestructible que puede ser utilizado tanto para la defensa como para el ataque'),
('Anillo del poder', 'Oro', 3, 'Anillo mágico que otorga al usuario increíbles habilidades y poderes'),
('Batarang', 'Acero', 4, 'Boomerang en forma de murciélago utilizado por Batman como arma y herramienta de navegación'),
('Lazo de la verdad', 'Oricalco', 5, 'Lazo mágico que obliga a cualquier ser que lo toque a decir la verdad'),
('Mjolnir', 'Uru', 1, 'Martillo mágico de Thor que solo puede ser levantado por aquellos que son dignos'),
('Tridente de Neptuno', 'Titanio', 6, 'Poderoso tridente utilizado por el dios del mar Neptuno para controlar los océanos'),
('Lanza de Longinus', 'Plata', 7, 'Lanza sagrada utilizada para perforar el costado de Cristo durante su crucifixión'),
('Luz de la verdad', 'Cristal', 8, 'Lámpara mágica que ilumina todo lo oculto y revela la verdad'),
('Guantelete del Infinito', 'Uru', 9, 'Guantelete mágico que otorga a su usuario el poder de controlar el universo entero'),
('Anillo de Green Lantern', 'Energía verde', 3, 'Anillo que otorga al usuario la capacidad de crear objetos con su mente y manipular la energía verde'),
('Cinturón de utilidades', 'Kevlar', 10, 'Cinturón con múltiples compartimentos que contienen herramientas y dispositivos útiles para Batman'),
('Gafas de Cyclops', 'Cuarzo rubí', 11, 'Gafas especiales que permiten a Cyclops controlar sus rayos de energía'),
('Máscara de Spider-Man', 'Tela', 12, 'Máscara que cubre la cara de Spider-Man y le ayuda a mantener su identidad secreta'),
('Armadura de Iron Man', 'Aceros avanzados', 13, 'Armadura tecnológicamente avanzada que otorga a su usuario una amplia variedad de habilidades y armas'),
('Escoba voladora', 'Madera de fresno', 14, 'Escoba mágica utilizada por los magos para volar'),
('Espada de Excalibur', 'Acero', 15, 'Poderosa espada mágica que solo puede ser empuñada por el verdadero rey de Inglaterra'),
('Escudo del Escuadrón Suicida', 'Adamantium', 2, 'Escudo utilizado por los miembros del Escuadrón Suicida como herramienta de defensa y ataque'),
('Cetro de Loki', 'Oro', 16, 'Poderoso cetro mágico utilizado por el dios de la travesura Loki'),
('Llave espada', 'Metal', 17, 'Arma mágica utilizada por los portadores de la llave espada para luchar contra las fuerzas de la oscuridad');

INSERT INTO persObjeto (personaje_id, objeto_id)
VALUES 
(1, 1),
(83, 2),
(181, 3),
(85, 4),
(9, 5),
(52, 6),
(52, 7),
(52, 8),
(52, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(7, 14),
(8, 15),
(9, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20);

INSERT INTO persPoder (personaje_id, poder_id, obtencionPoder, personajeHerencia)
VALUES 
(1, 1, 'Natural', NULL),
(1, 2, 'Artificial', NULL),
(1, 3, 'Natural', NULL),
(2, 4, 'Natural', NULL),
(2, 5, 'Natural', NULL),
(2, 6, 'Artificial', NULL),
(3, 7, 'Natural', NULL),
(3, 8, 'Artificial', NULL),
(4, 9, 'Natural', 3),
(4, 10, 'Artificial', 3),
(5, 11, 'Artificial', NULL),
(5, 12, 'Artificial', NULL),
(6, 13, 'Natural', NULL),
(7, 14, 'Natural', NULL),
(8, 15, 'Natural', NULL),
(9, 16, 'Artificial', NULL),
(10, 17, 'Natural', NULL),
(10, 18, 'Natural', NULL),
(10, 19, 'Artificial', NULL),
(10, 20, 'Natural', NULL);


INSERT INTO medio (medTitulo, medFechEstreno, companniaCreadProdID, medSinopsis, medPelicula, medSerie, medVideojuego, medComic)
VALUES 
('Avengers: Endgame', '2019-04-26', 1, 'Los Vengadores se reúnen para enfrentar al villano Thanos y restaurar el universo', 1, NULL, NULL, 2),
('The Dark Knight', '2008-07-18', 2, 'Batman enfrenta al Joker, quien amenaza con destruir Gotham City', 1, NULL, NULL, 3),
('The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 3, 'Un grupo de aventureros se unen para destruir un anillo mágico y salvar la Tierra Media', 1, NULL, NULL, 4),
('Game of Thrones', '2011-04-17', 4, 'Varias familias nobles luchan por el control del Trono de Hierro en un mundo de fantasía medieval', NULL, 1, NULL, 5),
('The Witcher 3: Wild Hunt', '2015-05-19', 5, 'El cazador de monstruos Geralt de Rivia se embarca en una aventura épica en un mundo de fantasía', NULL, NULL, 1, NULL),
('Spider-Man: No Way Home', '2021-12-17', 6, 'Peter Parker se une a otros Spider-Man para enfrentar una amenaza multiversal', 1, NULL, NULL, 6),
('Watchmen', '2009-03-06', 7, 'Un grupo de vigilantes enmascarados investiga un complot para matar a superhéroes', 1, NULL, NULL, 7),
('The Legend of Zelda: Ocarina of Time', '1998-11-23', 8, 'El joven héroe Link viaja en el tiempo para salvar el reino de Hyrule', NULL, NULL, 2, NULL),
('Iron Man', '2008-05-02', 9, 'El empresario Tony Stark construye una armadura para combatir el mal', 1, NULL, NULL, 8),
('Breaking Bad', '2008-01-20', 10, 'Un profesor de química se convierte en un fabricante y distribuidor de metanfetamina', NULL, 1, NULL, 9),
('The Last of Us Part II', '2020-06-19', 11, 'La superviviente Ellie busca venganza en un mundo postapocalíptico lleno de peligros', NULL, NULL, 3, NULL),
('Captain America: The Winter Soldier', '2014-04-04', 12, 'El Capitán América lucha contra un enemigo misterioso y poderoso', 1, NULL, NULL, 10),
('Batman: The Long Halloween', '2021-06-22', 13, 'Batman investiga una serie de asesinatos relacionados con festividades', NULL, NULL, NULL, 11),
('Stranger Things', '2016-07-15', 14, 'Un grupo de amigos investiga la desaparición de uno de ellos en un pueblo lleno de misterios', NULL, 1, NULL, 12),
('The Matrix', '1999-03-31', 15, 'Un hacker descubre la verdad sobre la realidad y se une a una rebelión contra las máquinas', 1, NULL, NULL, 13),
('The Walking Dead', '2010-10-31', 16, 'Un grupo de sobrevivientes lucha por su vida en un mundo infestado de zombies', NULL, 1, NULL, 14),
('Final Fantasy VII', '1997-01-31', 17, 'El ex-soldado Cloud y un grupo de rebeldes se enfrentan a un poderoso conglomerado', NULL, NULL, 4, NULL),
('Stranger Things 2', '2017-10-27', 14, 'Los amigos enfrentan una nueva amenaza sobrenatural en el pueblo de Hawkins', NULL, 1, NULL, 15),
('The Witcher', '2019-12-20', 5, 'El cazador de monstruos Geralt de Rivia va en busca de su destino en un mundo de fantasía', 1, NULL, NULL, 16),
('The Mandalorian', '2019-11-12', 18, 'Un cazarrecompensas protege a un misterioso infante en una galaxia muy lejana', NULL, 1, NULL, 17);

INSERT INTO perMed (med_id, perMedTipo, actorCI, perMedTipoInterpret)
VALUES 
(1, 'Protagonista', 1, 'Interprete'),
(1, 'Enemiga', 2, 'Interprete'),
(1, 'Secundaria', 3, 'Interprete'),
(2, 'Protagonista', 4, 'Interprete'),
(2, 'Enemiga', 5, 'Interprete'),
(2, 'Secundaria', 6, 'Interprete'),
(3, 'Protagonista', 7, 'Interprete'),
(3, 'Secundaria', 8, 'Interprete'),
(4, 'Protagonista', 9, 'Interprete'),
(4, 'Enemiga', 10, 'Interprete'),
(5, 'Protagonista', 11, 'Interprete'),
(6, 'Protagonista', 12, 'Interprete'),
(6, 'Enemiga', 13, 'Interprete'),
(7, 'Protagonista', 14, 'Interprete'),
(7, 'Secundaria', 15, 'Interprete'),
(8, 'Protagonista', 16, 'Interprete'),
(8, 'Enemiga', 17, 'Interprete'),
(9, 'Protagonista', 18, 'Interprete'),
(10, 'Protagonista', 19, 'Interprete'),
(10, 'Enemiga', 20, 'Interprete');

INSERT INTO orgMed (org_id, med_id, fecha, orgMedTipo, orgMedEdoFinal)
VALUES 
(1, 1, '2022-01-01', 'Protagonista', 'Protagonista'),
(1, 1, '2022-01-01', 'Enemiga', 'Secundaria'),
(1, 1, '2022-01-01', 'Secundaria', 'Secundaria'),
(1, 2, '2022-03-15', 'Protagonista', 'Protagonista'),
(1, 2, '2022-03-15', 'Enemiga', 'Enemiga'),
(1, 2, '2022-03-15', 'Secundaria', 'Protagonista'),
(2, 3, '2022-02-01', 'Protagonista', 'Protagonista'),
(2, 3, '2022-02-01', 'Secundaria', 'Secundaria'),
(2, 4, '2022-04-20', 'Protagonista', 'Protagonista'),
(2, 4, '2022-04-20', 'Enemiga', 'Protagonista'),
(3, 5, '2022-05-10', 'Protagonista', 'Protagonista'),
(3, 6, '2022-06-01', 'Protagonista', 'Protagonista'),
(3, 6, '2022-06-01', 'Enemiga', 'Enemiga'),
(4, 7, '2022-07-15', 'Protagonista', 'Protagonista'),
(4, 7, '2022-07-15', 'Secundaria', 'Secundaria'),
(5, 8, '2022-08-20', 'Protagonista', 'Protagonista'),
(5, 8, '2022-08-20', 'Enemiga', 'Enemiga'),
(6, 9, '2022-09-01', 'Protagonista', 'Protagonista'),
(6, 10, '2022-10-10', 'Protagonista', 'Protagonista'),
(6, 10, '2022-10-10', 'Enemiga', 'Enemiga');

INSERT INTO cargo (cargoNombre) VALUES 
('Gerente general'),
('Gerente de ventas'),
('Gerente de marketing'),
('Gerente de recursos humanos'),
('Gerente de finanzas'),
('Director de ventas'),
('Director de marketing'),
('Director de recursos humanos'),
('Director financiero'),
('Supervisor de ventas'),
('Supervisor de marketing'),
('Supervisor de recursos humanos'),
('Analista de ventas'),
('Analista de marketing'),
('Analista de recursos humanos'),
('Contador'),
('Asistente de ventas'),
('Asistente de marketing'),
('Asistente de recursos humanos'),
('Auxiliar administrativo');

INSERT INTO perCargOrg (personaje_id, cargo_id, org_id) VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4),
(9, 9, 5),
(10, 10, 5);

INSERT INTO usuario (usuEmail, usuNombre1, usuNombre2, usuApell1, usuApell2, usuFechNac, usuPassword, usuUsername, usuPais, usuCiudad) VALUES 
('user1@example.com', 'John', '', 'Doe', '', '1990-01-01', 'password1', 'johndoe', 1, 1),
('user2@example.com', 'Jane', '', 'Doe', '', '1995-02-15', 'password2', 'janedoe', 1, 2),
('user3@example.com', 'Bob', '', 'Smith', '', '1985-05-10', 'password3', 'bobsmith', 2, 3),
('user4@example.com', 'Alice', '', 'Johnson', '', '1998-03-20', 'password4', 'alicejohnson', 3, 4),
('user5@example.com', 'David', '', 'Lee', '', '1979-07-01', 'password5', 'davidlee', 4, 5),
('user6@example.com', 'Emily', '', 'Wang', '', '1992-11-30', 'password6', 'emilywang', 5, 6),
('user7@example.com', 'Michael', '', 'Davis', '', '1982-09-05', 'password7', 'michaeldavis', 6, 7),
('user8@example.com', 'Megan', '', 'Taylor', '', '1994-12-25', 'password8', 'megantaylor', 7, 8),
('user9@example.com', 'Eric', '', 'Garcia', '', '1987-04-18', 'password9', 'ericgarcia', 8, 9),
('user10@example.com', 'Karen', '', 'Brown', '', '1991-06-15', 'password10', 'karenbrown', 9, 10);

INSERT INTO `lugar` (`lugarNombre`, `lugarFicticio`, `lugarTipo`, `lugar_id`)
VALUES
('name1', 1, 'type1', 1),
('name2', 0, 'type2', 2),
('name3', 1, 'type3', 3),
('name4', 0, 'type4', 4),
('name5', 1, 'type5', 5),
('name6', 0, 'type6', 6),
('name7', 1, 'type7', 7),
('name8', 0, 'type8', 8),
('name9', 1, 'type9', 9),
('name10', 0, 'type10', 10),
('name11', 1, 'type11', 11),
('name12', 0, 'type12', 12),
('name13', 1, 'type13', 13),
('name14', 0, 'type14', 14),
('name15', 1, 'type15', 15),
('name16', 0, 'type16', 16),
('name17', 1, 'type17', 17),
('name18', 0, 'type18', 18),
('name19', 1, 'type19', 19),
('name20', 0, 'type20', 20);

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