
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

CREATE TABLE `objeto` (
  `objetoID` int auto_increment,
  `objetoNombre` varchar(60),
  `objetoMaterialFabricacion` varchar(60),
  `objetoTipoFK` int,
  `objetoDescripcion` varchar(60),
  PRIMARY KEY (`objetoID`),
  FOREIGN KEY (`objetoTipoFK`) REFERENCES `tipoObjeto`(`tipoObjetoID`)
);

CREATE TABLE `combate` (
  `combateID` int auto_increment,
  `objetoID_fk` int,
  `poderID_fk` int,
  `combateLugar` int,
  `combateFecha` date,
  `combateDescrp` varchar(60),
  PRIMARY KEY (`combateID`),
  FOREIGN KEY (`poderID_fk`) REFERENCES `poder`(`poderID`),
  FOREIGN KEY (`objetoID_fk`) REFERENCES `objeto`(`objetoID`)
  
);

CREATE TABLE `creador` (
  `creadorID` int auto_increment,
  `creadorNombre` varchar(60),
  PRIMARY KEY (`creadorID`)
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
  CONSTRAINT CHK_GEN_PERS CHECK (`perGenero`in ('M', 'F', 'DESC', 'OTRO')),
  CONSTRAINT CHK_MAR_PERS CHECK (`perEdoMarital`in ('Soltero','Soltera','Casado','Casada','Viudo','Viuda','Divorciado','Divorciada','Separado','Separada'))
);

CREATE TABLE `persCreador` (
  `personajeID_fk` int,
  `creadorID_fk` int,
  FOREIGN KEY (`creadorID_fk`) REFERENCES `creador`(`creadorID`),
  FOREIGN KEY (`personajeID_fk`) REFERENCES `personaje`(`personajeID`)
 
);

CREATE TABLE `galeria` (
  `galID` int auto_increment,
  `galNombre` varchar(60),
  PRIMARY KEY (`galID`)
);



CREATE TABLE `cuentaGratis` (
  `fk_usuEmail` varchar(60),
  `cuentGratFechaRegistro` date,
  `CuentaGratuitaCaducada` boolean,
  FOREIGN KEY (`fk_usuEmail`) REFERENCES `usuGal`(`usuEmail`),
   PRIMARY KEY (`cuentGratFechaRegistro`)
	
);

