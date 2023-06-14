CREATE TABLE `poder` (
  `poderID` int auto_increment,
  `poderNombre` varchar(60),
  `poderDescripcion`  varchar(60),
  PRIMARY KEY (`poderID`)
);

CREATE TABLE `tipoObjeto` (
  `tipoObjetoID` int auto_increment ,
  `tipoObjetoNombre` varchar(60),
  PRIMARY KEY (`tipoObjetoID`)
);

CREATE TABLE `personaje` (
  `personajeID` int auto_increment,
  `perNombre1` varchar(60),
  `perNombre2` varchar(60),
  `perApellido1` varchar(60),
  `perApellido2` varchar(60),
  `perGenero` varchar(20),
  `perColorPelo` varchar(60),
  `perColorOjos` varchar(60),
  `perEdoMarital` varchar(20),
  `perPrimeraAparicionComic` int,
  `perFraseMasCelebre` varchar(60),
  `personajeHeroe` int,
  `personajeVillano` int,
  `personajeCivil` int,
  PRIMARY KEY (`personajeID`),
  CONSTRAINT CHK_GEN_PERS CHECK (`perGenero` IN( 'M','F' 'DESC', 'OTRO')),
  CONSTRAINT CHK_MAR_PERS CHECK (`perGenero` IN('Soltero' , 'Soltera' , 'Casado',
  'Casada', 'Viudo' , 'Viuda' ,'Separado' , 'Separada' , 'Divorciado' , 'Divorciada'))
);

CREATE TABLE `usuGal` (
  `fk_galID` int,
  `usuEmail` varchar(60),
  `cuentaGratFechaRegistro` date,
  `modoLectura` varchar(20),
  CONSTRAINT  fk_galID FOREIGN KEY (`fk_galID`) REFERENCES `galeria`(`galID`),
	PRIMARY KEY(`cuentaGratFechaRegistro`),
	CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura`	IN('Oscuro' , 'lectura' , 'Solar'))
);



CREATE TABLE `persVillano` (
  `persVillanoID` int auto_increment,
  `persVillanoNombre` varchar(60),
  `persVillanoObjetivo` varchar(60),
	`id_personaje`int not null
  PRIMARY KEY (`persVillanoID`),
  constraint  fk_personaje FOREIGN KEY (`id_personaje`) REFERENCES `personaje`(`personajeID`)
);

CREATE TABLE `persHeroe` (
  `persHeroeID` int auto_increment,
  `superHeroeNombre` varchar(60),
  `superHeroeLogoTipo` tinyblob,
  `superHeroeNombreArchienemigo` int,
  PRIMARY KEY (`persHeroeID`)
);

CREATE TABLE `usuario` (
  `usuEmail` varchar(60),
  `usuNombre1` varchar(60),
  `usuNombre2` varchar(60),
  `usuApell1` varchar(60),
  `usuApell2` varchar(60),
  `usuFechNac` date,
  `usuPassword` varchar(60),
  `usuUsername` varchar(60),
  `usuPais` int,
  `usuCiudad` int,
  PRIMARY KEY (`usuEmail`)
);

CREATE TABLE `tarjeta` (
  `tarjNum` int auto_increment,
  `tarjFechVencim` date,
  `tarjUltDigitConf` int,
  PRIMARY KEY (`tarjNum`)
);

CREATE TABLE `usuTarj` (
  `usuEmail_id` varchar(60),
  `tarjNum_id ` int,
  `tarjUltDigitConf` int,
  CONSTRAINT fk_Usuario FOREIGN KEY ( `usuEmail_id`) REFERENCES `usuario`(`usuEmail`),
  CONSTRAINT fk_tarjeta FOREIGN KEY (`tarjNum_id `) REFERENCES `tarjeta`(`tarjNum`)
);






CREATE TABLE `medPelPerdida` (
  `medPel_id` int,
  `numero` int,
  constraint fk_medpelicula FOREIGN KEY (`medPel_id`) REFERENCES `medPelicula`(`medPelID`),
	PRIMARY KEY(`medPelID`),
	PRIMARY KEY(`numero`)
);

CREATE TABLE `nacionalidad` (
  `nacionalidadID` int auto_increment,
  `nacionalidadNombre` varchar(60),
  `nacionalidadLugar` int,
  PRIMARY KEY (`nacionalidadID`)
);

CREATE TABLE `persObjeto` (
  `personaje_id` int,
  `objeto_id` int,
  constraint fk_objeto FOREIGN KEY (`objeto_id`) REFERENCES `objeto`(`objetoID`),
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
);

CREATE TABLE `rating ` (
  `med_id` int,
  `usuEmail` varchar(60),
  `perfil_id` int,
  `ratingResenna` varchar(60),
  `ratingPuntaje` INT,
  constraint fk_perdil FOREIGN KEY (`perfil_id`) REFERENCES `perfil`(`usuEmail`),
  constraint fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`),
  CONSTRAINT CHK_RATING_PUNTAJE CHECK( `ratingPuntaje` BETWEEN 1 AND 5)
);

