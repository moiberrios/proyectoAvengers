
ALTER TABLE `cargoMontoSuscripcion` (
  add CONSTRAINT fk_usuTarj_UsuEmail FOREIGN KEY (`usuEmail`) REFERENCES `usuTarj`(`usuEmail`),
  add CONSTRAINT  fk_usuTarj FOREIGN KEY (`numTarjt`) REFERENCES `usuTarj`(`tarjNum`),
  CONSTRAINT fk_usuCuentaID FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`)
);

ALTER TABLE `comGal` (
  add CONSTRAINT fk_medComic FOREIGN KEY (`medComicID`) REFERENCES `medComic`(`medComID`),
  add CONSTRAINT fk_galID FOREIGN KEY (`galID`) REFERENCES `galeria`(`galID`)
);

ALTER TABLE `combate` (
  add CONSTRAINT fk_objetoID FOREIGN KEY (`objetoID_fk`) REFERENCES `objeto`(`objetoID`),
  add CONSTRAINT fk_poderID FOREIGN KEY (`poderID_fk`) REFERENCES `poder`(`poderID`),
  add CONSTRAINT fk_lugarID FOREIGN KEY (`combateLugar`) REFERENCES `lugar`(`lugarID`)
);

ALTER TABLE `cuentaGratis` (
  add CONSTRAINT pk_fk_usuarioEmail FOREIGN KEY ( `id_usuEmail`) REFERENCES `usuario`(`usuEmail`)
  add CONSTRAINT fk_galeria FOREIGN KEY ( `galeriaGratuita`) REFERENCES `galeria`(`galID`)
);

ALTER TABLE `cuentaMed` (
  add CONSTRAINT fk_cuentaID FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`),
  add CONSTRAINT fk_medio FOREIGN KEY (`med_id`) REFERENCES `medio`(`medID`)
);

ALTER TABLE `cuenta` (
	add CONSTRAINT CHK_CUENTA_TIPO CHECK( `cuentaTipo` IN( 'Gold' OR 'Premium' OR 'VIP'))
);


ALTER TABLE `descuento` (
  add constraint pk_fk_beneficio FOREIGN KEY (`ben_id`) REFERENCES `beneficio`(`benID`),
  add constraint pk_fk_cuenta FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta`(`cuentaID`)
);

ALTER TABLE `dispositivo` (
  add CONSTRAINT CHK_DISP_TIPO CHECK( `dispTipo` IN('Telefono' , 'Tablet' , 'Portatil' , 'Escritorio'))
	add CONSTRAINT CHK_MODO_LECTURA CHECK( `modoLectura` IN('Oscuro', 'Solar'))
);

ALTER TABLE `heroeVillanoCivil` (
  add CONSTRAINT fk_persHeroe FOREIGN KEY (`persHeroeID_fk`) REFERENCES `persHeroe`(`persHeroeID`),
  add CONSTRAINT fk_persVillano FOREIGN KEY (`persCivilID_fk`) REFERENCES `persVillano`(`persVillanoID`),
  add CONSTRAINT fk_persCivil FOREIGN KEY (`persVillanoID_fk`) REFERENCES `persCivil`(`persCivilD`)
);

ALTER TABLE `heroeVillanoEnfrentados` (
  add constraint fk_persheroe FOREIGN KEY (`persHeroe_id`) REFERENCES `persHeroe`(`persHeroeID`),
  add constraint fk_persvillano FOREIGN KEY (`persVillano_id`) REFERENCES `persVillano`(`persVillanoID`)
);

ALTER TABLE `historial` (
  add constraint fk_medio FOREIGN KEY (`medID`) REFERENCES `medio`(`medID`)
  add constraint fk_perfil FOREIGN KEY (`perfilID`) REFERENCES `perfil`(`perfilID`),
  add constraint fk_perfil_usuemail FOREIGN KEY ( `usuEmail`) REFERENCES `perfil`(`usuEmail`)
);

-- ALTER TABLE `lugar` (
--   add constraint fk_usuario FOREIGN KEY (`lugarID`) REFERENCES `usuario`(`usuPais`),
--   add constraint fk_lugar FOREIGN KEY (`lugar_id`) REFERENCES `lugar`(`lugarID`),
--   add constraint fk_usuario FOREIGN KEY (`lugar_id`) REFERENCES `usuario`(`usuCiudad`),
--   add CONSTRAINT CHK_LUGAR CHECK( `lugarTipo`	IN('Continente' , 'Pais' , 'Ciudad' , 'Avenida' , 'Calle' , 'Edificio' , 'Apartamento' , 'Avenida'))
-- );