CREATE TABLE `usuGal` (
  `galID_fk` int,
  `usuEmail` varchar(60),
  `cuentaGratFechaRegistro` date,
  `modoLectura` varchar(20),
  FOREIGN KEY (`galID_fk`) REFERENCES `galeria`(`galID`),
	PRIMARY KEY(`cuentaGratFechaRegistro`),
	CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura`='Oscuro' OR 'lectura' OR 'Solar')
);



CREATE TABLE `persVillano` (
  `persVillanoID` int auto_increment,
  `persVillanoNombre` varchar(60),
  `persVillanoObjetivo` varchar(60),
  PRIMARY KEY (`persVillanoID`),
  FOREIGN KEY (`persVillanoID`) REFERENCES `personaje`(`personajeVillano`)
);

CREATE TABLE `cargo` (
  `cargoID` int auto_increment,
  `cargoNombre` varchar(60),
  PRIMARY KEY (`cargoID`)
);

CREATE TABLE `beneficio` (
  `benID` int auto_increment,
  `benNombre` varchar(60),
  PRIMARY KEY (`benID`)
);

CREATE TABLE `director` (
  `directorCI` int auto_increment,
  `directorNombre` int,
  PRIMARY KEY (`directorCI`)
);

CREATE TABLE `persCivil` (
  `persCivilD` int auto_increment,
  `persCivilNombre` varchar(60),
  PRIMARY KEY (`persCivilD`),
  FOREIGN KEY (`persCivilD`) REFERENCES `personaje`(`personajeCivil`)
);

CREATE TABLE `persHeroe` (
  `persHeroeID` int auto_increment,
  `superHeroeNombre` varchar(60),
  `superHeroeLogoTipo` tinyblob,
  `superHeroeNombreArchienemigo` int,
  PRIMARY KEY (`persHeroeID`)
);

CREATE TABLE `heroeVillanoCivil` (
  `heroeVillanoCivID` int auto_increment,
  `persHeroeID_fk` int,
  `persCivilID_fk` int,
  `persVillanoID_fk` int,
  PRIMARY KEY (`heroeVillanoCivID`),
  FOREIGN KEY (`persHeroeID_fk`) REFERENCES `persHeroe`(`persHeroeID`),
  FOREIGN KEY (`persCivilID_fk`) REFERENCES `persVillano`(`persVillanoID`),
  FOREIGN KEY (`persVillanoID_fk`) REFERENCES `persCivil`(`persCivilD`)
);

CREATE TABLE `medSerie` (
  `medSerID` int auto_increment,
  `medSerCreador` int,
  `medSerTotEps` int,
  `medSerCanalTrans` varchar(60),
  `medSerTipo` VARCHAR(20),
  PRIMARY KEY (`medSerID`),
	CONSTRAINT CHK_MED_SER_TIPO CHECK( `medSerTipo`= 'Animado' OR 'Liveaction' OR 'Caricatura')
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
  `usuEmail_fk` varchar(60),
  `tarjNum_fk` int,
  `tarjUltDigitConf` int,
  FOREIGN KEY (`usuEmail_fk`) REFERENCES `usuario`(`usuEmail`),
  FOREIGN KEY (`tarjNum_fk`) REFERENCES `tarjeta`(`tarjNum`)
);

CREATE TABLE `cargoMontoSuscripcion` (
  `usuEmail` varchar(60),
  `numTarjt` int,
  `cargoMontFinMes` date,
  `cuentaID` int,
  `cargoMontSuscr` numeric(10,2),
  PRIMARY KEY (`cargoMontFinMes`),
  FOREIGN KEY (`numTarjt`) REFERENCES `usuTarj`(`tarjNum`),
  FOREIGN KEY (`usuEmail`) REFERENCES `usuTarj`(`usuEmail`),
	PRIMARY KEY(`usuEmail`),
	PRIMARY KEY(`numTarjt`),
	PRIMARY KEY( `cuentaID`)
);

CREATE TABLE `cargMontSuscrpGan` (
  `gananciaNumero` int,
  `usuEmail` varchar(60),
  `numTarjt` int,
  `cargoMontFinMes` int,
  `cuentaID` int,
  FOREIGN KEY (`cargoMontFinMes`) REFERENCES `cargoMontoSuscripcion`(`cargoMontFinMes`),
  FOREIGN KEY (`numTarjt`) REFERENCES `cargoMontoSuscripcion`(`numTarjt`),
  FOREIGN KEY (`cuentaID`) REFERENCES `cargoMontoSuscripcion`(`cuentaID`),
  FOREIGN KEY (`usuEmail`) REFERENCES `cargoMontoSuscripcion`(`usuEmail`),
	PRIMARY KEY(`gananciaNumero`),
	PRIMARY KEY(`usuEmail`),
	PRIMARY KEY(`numTarjt`),
	PRIMARY KEY(`cargoMontFinMes`),
	PRIMARY KEY(`cuentaID`)

);

CREATE TABLE `color` (
  `colorHEX` varchar(60),
  `colorNombre` varchar(60),
  `colorDescripcion` varchar(60),
  PRIMARY KEY (`colorHEX`)
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

CREATE TABLE `perfil` (
  `usuEmail` varchar(60),
  `perfilID` int auto_increment,
  `perfilNombre` varchar(60),
  `perfilIdiomaPref` varchar(60),
  `perfilEmail` varchar(60),
  PRIMARY KEY (`perfilID`),
  FOREIGN KEY (`usuEmail`) REFERENCES `usuario`(`usuEmail`),
  KEY `PK FK` (`usuEmail`),
	PRIMARY KEY (`usuEmail`)
	
);

CREATE TABLE `miLista` (
  `usuEmail` varchar(60),
  `perfilID` int,
  `medID` int,
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  FOREIGN KEY (`perfilID`) REFERENCES `perfil`(`perfilID`),
  FOREIGN KEY (`usuEmail`) REFERENCES `perfil`(`usuEmail`),
  KEY `PK FK` (`usuEmail`, `perfilID`, `medID`),
	PRIMARY KEY(`usuEmail`),
  PRIMARY KEY(`perfilID`),
	 PRIMARY KEY(`medID`)
	
	
);

CREATE TABLE `cuentaMed` (
  `cuentaID` int,
  `medID` int,
  `modoOffline` boolean,
  `modoLectura` VARCHAR(20),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
	PRIMARY KEY(`cuentaID`),
	PRIMARY KEY( `medID`),
	CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura`='Oscuro' OR 'lectura' OR 'Solar')
	
);

