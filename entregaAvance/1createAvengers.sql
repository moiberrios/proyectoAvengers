CREATE DATABASE IF NOT EXISTS avengers;
CREATE SCHEMA IF NOT EXISTS avengers ;
USE avengers;

CREATE TABLE `actor` (
  `actorCI` int auto_increment,
  `actorNombre1` varchar(60) NOT NULL,
  `actorNombre2` varchar(60),
  `actorApell1` varchar(60) NOT NULL,
  `actorApell2` varchar(60),
  PRIMARY KEY (`actorCI`)
);

CREATE TABLE `beneficio` (
  `benID` int auto_increment,
  `benNombre` varchar(60) NOT NULL,
  PRIMARY KEY (`benID`)
);

CREATE TABLE `cargoMontoSuscripcion` (
  `usuEmail` varchar(60),
  `numTarjt` int,
  `cuentaID` int,
  `cargoMontFinMes` date,
  `cargoMontSuscr` numeric(10,2),
	PRIMARY KEY(`usuEmail`,`numTarjt`,`cuentaID`)
);

CREATE TABLE `cargo` (
  `cargoID` int auto_increment,
  `cargoNombre` varchar(60) NOT NULL,
  PRIMARY KEY (`cargoID`)
);

CREATE TABLE `color` (
  `colorHEX` varchar(60),
  `colorNombre` varchar(60) NOT NULL,
  `colorDescripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`colorHEX`)
);

CREATE TABLE `comGal` (
  `medComicID` int,
  `galID` int,
  `marcadoComic` boolean default 0, 
  PRIMARY KEY(`medComicID`,`galID`)
);

CREATE TABLE `combate` (
  `combateID` int auto_increment,
  `objetoID_fk` int,
  `poderID_fk` int,
  `combateLugar` int NOT NULL,
  `combateFecha` date NOT NULL,
  `combateDescrp` varchar(60),
  PRIMARY KEY (`combateID`, `objetoID_fk`, `poderID_fk`)
);

CREATE TABLE `compannia` (
  `companniaID` int auto_increment,
  `companniaNombre` varchar(60) NOT NULL,
  `companniaDescrp` varchar(60),
  PRIMARY KEY (`companniaID`)
);

CREATE TABLE `creador` (
  `creadorID` int auto_increment,
  `creadorNombre` varchar(60) NOT NULL,
  PRIMARY KEY (`creadorID`)
);

CREATE TABLE `cuentaGratis` (
  `id_usuEmail` varchar(60),
  `galeriaGratuita` int, 
  `cuentGratFechaRegistro` date,
  `CuentaGratuitaCaducada` boolean default 0,
   PRIMARY KEY (`id_usuEmail`)
);

CREATE TABLE `cuentaMed` (
  `cuentaID` int,
  `medID` int,
  `modoOffline` boolean default 0,
	PRIMARY KEY(`cuentaID`)
);

CREATE TABLE `cuenta` (
  `cuentaID` int auto_increment,
  `cuentaTipo` VARCHAR(20),
  `cuentaDescripcMembresia` varchar(60),
  `cuentaTarifa` numeric(10,2),
  PRIMARY KEY (`cuentaID`)
);

CREATE TABLE `descuento` (
  `ben_id` int,
  `cuenta_id` int,
  `descFechaVenc` date,
  `descPorc` int not null
);

CREATE TABLE `director` (
  `directorCI` int auto_increment,
  `directorNombre` varchar(60),
  PRIMARY KEY (`directorCI`)
);

CREATE TABLE `dispositivo` (
  `dispID` int auto_increment,
  `dispNombre` varchar(60),
  `dispTipo` varchar(20),
  PRIMARY KEY (`dispID`)
);

CREATE TABLE `galeria` (
  `galID` int auto_increment,
  `galNombre` varchar(60),
  `modoLectura` varchar(60) default 'Solar',
  PRIMARY KEY (`galID`)
);

CREATE TABLE `heroeVillanoCivil` (
  `heroeVillanoCivID` int auto_increment,
  `persHeroeID_fk` int,
  `persCivilID_fk` int,
  `persVillanoID_fk` int,
  PRIMARY KEY (`heroeVillanoCivID`)
);

CREATE TABLE `heroeVillanoEnfrentados` (
 `persHeroeID` int,
  `persVillanoID` int,
  PRIMARY KEY (`persHeroeID`,`persVillanoID`)
);

CREATE TABLE `historial` (
  `medID` int,
  `perfilID` int,
  `usuEmail` varchar(60),
  PRIMARY KEY (`medID`,`perfilID`,`usuEmail`)
);

CREATE TABLE `lugar` (
  `lugarID` int auto_increment,
  `lugarNombre` varchar(60),
  `lugarFicticio` boolean default 1,
  `lugarTipo` VARCHAR(20),
  `lugar_id` int,
  PRIMARY KEY (`lugarID`)
);

CREATE TABLE `medComic` (
  `medComID` int auto_increment,
  `medComNroTomo` int,
  PRIMARY KEY (`medComID`)
);

CREATE TABLE `medPais` (
  `med_id` int,
  `lugar_id` int,
  primary key (`med_id`, `lugar_id`)
);

-- CREATE TABLE `medPelGananc` (
--   `medPelID` int,
--   `gananciaNumero` int,
--   Primary key(`medPelID`),
--   Primary key(`gananciaNumero`)
-- );

CREATE TABLE `medPelicula` (
  `medPelID` int auto_increment,
  `medPelDirectorCI` int,
  `medPelDuracion` time,
  `medPelTipo` VARCHAR(20),
  `medPelCostProd` numeric(10,2),
  `medPelGananc` numeric(10,2),
  `medPelDistrib` int,
  PRIMARY KEY (`medPelID`),
	CONSTRAINT CHK_MED_PEL_TIPO CHECK(`medPelTipo`IN('Animada' , 'Liveaction' , ' Caricatura'))
);

CREATE TABLE `medSerie` (
  `medSerID` int auto_increment,
  `medSerCreador` int,
  `medSerTotEps` int,
  `medSerCanalTrans` varchar(60),
  `medSerTipo` VARCHAR(20),
  PRIMARY KEY (`medSerID`),
	CONSTRAINT CHK_MED_SER_TIPO CHECK( `medSerTipo`IN( 'Animado' , 'Liveaction' ,'Caricatura'))
);

CREATE TABLE `medVidPlatf` (
  `medVid_id` int,
  `medVidTipJuego` varchar(60),
  `platf_id` int
);

CREATE TABLE `medVideojuego` (
  `medVidjID` int auto_increment,
  `medVidjTipJuego` varchar(20),
  `medVidjCompPubl` int,
  PRIMARY KEY (`medVidjID`),
  CONSTRAINT CHK_MED_VIDJ_TIP_JUEGO CHECK(`medVidjTipJuego`IN( 'Accion' , 'Aventura' , 'Arcade' ,'Estrategia' , 'Simulacion' , 'Musical'))
);

CREATE TABLE `medio` (
  `medID` int auto_increment,
  `medTitulo` varchar(60),
  `medFechEstreno` date,
  `companniaCreadProdID` int,
  `medSinopsis` varchar(60),
  `medPelicula` int,
  `medSerie` int,
  `medVideojuego` int,
  `medComic` int,
  PRIMARY KEY (`medID`)
);

CREATE TABLE `miLista` (
  `usuEmail` varchar(60),
  `perfilID` int,
 `medID` int,
  PRIMARY KEY (`usuEmail`, `perfilID`, `medID`)
);

CREATE TABLE `objeto` (
  `objetoID` int auto_increment,
  `objetoNombre` varchar(60),
  `objetoMaterialFabricacion` varchar(60),
  `objetoTipoFK` int,
  `objetoDescripcion` varchar(60),
  PRIMARY KEY (`objetoID`)
);

CREATE TABLE `ocupacion` (
  `ocupacionID` int auto_increment,
  `ocupacionNombre` varchar(60),
  PRIMARY KEY (`ocupacionID`)
);

CREATE TABLE `orgMed` (
  `org_id` int,
  `med_id` int,
  `fecha` date,
  `orgMedTipo` varchar(20),
  `orgMedEdoFinal` varchar(20),
  PRIMARY KEY (`fecha`),
  CONSTRAINT CHK_ORG_MED_TIPO CHECK(`orgMedTipo`IN('Protagonista' , 'Enemiga' , 'Secundaria')),
  CONSTRAINT CHK_ORG_MED_FINAL CHECK(`orgMedEdoFinal`IN('Protagonista' , 'Enemiga' , 'Secundaria'))
);

CREATE TABLE `organizacion` (
  `orgID` int auto_increment,
  `orgNombre` varchar(60),
  `orgEslogan` varchar(60),
  `orgLiderMasConocido` int,
  `orgTipoOrg` VARCHAR(20),
  `orgObjetivoPpal` varchar(60),
  `orgLugarCreacion` int,
  `orgFundador` int,
  `orgPrimerAparComics` int,
  PRIMARY KEY (`orgID`)
);

CREATE TABLE `perCargOrg` (
  `personaje_id` int,
  `cargo_id` int,
  `org_id` int
);

CREATE TABLE `perMed` (
  `med_id` int,
  `perMedTipo` varchar(20),
  `actorCI` int,
  `perMedTipoInterpret` varchar(20),
   CONSTRAINT CHK_PER_MED_TIPO CHECK(  `perMedTipo`IN('Protagonista' , 'Enemiga' , 'Secundaria')),
   CONSTRAINT CHK_PER_MED_TIPO_INTERPRET CHECK(  `perMedTipoInterpret`IN('Interprete' , 'Voz'))
);

CREATE TABLE `perfil` (
  `usuEmail_id` varchar(60),
  `perfilID` int,
  `perfilNombre` varchar(60),
  `perfilIdiomaPref` varchar(60),
  `perfilEmail` varchar(60),
  PRIMARY KEY (`usuEmail_id`,`perfilID`)
);

CREATE TABLE `persCivil` (
  `persCivilD` int auto_increment,
  `persCivilNombre` varchar(60),
	 `id_personaje` int not null,
  PRIMARY KEY (`persCivilD`)
);

CREATE TABLE `persCreador` (
  `personajeID_fk` int,
  `creadorID_fk` int
);

CREATE TABLE `persNacion` (
  `personaje_id` int,
  `nacionalidad_id` int
);

CREATE TABLE `persObjeto` (
  `personaje_id` int,
  `objeto_id` int,
  primary key (`personaje_id`, `objeto_id`)
);

CREATE TABLE `persOcupacion` (
  `personaje_id` int,
  `ocupacion_id` int,
  primary key (`personaje_id`, `ocupacion_id`)
);

CREATE TABLE `persPoder` (
 `personajeID` int,
 `poderID` int,
  `obtencionPoder` varchar(20),
  `personajeHerencia` int,
  PRIMARY KEY(`personajeID`, `poderID`),
  CONSTRAINT CHK_OBTENCION_PODER CHECK( `obtencionPoder`IN('Natural' , 'Artificial'))
);

CREATE TABLE `persVillano` (
  `persVillanoID` int auto_increment,
  `persVillanoNombre` varchar(60),
  `persVillanoObjetivo` varchar(60),
	`id_personaje`int not null,
  PRIMARY KEY (`persVillanoID`)
);


CREATE TABLE `persHeroe` (
  `persHeroeID` int auto_increment,
  `superHeroeNombre` varchar(60),
  `superHeroeLogoTipo` BLOB,
  PRIMARY KEY (`persHeroeID`)
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
  CONSTRAINT CHK_GEN_PERS CHECK (`perGenero` IN('M','F','DESC', 'OTRO')),
  CONSTRAINT CHK_MAR_edomarital CHECK (`perEdoMarital` IN('Soltero' , 'Soltera' , 'Casado',
  'Casada', 'Viudo' , 'Viuda' ,'Separado' , 'Separada' , 'Divorciado' , 'Divorciada'))
);

CREATE TABLE `plataforma` (
  `platfID` int auto_increment,
  `platfNombre` varchar(60),
  PRIMARY KEY (`platfID`)
);

CREATE TABLE `poder` (
  `poderID` int auto_increment,
  `poderNombre` varchar(60),
  `poderDescripcion`  varchar(60),
  PRIMARY KEY (`poderID`)
);

CREATE TABLE `rating`(
  `med_id` int,
  `usuEmail` varchar(60),
  `perfil_id` int,
  `ratingResenna` varchar(60),
  `ratingPuntaje` INT,
  CONSTRAINT CHK_RATING_PUNTAJE CHECK( `ratingPuntaje` BETWEEN 1 AND 5)
);

CREATE TABLE `recomendacion` (
  `medID` int,
  `perfilID` int,
  `usuEmail` varchar(60),
   PRIMARY KEY (`medID`,`perfilID`,`usuEmail`)
);

CREATE TABLE `sede` (
  `org_id` int,
  `sedeID` int,
  `sedeNombre` varchar(60),
  `sedeTipoEdificacion` varchar(20),
  `sedeUbicacion` int,
  PRIMARY KEY (`sedeID`)
);

CREATE TABLE `tarjeta` (
  `tarjNum` int auto_increment,
  `tarjFechVencim` date,
  `tarjUltDigitConf` int,
  PRIMARY KEY (`tarjNum`)
);

CREATE TABLE `tipoObjeto` (
  `tipoObjetoID` int auto_increment ,
  `tipoObjetoNombre` varchar(60),
  PRIMARY KEY (`tipoObjetoID`)
);

CREATE TABLE `trajeColor` (
  `persHeroe_id` int,
  `colorHEX_id` varchar(60),
  `detalleTrajeColor` varchar(60)
);

CREATE TABLE `usuDisp` (
  `usuEmail_id` varchar(60),
  `disp_id` int,
  `fechInic` date,
  `fechFin` date,
  PRIMARY KEY (`fechInic`)
);

CREATE TABLE `usuTarj` (
  `usuEmail_id` varchar(60),
  `tarjNum_id` int,
PRIMARY KEY (`usuEmail_id`,`tarjNum_id`)
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

CREATE TABLE `nacionalidad` (
  `nacionalidadID` int auto_increment,
  `nacionalidadNombre` varchar(60),
  `nacionalidadLugar` int,
  PRIMARY KEY (`nacionalidadID`)
);