CREATE TABLE `poder` (
  `poderID` int auto_increment,
  `poderNombre` varchar(60),
  `poderDescripcion`  varchar(60),
  PRIMARY KEY (`poderID`)
);



-- CREATE TABLE `usuGal` (
--   `fk_galID` int,
--   `usuEmail` varchar(60),
--   `cuentaGratFechaRegistro` date,
--   `modoLectura` varchar(20),
--   CONSTRAINT  fk_galID FOREIGN KEY (`fk_galID`) REFERENCES `galeria`(`galID`),
-- 	PRIMARY KEY(`cuentaGratFechaRegistro`),
-- 	CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura`	IN('Oscuro' , 'lectura' , 'Solar'))
-- );










-- CREATE TABLE `medPelPerdida` (
--   `medPel_id` int,
--   `numero` int,
--   constraint fk_medpelicula FOREIGN KEY (`medPel_id`) REFERENCES `medPelicula`(`medPelID`),
-- 	PRIMARY KEY(`medPelID`),
-- 	PRIMARY KEY(`numero`)
-- );


-- CREATE TABLE `Ganancia` (
--   `gananciaNumero` int,
--   PRIMARY KEY (`gananciaNumero`)
-- );

-- CREATE TABLE `perdida` (
--   `numero` int,
--   `fecha` varchar(60),
--   PRIMARY KEY (`numero`, `fecha`)
-- );