CREATE TABLE `cuenta` (
  `cuentaID` int auto_increment,
  `cuentaTipo` VARCHAR(20),
  `cuentaDescripcMembresia` varchar(60),
  `cuentaTarifa` numeric(10,2),
  `cuentaIDRecursiva` int,
  PRIMARY KEY (`cuentaID`),
  FOREIGN KEY (`cuentaID`) REFERENCES `cargoMontoSuscripcion`(`cuentaID`),
  FOREIGN KEY (`cuentaIDRecursiva`) REFERENCES `cuenta`(`cuentaID`),
  FOREIGN KEY (`cuentaID`) REFERENCES `cuentaMed`(`cuentaID`),
	CONSTRAINT CHK_CUENTA_TIPO CHECK( `cuentaTipo`in ('Gold','Premium','VIP'))
);

CREATE TABLE `medPelicula` (
  `medPelID` int auto_increment,
  `medPelDirectorCI` int,
  `medPelDuracion` time,
  `medPelTipo` VARCHAR(20),
  `medPelCostProd` numeric(10,2),
  `medPelGananc` numeric(10,2),
  `medPelDistrib` int,
  PRIMARY KEY (`medPelID`),
	CONSTRAINT CHK_MED_PEL_TIPO CHECK(`medPelTipo`='Animada' OR 'Liveaction' OR ' Caricatura')
);

CREATE TABLE `medPelPerdida` (
  `medPelID` int,
  `numero` int,
  FOREIGN KEY (`medPelID`) REFERENCES `medPelicula`(`medPelID`),
	PRIMARY KEY(`medPelID`),
	PRIMARY KEY(`numero`)
);

CREATE TABLE `organizacion` (
  `orgID` int auto_increment,
  `orgNombre` varchar(60),
  `orgEslogan` varchar(60),
  `orgLiderMasConocido` varchar(60),
  `orgTipoOrg` VARCHAR(20),
  `orgObjetivoPpal` varchar(60),
  `orgLugarCreacion` int,
  `orgFundador` int,
  `orgPrimerAparComics` int,
  PRIMARY KEY (`orgID`),
  FOREIGN KEY (`orgLiderMasConocido`) REFERENCES `personaje`(`personajeID`),
	CONSTRAINT CHK_ORG_TIPO_ORG CHECK( `orgTipoOrg`= 'Protagonista' OR 'Antogonistan' OR 'Secundaria')
);

CREATE TABLE `orgMed` (
  `orgID` int,
  `medID` int,
  `fecha` date,
  `orgMedTipo` varchar(20),
  `orgMedEdoFinal` varchar(20),
  PRIMARY KEY (`fecha`),
  FOREIGN KEY (`orgID`) REFERENCES `organizacion`(`orgID`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  PRIMARY KEY(`orgID`),
  PRIMARY KEY(`medID`),
  CONSTRAINT CHK_ORG_MED_TIPO CHECK(`orgMedTipo`='Protagonista' OR 'Enemiga' OR 'Secundaria'),
  CONSTRAINT CHK_ORG_MED_FINAL CHECK(`orgMedEdoFinal`='Protagonista' OR 'Enemiga' OR 'Secundaria')
    
);

CREATE TABLE `heroeVillanoEnfrentados` (
  `persHeroeID` int,
  `persVillanoID` int,
  FOREIGN KEY (`persHeroeID`) REFERENCES `persHeroe`(`persHeroeID`),
  FOREIGN KEY (`persVillanoID`) REFERENCES `persVillano`(`persVillanoID`),
  PRIMARY  KEY(`persHeroeID`),
  PRIMARY KEY(`persVillanoID`)
);

CREATE TABLE `nacionalidad` (
  `nacionalidadID` int auto_increment,
  `nacionalidadNombre` varchar(60),
  `nacionalidadLugar` int,
  PRIMARY KEY (`nacionalidadID`)
);

CREATE TABLE `persNacion` (
  `personajeID` int,
  `nacionalidadID` int,
  FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`),
  FOREIGN KEY (`nacionalidadID`) REFERENCES `nacionalidad`(`nacionalidadID`),
  PRIMARY KEY(`personajeID`),
  PRIMARY KEY( `nacionalidadID`)
);

CREATE TABLE `medComic` (
  `medComID` int auto_increment,
  `medComNroTomo` int,
  PRIMARY KEY (`medComID`)
);

CREATE TABLE `persObjeto` (
  `personajeID` int,
  `objetoID` int,
  FOREIGN KEY (`objetoID`) REFERENCES `objeto`(`objetoID`),
  FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`),
  KEY `PK FK` (`personajeID`, `objetoID`)
);