CREATE TABLE `Ganancia` (
  `gananciaNumero` int,
  PRIMARY KEY (`gananciaNumero`)
);

CREATE TABLE `perdida` (
  `numero` int,
  `fecha` varchar(60),
  PRIMARY KEY (`numero`, `fecha`)
);

CREATE TABLE `persPoder` (
  `personaje_id` int,
  `poder_id` int,
  `obtencionPoder` varchar(20),
  `personajeHerencia` int,
  constraint fk_poder FOREIGN KEY (`poder_id`) REFERENCES `poder`(`poderID`),
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  KEY `PK FK` (`personajeID`, `poderID`),
  PRIMARY KEY(`personajeID`),
  PRIMARY KEY(  `poderID`),
  CONSTRAINT CHK_OBTENCION_PODER CHECK( `obtencionPoder`IN('Natural' , 'Artificial'))
);

CREATE TABLE `plataforma` (
  `platfID` int auto_increment,
  `platfNombre` varchar(60),
  PRIMARY KEY (`platfID`)
);


CREATE TABLE `usuDisp` (
  `usuEmail_id` varchar(60),
  `disp_id` int,
  `fechInic` timestamp,
  `fechFin` timestamp,
  PRIMARY KEY (`fechInic`),
  constraint fk_dispositivo FOREIGN KEY (`disp_id`) REFERENCES `dispositivo`(`dispID`),
  constraint fk_usuario FOREIGN KEY (`usuEmail_id`) REFERENCES `usuario`(`usuEmail`),
  
  
);

CREATE TABLE `sede` (
  `org_id` int,
  `sedeID` int,
  `sedeNombre` varchar(60),
  `sedeTipoEdificacion` varchar(20),
  `sedeUbicacion` int,
  PRIMARY KEY (`sedeID`),
  constraint fk_organizacion FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
   CONSTRAINT CHK_SEDE_TIPO_EDIFICIO CHECK( `sedeTipoEdificacion`IN('Mansion' ,'Torre' , 'Cueva' , 'Casa' , 'Apartamento'))
);

CREATE TABLE `persOcupacion` (
  `personaje_id` int,
  `ocupacion_id` int,
  constraint fk_ocupacion FOREIGN KEY (`ocupacion_id`) REFERENCES `ocupacion`(`ocupacionID`),
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  
  
);

CREATE TABLE `trajeColor` (
  `persHeroe_id` int,
  `colorHEX_id` varchar(60),
  `detalleTrajeColor` varchar(60),
   constraint fk_persHeroe FOREIGN KEY (`persHeroe_id`) REFERENCES `persHeroe`(`persHeroeID`),
  constraint fk_color FOREIGN KEY (`colorHEX_id`) REFERENCES `color`(`colorHEX`),
  
  
);

  

CREATE TABLE `recomendacion` (
  `med_id` int,
  `perfil_id` int,
  `usuEmail_id` varchar(60),
  constraint fk_perfil FOREIGN KEY (`perfil_id`) REFERENCES `perfil`(`perfilID`),
  constraint fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`),
  constraint fk_perfil FOREIGN KEY (`usuEmail_id`) REFERENCES `perfil`(`usuEmail`),
   PRIMARY KEY (`medID`),
   PRIMARY KEY (`perfilID`),
   PRIMARY KEY (`usuEmail`)
  
);

