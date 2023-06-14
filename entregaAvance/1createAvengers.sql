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
  `cargoMontFinMes` date,
  `cuentaID` int,
  `cargoMontSuscr` numeric(10,2),
	PRIMARY KEY(`usuEmail`,`numTarjt`,`cuentaID`,`cargoMontFinMes`)
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
  PRIMARY KEY(`medComicID`,`galID`)
);

CREATE TABLE `combate` (
  `combateID` int auto_increment,
  `objetoID_fk` int,
  `poderID_fk` int,
  `combateLugar` int NOT NULL,
  `combateFecha` date,
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
  `cuentGratFechaRegistro` date,
  `CuentaGratuitaCaducada` boolean,
   PRIMARY KEY (`id_usuEmail`,`cuentGratFechaRegistro`)
);