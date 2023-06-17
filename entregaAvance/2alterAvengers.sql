ALTER TABLE `cargoMontoSuscripcion` 
  add CONSTRAINT fk_usuTarj FOREIGN KEY (`usuEmail`,`numTarjt`) REFERENCES `usuTarj`(`usuEmail_id`,`tarjNum_id`),
  add CONSTRAINT fk_usuCuentaID FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`)
;

ALTER TABLE `comGal` 
  add CONSTRAINT fk_medComic FOREIGN KEY (`medComicID`) REFERENCES `medComic`(`medComID`),
  add CONSTRAINT fk_galID FOREIGN KEY (`galID`) REFERENCES `galeria`(`galID`)
;

ALTER TABLE `combate` 
  add CONSTRAINT fk_objetoID FOREIGN KEY (`objetoID_fk`) REFERENCES `objeto`(`objetoID`),
  add CONSTRAINT fk_poderID FOREIGN KEY (`poderID_fk`) REFERENCES `poder`(`poderID`),
  add CONSTRAINT fk_lugarID FOREIGN KEY (`combateLugar`) REFERENCES `lugar`(`lugarID`)
;

ALTER TABLE `cuentaGratis` 
  add CONSTRAINT pk_fk_usuarioEmail FOREIGN KEY ( `id_usuEmail`) REFERENCES `usuario`(`usuEmail`),
  add CONSTRAINT fk_galeria FOREIGN KEY ( `galeriaGratuita`) REFERENCES `galeria`(`galID`)
;

ALTER TABLE `cuentaMed` 
  add CONSTRAINT fk_cuentaID FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`),
  add CONSTRAINT fk_medio FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `cuenta` 
	add CONSTRAINT CHK_CUENTA_TIPO CHECK( `cuentaTipo` IN( 'Gold' OR 'Premium' OR 'VIP'))
;


ALTER TABLE `descuento` 
  add constraint pk_fk_beneficio FOREIGN KEY (`ben_id`) REFERENCES `beneficio`(`benID`),
  add constraint pk_fk_cuenta FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta`(`cuentaID`)
;

ALTER TABLE `dispositivo` 
  add CONSTRAINT CHK_DISP_TIPO CHECK( `dispTipo` IN('Telefono' , 'Tablet' , 'Portatil' , 'Escritorio'))
;


ALTER TABLE `galeria`
	add CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura` IN('Oscuro', 'Solar'))
;


ALTER TABLE `heroeVillanoCivil` 
  add CONSTRAINT fk_persHeroe FOREIGN KEY (`persHeroeID_fk`) REFERENCES `persHeroe`(`persHeroeID`),
  add CONSTRAINT fk_persVillano FOREIGN KEY (`persCivilID_fk`) REFERENCES `persVillano`(`persVillanoID`),
  add CONSTRAINT fk_persCivil FOREIGN KEY (`persVillanoID_fk`) REFERENCES `persCivil`(`persCivilD`)
;

ALTER TABLE `heroeVillanoEnfrentados` 
  add constraint fk_pershero FOREIGN KEY (`persHeroeID`) REFERENCES `persHeroe`(`persHeroeID`),
  add constraint fk_persvillan FOREIGN KEY (`persVillanoID`) REFERENCES `persVillano`(`persVillanoID`)
;

ALTER TABLE `historial` 
  add constraint fk_medi FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
  add constraint fk_perfil FOREIGN KEY (`usuEmail`,`perfilID`) REFERENCES `perfil`(`usuEmail_id`,`perfilID`)
;


ALTER TABLE `medPais` 
  add constraint fk_lugar FOREIGN KEY (`lugar_id`) REFERENCES `lugar`(`lugarID`),
  add constraint fk_medo FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `medVidPlatf` 
  add constraint fk_medVidjID FOREIGN KEY (`medVid_id`) REFERENCES `medVideojuego`(`medVidjID`),
  add constraint fk_plataforma FOREIGN KEY (`platf_id`) REFERENCES `plataforma`(`platfID`)
;
  