CREATE TABLE `descuento` (
  `benID` int,
  `cuentaID` int,
  `descFechaVenc` date,
  `descPorc` int,
  FOREIGN KEY (`benID`) REFERENCES `beneficio`(`benID`),
  FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`),
  KEY `PK FK` (`benID`, `cuentaID`)
);

CREATE TABLE `comGal` (
  `medComicID` int,
  `galID` int,
  FOREIGN KEY (`galID`) REFERENCES `medComic`(`medComID`),
  PRIMARY KEY(`medComicID`),
  PRIMARY KEY(`galID`)
);

CREATE TABLE `ocupacion` (
  `ocupacionID` int auto_increment,
  `ocupacionNombre` varchar(60),
  PRIMARY KEY (`ocupacionID`)
);

CREATE TABLE `rating ` (
  `medID` int,
  `usuEmail` varchar(60),
  `perfilID` int,
  `ratingResenna` varchar(60),
  `ratingPuntaje` INT,
  FOREIGN KEY (`perfilID`) REFERENCES `perfil`(`usuEmail`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  PRIMARY KEY(`medID`),
  PRIMARY KEY(`usuEmail`),
  PRIMARY KEY(`perfilID`),
  CONSTRAINT CHK_RATING_PUNTAJE CHECK( `ratingPuntaje` BETWEEN 1 AND 5)
);

CREATE TABLE `medVideojuego` (
  `medVidjID` int auto_increment,
  `medVidjTipJuego` varchar(20),
  `medVidjCompPubl` int,
  PRIMARY KEY (`medVidjID`),
  CONSTRAINT CHK_MED_VIDJ_TIP_JUEGO CHECK(`medVidjTipJuego`= 'Accion' OR 'Aventura' OR 'Arcade' OR 'Estrategia' OR 'Simulacion' OR 'Musical')
);

CREATE TABLE `lugar` (
  `lugarID` int auto_increment,
  `lugarNombre` varchar(60),
  `lugarFicticio` boolean,
  `lugarTipo` VARCHAR(20),
  `lugarID` int,
  PRIMARY KEY (`lugarID`),
  FOREIGN KEY (`lugarID`) REFERENCES `usuario`(`usuPais`),
  FOREIGN KEY (`lugarID`) REFERENCES `lugar`(`lugarID`),
  FOREIGN KEY (`lugarID`) REFERENCES `usuario`(`usuCiudad`),
  CONSTRAINT CHK_LUGAR CHECK( `lugarTipo`='Continente' OR 'Pais' OR 'Ciudad' OR 'Avenida' OR 'Calle' OR 'Edificio' OR 'Apartamento' OR 'Avenida')
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
  `personajeID` int,
  `poderID` int,
  `obtencionPoder` varchar(20),
  `personajeHerencia` int,
  FOREIGN KEY (`poderID`) REFERENCES `poder`(`poderID`),
  FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`),
  KEY `PK FK` (`personajeID`, `poderID`),
  PRIMARY KEY(`personajeID`),
  PRIMARY KEY(  `poderID`),
  CONSTRAINT CHK_OBTENCION_PODER CHECK( `obtencionPoder`='Natural' OR 'Artificial')
);

CREATE TABLE `actor` (
  `actorCI` int auto_increment,
  `actorNombre1` varchar(60),
  `actorNombre2` varchar(60),
  `actorApell1` varchar(60),
  `actorApell2` varchar(60),
  PRIMARY KEY (`actorCI`)
);

CREATE TABLE `medPelGananc` (
  `medPelID` int,
  `gananciaNumero` int,
  Primary key(`medPelID`),
  Primary key(`gananciaNumero`)
);

CREATE TABLE `plataforma` (
  `platfID` int auto_increment,
  `platfNombre` varchar(60),
  PRIMARY KEY (`platfID`)
);

