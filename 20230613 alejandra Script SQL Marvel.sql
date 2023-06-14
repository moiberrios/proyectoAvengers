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

CREATE TABLE `persCreador` (
  `personajeID_fk` int,
  `creadorID_fk` int,
  FOREIGN KEY (`creadorID_fk`) REFERENCES `creador`(`creadorID`),
  FOREIGN KEY (`personajeID_fk`) REFERENCES `personaje`(`personajeID`)
 
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

CREATE TABLE `persCivil` (
  `persCivilD` int auto_increment,
  `persCivilNombre` varchar(60),
	 `id_personaje` int not null,
  PRIMARY KEY (`persCivilD`),
  constraint  fk_personaje FOREIGN KEY (`id_personaje`) REFERENCES `personaje`(`personajeID`)
);

CREATE TABLE `persHeroe` (
  `persHeroeID` int auto_increment,
  `superHeroeNombre` varchar(60),
  `superHeroeLogoTipo` tinyblob,
  `superHeroeNombreArchienemigo` int,
  PRIMARY KEY (`persHeroeID`)
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
  `usuEmail_id` varchar(60),
  `perfilID` int auto_increment,
  `perfilNombre` varchar(60),
  `perfilIdiomaPref` varchar(60),
  `perfilEmail` varchar(60),
  PRIMARY KEY (`perfilID`),
  CONSTRAINT fK_usuario FOREIGN KEY (`usuEmail_id`) REFERENCES `usuario`(`usuEmail`),
	
);

CREATE TABLE `miLista` (
  `usuEmail_id` varchar(60),
  `perfil_id` int,
  `med_id` int,
  constraint fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`),
  constraint fk_perfil FOREIGN KEY (`perfil_id`) REFERENCES `perfil`(`perfilID`),
  constraint fk_perfil_usuemail FOREIGN KEY (`usuEmail_id`) REFERENCES `perfil`(`usuEmail`),
  KEY `PK FK` (`usuEmail`, `perfilID`, `medID`),
	PRIMARY KEY(`usuEmail`),
  PRIMARY KEY(`perfilID`),
	 PRIMARY KEY(`medID`)
	
	
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
	CONSTRAINT CHK_MED_PEL_TIPO CHECK(`medPelTipo`IN('Animada' , 'Liveaction' , ' Caricatura'))
);

CREATE TABLE `medPelPerdida` (
  `medPel_id` int,
  `numero` int,
  constraint fk_medpelicula FOREIGN KEY (`medPel_id`) REFERENCES `medPelicula`(`medPelID`),
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
  constraint fk_personaje FOREIGN KEY (`orgLiderMasConocido`) REFERENCES `personaje`(`personajeID`),
	CONSTRAINT CHK_ORG_TIPO_ORG CHECK( `orgTipoOrg`IN( 'Protagonista' , 'Antogonistan' , 'Secundaria'))
);

CREATE TABLE `orgMed` (
  `org_id` int,
  `med_id` int,
  `fecha` date,
  `orgMedTipo` varchar(20),
  `orgMedEdoFinal` varchar(20),
  PRIMARY KEY (`fecha`),
  constraint fk_organizacion FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
  constraint fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`),
  CONSTRAINT CHK_ORG_MED_TIPO CHECK(`orgMedTipo`IN('Protagonista' , 'Enemiga' , 'Secundaria')),
  CONSTRAINT CHK_ORG_MED_FINAL CHECK(`orgMedEdoFinal`IN('Protagonista' , 'Enemiga' , 'Secundaria'))
    
);


CREATE TABLE `nacionalidad` (
  `nacionalidadID` int auto_increment,
  `nacionalidadNombre` varchar(60),
  `nacionalidadLugar` int,
  PRIMARY KEY (`nacionalidadID`)
);

CREATE TABLE `persNacion` (
  `personaje_id` int,
  `nacionalidad_id` int,
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  constraint fk_nacionalidad FOREIGN KEY (`nacionalidad_id`) REFERENCES `nacionalidad`(`nacionalidadID`)
  
);


CREATE TABLE `persObjeto` (
  `personaje_id` int,
  `objeto_id` int,
  constraint fk_objeto FOREIGN KEY (`objeto_id`) REFERENCES `objeto`(`objetoID`),
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
);

CREATE TABLE `ocupacion` (
  `ocupacionID` int auto_increment,
  `ocupacionNombre` varchar(60),
  PRIMARY KEY (`ocupacionID`)
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

CREATE TABLE `medVideojuego` (
  `medVidjID` int auto_increment,
  `medVidjTipJuego` varchar(20),
  `medVidjCompPubl` int,
  PRIMARY KEY (`medVidjID`),
  CONSTRAINT CHK_MED_VIDJ_TIP_JUEGO CHECK(`medVidjTipJuego`IN( 'Accion' , 'Aventura' , 'Arcade' ,'Estrategia' , 'Simulacion' , 'Musical'))
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
  `med_id` int,
  `lugar_id` int,
  constraint fk_lugar FOREIGN KEY (`lugar_id`) REFERENCES `lugar`(`lugarID`),
  constraint fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`),
 
  
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

CREATE TABLE `medVidPlatf` (
  `medVid_id` int,
  `platf_id` int,
  constraint fk_medVidjID FOREIGN KEY (`medVid_id`) REFERENCES `medVideojuego`(`medVidjID`),
  constraint fk_plataforma FOREIGN KEY (`platf_id`) REFERENCES `plataforma`(`platfID`)
  
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

CREATE TABLE `perCargOrg` (
  `personaje_id` int,
  `cargo_id` int,
  `org_id` int,
  constraint fk_organizacion FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
  constraint fk_personaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  constraint fk_cargo FOREIGN KEY (`cargo_id`) REFERENCES `cargo`(`cargoID`),
  
  
);

CREATE TABLE `perMed` (
  `med_id` int,
  `perMedTipo` varchar(20),
  `actorCI` int,
  `perMedTipoInterpret` varchar(20),
  constraint fk_Personaje FOREIGN KEY (`med_id`) REFERENCES `personaje`(`personajeID`),
  constraint fk_medio FOREIGN KEY ( `med_id`) REFERENCES `medio`(`medID`),
   CONSTRAINT CHK_PER_MED_TIPO CHECK(  `perMedTipo`IN('Protagonista' , 'Enemiga' , 'Secundaria')),
   CONSTRAINT CHK_PER_MED_TIPO_INTERPRET CHECK(  `perMedTipoInterpret`IN('Interprete' , 'Voz'))
   
);
