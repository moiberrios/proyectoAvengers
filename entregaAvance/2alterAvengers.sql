
ALTER TABLE `cargoMontoSuscripcion` (
  CONSTRAINT  fk_usuTarj FOREIGN KEY (`numTarjt`) REFERENCES `usuTarj`(`tarjNum`),
  CONSTRAINT fk_usuTarj_UsuEmail FOREIGN KEY (`usuEmail`) REFERENCES `usuTarj`(`usuEmail`),
  CONSTRAINT fk_cuentaID FOREIGN KEY (`cuentaID`) REFERENCES `cuenta`(`cuentaID`)
);

ALTER TABLE `comGal` (
  CONSTRAINT fk_medcomic FOREIGN KEY (`medComicID`) REFERENCES `medComic`(`medComID`),
  CONSTRAINT fk_galID FOREIGN KEY (`galID`) REFERENCES `galeria`(`galID`)
);

ALTER TABLE `combate` (
  CONSTRAINT fk_objetoID FOREIGN KEY (`objetoID_fk`) REFERENCES `objeto`(`objetoID`),
  CONSTRAINT fk_poderID FOREIGN KEY (`poderID_fk`) REFERENCES `poder`(`poderID`),
  CONSTRAINT fk_lugarID FOREIGN KEY (`combateLugar`) REFERENCES `lugar`(`lugarID`)
);

ALTER TABLE `cuentaGratis` (
   CONSTRAINT fk_usuGal FOREIGN KEY ( `id_usuEmail`) REFERENCES `usuario`(`usuEmail`),
);