CREATE TABLE `medPais` (
  `medID` int,
  `lugarID` int,
  FOREIGN KEY (`lugarID`) REFERENCES `lugar`(`lugarID`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  KEY `PK FK` (`medID`, `lugarID`),
  Primary key(`medID`),
  Primary key(`lugarID`)
  
);

CREATE TABLE `dispositivo` (
  `dispID` int auto_increment,
  `dispNombre` varchar(60),
  `dispTipo` varchar(20),
  PRIMARY KEY (`dispID`),
  CONSTRAINT CHK_DISP_TIPO CHECK( `dispTipo`='Telefono' OR 'Tablet' OR 'Portatil' OR 'Escritorio')
);

CREATE TABLE `usuDisp` (
  `usuEmail` varchar(60),
  `dispID` int,
  `fechInic` timestamp,
  `fechFin` timestamp,
  PRIMARY KEY (`fechInic`),
  FOREIGN KEY (`dispID`) REFERENCES `dispositivo`(`dispID`),
  FOREIGN KEY (`usuEmail`) REFERENCES `usuario`(`usuEmail`),
  KEY `PK FK` (`usuEmail`, `dispID`),
   PRIMARY KEY (`usuEmail`),
   PRIMARY KEY (`dispID`)
  
);

CREATE TABLE `sede` (
  `orgID` int,
  `sedeID` int,
  `sedeNombre` varchar(60),
  `sedeTipoEdificacion` varchar(20),
  `sedeUbicacion` int,
  PRIMARY KEY (`sedeID`),
  FOREIGN KEY (`orgID`) REFERENCES `organizacion`(`orgID`),
   PRIMARY KEY (`orgID`),
   CONSTRAINT CHK_SEDE_TIPO_EDIFICIO CHECK( `sedeTipoEdificacion`='Mansion' OR 'Torre' OR 'Cueva' OR 'Casa' OR 'Apartamento')
);

CREATE TABLE `medVidPlatf` (
  `medVidID` int,
  `platfID` int,
  FOREIGN KEY (`medVidID`) REFERENCES `medVideojuego`(`medVidjID`),
  FOREIGN KEY (`platfID`) REFERENCES `plataforma`(`platfID`),
  PRIMARY KEY (`medVidID`),
  PRIMARY KEY (`platfID`)
);

CREATE TABLE `persOcupacion` (
  `personajeID` int,
  `ocupacionID` int,
  FOREIGN KEY (`ocupacionID`) REFERENCES `ocupacion`(`ocupacionID`),
  FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`),
  KEY `PK FK` (`personajeID`, `ocupacionID`),
  PRIMARY KEY (`personajeID`),
  PRIMARY KEY (`ocupacionID`)
  
);

CREATE TABLE `trajeColor` (
  `persHeroeID` int,
  `colorHEX` varchar(60),
  `detalleTrajeColor` varchar(60),
  FOREIGN KEY (`persHeroeID`) REFERENCES `persHeroe`(`persHeroeID`),
  FOREIGN KEY (`colorHEX`) REFERENCES `color`(`colorHEX`),
  PRIMARY KEY (`personajeID`),
  PRIMARY KEY (`colorHEX`)
  
);

CREATE TABLE `historial` (
  `medID` int,
  `perfilID` int,
  `usuEmail` varchar(60),
  FOREIGN KEY (`perfilID`) REFERENCES `perfil`(`usuEmail`),
  FOREIGN KEY (`usuEmail`) REFERENCES `perfil`(`perfilID`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  KEY `PK FK` (`medID`, `perfilID`, `usuEmail`),
   PRIMARY KEY (`medID`),
   PRIMARY KEY (`perfilID`),
   PRIMARY KEY (`usuEmail`)
);

CREATE TABLE `compannia` (
  `companniaID` int auto_increment,
  `companniaNombre` varchar(60),
  `companniaDescrp` varchar(60),
  PRIMARY KEY (`companniaID`)
);

CREATE TABLE `recomendacion` (
  `medID` int,
  `perfilID` int,
  `usuEmail` varchar(60),
  FOREIGN KEY (`perfilID`) REFERENCES `perfil`(`perfilID`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  FOREIGN KEY (`usuEmail`) REFERENCES `perfil`(`usuEmail`),
   PRIMARY KEY (`medID`),
   PRIMARY KEY (`perfilID`),
   PRIMARY KEY (`usuEmail`)
  
);

CREATE TABLE `perCargOrg` (
  `personajeID` int,
  `cargoID` int,
  `orgID` int,
  FOREIGN KEY (`orgID`) REFERENCES `organizacion`(`orgID`),
  FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`),
  FOREIGN KEY (`cargoID`) REFERENCES `cargo`(`cargoID`),
  KEY `PK FK` (`personajeID`, `cargoID`, `orgID`),
   PRIMARY KEY (`personajeID`),
   PRIMARY KEY (`cargoID`),
   PRIMARY KEY (`orgID`)
  
);

CREATE TABLE `perMed` (
  `personajeID` int,
  `medID` int,
  `perMedTipo` varchar(20),
  `actorCI` int,
  `perMedTipoInterpret` varchar(20),
  FOREIGN KEY (`medID`) REFERENCES `personaje`(`personajeID`),
  FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  KEY `PK FK` (`personajeID`, `medID`),
  PRIMARY KEY (`personajeID`),
   PRIMARY KEY (`medID`),
   CONSTRAINT CHK_PER_MED_TIPO CHECK(  `perMedTipo`='Protagonista' OR 'Enemiga' OR 'Secundaria'),
   CONSTRAINT CHK_PER_MED_TIPO_INTERPRET CHECK(  `perMedTipoInterpret`='Interprete' OR 'Voz')
   
);