ALTER TABLE `miLista` 
  add constraint fk_media FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`),
   add constraint fk_perfi FOREIGN KEY (`usuEmail`,`perfilID`) REFERENCES `perfil`(`usuEmail_id`,`perfilID`)
;

ALTER TABLE `objeto` 
 add FOREIGN KEY (`objetoTipoFK`) REFERENCES `tipoObjeto`(`tipoObjetoID`)
;

ALTER TABLE `orgMed` 
 add constraint fk_organizacion FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
 add constraint fk_med FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `organizacion` 
  add constraint fk_personaje FOREIGN KEY (`orgLiderMasConocido`) REFERENCES `personaje`(`personajeID`)
;



ALTER TABLE `perCargOrg` 
  add constraint fk_organizacin FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
  add constraint fk_personae FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  add constraint fk_cargo FOREIGN KEY (`cargo_id`) REFERENCES `cargo`(`cargoID`)
;  
  
ALTER TABLE `perMed` 
  add constraint fk_Persnaje FOREIGN KEY (`med_id`) REFERENCES `personaje`(`personajeID`),
  add constraint fk_me FOREIGN KEY ( `med_id`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `perfil` 
  add CONSTRAINT fK_usuario FOREIGN KEY (`usuEmail_id`) REFERENCES `usuario`(`usuEmail`)
;

ALTER TABLE `persCivil` 
  add constraint  fk_pernaje FOREIGN KEY (`id_personaje`) REFERENCES `personaje`(`personajeID`)
;

ALTER TABLE `persCreador` 
  add FOREIGN KEY (`creadorID_fk`) REFERENCES `creador`(`creadorID`),
  add FOREIGN KEY (`personajeID_fk`) REFERENCES `personaje`(`personajeID`)
;
 
ALTER TABLE `persNacion`
  add constraint fk_peonaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`),
  add constraint fk_nacionalidad FOREIGN KEY (`nacionalidad_id`) REFERENCES `nacionalidad`(`nacionalidadID`)
;


ALTER TABLE `persObjeto` 
  add constraint fk_objeto FOREIGN KEY (`objeto_id`) REFERENCES `objeto`(`objetoID`),
  add constraint fk_peraje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`)
;

ALTER TABLE `persPoder` 
  add constraint fk_poder FOREIGN KEY (`poderID`) REFERENCES `poder`(`poderID`),
  add constraint fk_perse FOREIGN KEY (`personajeID`) REFERENCES `personaje`(`personajeID`)
;

ALTER TABLE `persVillano` 
  add constraint  fk_psonaje FOREIGN KEY (`id_personaje`) REFERENCES `personaje`(`personajeID`)
;

ALTER TABLE `persOcupacion` 
  add constraint fk_opacion FOREIGN KEY (`ocupacion_id`) REFERENCES `ocupacion`(`ocupacionID`),
  add constraint fk_persDSonaje FOREIGN KEY (`personaje_id`) REFERENCES `personaje`(`personajeID`)
;

ALTER TABLE `rating` 
  add constraint fk_perdil FOREIGN KEY (`usuEmail`,`perfil_id`) REFERENCES `perfil`(`usuEmail_id`, `perfilID`),
  add constraint fk_meadio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `recomendacion` 
  add constraint fk_persdil FOREIGN KEY (`usuEmail`,`perfilID`) REFERENCES `perfil`(`usuEmail_id`, `perfilID`),
  add constraint fk_mddedio FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`)
;

ALTER TABLE `sede` 
  add constraint fk_organizasscion FOREIGN KEY (`org_id`) REFERENCES `organizacion`(`orgID`),
  add CONSTRAINT CHK_SEDE_TIPO_EDIFICIO CHECK( `sedeTipoEdificacion`IN('Mansion' ,'Torre' , 'Cueva' , 'Casa' , 'Apartamento'))
;

ALTER TABLE `trajeColor` 
  add constraint fk_persHeeroe FOREIGN KEY (`persHeroe_id`) REFERENCES `persHeroe`(`persHeroeID`),
  add constraint fk_color FOREIGN KEY (`colorHEX_id`) REFERENCES `color`(`colorHEX`)
;

ALTER TABLE `usuDisp` 
  add constraint fk_dispositivo FOREIGN KEY (`disp_id`) REFERENCES `dispositivo`(`dispID`),
  add constraint fk_usuaario FOREIGN KEY (`usuEmail_id`) REFERENCES `usuario`(`usuEmail`)
;

ALTER TABLE `usuTarj` 
  add CONSTRAINT fk_Usuaddrio FOREIGN KEY ( `usuEmail_id`) REFERENCES `usuario`(`usuEmail`),
  add CONSTRAINT fk_tarjeta FOREIGN KEY (`tarjNum_id`) REFERENCES `tarjeta`(`tarjNum`)
;