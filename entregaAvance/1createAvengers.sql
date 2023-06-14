-- TODOs
-- 1. [ ] claves foraneas en scrip alter
-- 2. [ ] valores no dummy: restringir a que no sean valores nulos, o caracteres que no van
-- ir rayando la copia post-normalizacicn

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
  PRIMARY KEY (`cuentaID`),
);

CREATE TABLE `descuento` (
  `ben_id` int,
  `cuenta_id` int,
  `descFechaVenc` date,
  `descPorc` int not null,
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
  PRIMARY KEY (`dispID`),
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
  `persHeroe_id` int,
  `persVillano_id` int,
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


