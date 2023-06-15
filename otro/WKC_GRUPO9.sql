#dudas:

#3- ¿Esta bien la relacion entre el Historico de precios de entrada y la tabla entrada?,
# se me ocurren diferentes maneras de relacionarlas y no me convence ninguna. (la relacion todavia
#no esta en codigo, solo en el E-R.


CREATE SCHEMA IF NOT EXISTS WKC_Grupo9 ;
USE WKC_Grupo9 ;


CREATE TABLE IF NOT EXISTS Lugar (
  Id INT(8) PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45) NOT NULL,
  Id_Padre INT(8) REFERENCES Lugar(Id),
  CONSTRAINT Tipo_Lugar CHECK(Tipo IN ('Pais','Estado','Ciudad')) )
ENGINE = InnoDB;
  

CREATE TABLE IF NOT EXISTS Juez (
  N_juezAKC INT PRIMARY KEY AUTO_INCREMENT,
  Docidentidad INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Nombre2 VARCHAR(45),
  Apellido VARCHAR(45) NOT NULL,
  Apellido2 VARCHAR(45),
  Titulo VARCHAR(3) NOT NULL,
  Fechadefuncion DATE,
  Estatus VARCHAR(10) NOT NULL,
  Fecharetiro DATE,
  Allrounder TINYINT NOT NULL,
  Id_Lugar INT NOT NULL,
  CONSTRAINT fk_Lug FOREIGN KEY(Id_Lugar) REFERENCES Lugar(Id),
  CONSTRAINT titulocheck CHECK(Titulo IN ('SR','SRA','DR','DRA')),
  CONSTRAINT estatuscheck CHECK(Estatus IN ('Activo','Retirado','Fallecido')))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Shows (
  Año YEAR PRIMARY KEY,
  Fecha_Inicio DATE NOT NULL,
  Fecha_Fin DATE NOT NULL,
  numero_edicion INT(5) NOT NULL,
  Cupo TINYINT NOT NULL,
  CostoIncripcion INT NOT NULL,
  Porc_donacion INT NOT NULL,
  Id_Juez_BIS INT NOT NULL,
  CONSTRAINT fk_juez FOREIGN KEY(Id_Juez_BIS) REFERENCES Juez(N_juezAKC) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Organizacion (
  Id INT(4) PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Mision VARCHAR(240) NOT NULL)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Donacion_Show (
  Id_Org INT(4) NOT NULL REFERENCES Organizacion(Id),
  Año_Show YEAR NOT NULL REFERENCES Shows(Año),
  Porcentaje INT NOT NULL,
  Monto_Recibido INT,
  CONSTRAINT PK_DS PRIMARY KEY(Id_Org,Año_Show))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Competencia (
  Id INT NOT NULL,
  Año_Show YEAR NOT NULL REFERENCES Shows(Año),
  Dia DATE NOT NULL,
  Hora_Inicio TIME NOT NULL,
  Hora_Fin TIME NOT NULL,
  tipocompetencia VARCHAR(15) NOT NULL,
  grupo VARCHAR(15) NOT NULL,
  CONSTRAINT tipocheck CHECK (tipocompetencia IN ('raza_variedad','grupo')),
  CONSTRAINT PK_C PRIMARY KEY(Id,Año_Show),
  CONSTRAINT grupo_check CHECK (grupo IN ('Sporting','Hound','Working','Terrier','Toy','Non-Sporting','Herding')) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Persona (
  DocIdentidad INT(10) PRIMARY KEY AUTO_INCREMENT,
  Primer_Nombre VARCHAR(45) NOT NULL,
  Segundo_Nombre VARCHAR(45),
  Apellido  VARCHAR(45) NOT NULL,
  Segundo_Apellido VARCHAR(45) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS CAL_COMP_JUEZ_RV (
  Id_RV INT NOT NULL REFERENCES Raza_Variedad(Id),
  Id_Juez INT NOT NULL REFERENCES Juez(N_juezAKC),
  Id_Comp INT NOT NULL REFERENCES Competencia(Id),
  Año_Show_Comp INT NOT NULL REFERENCES Competencia(Año_Show),
  CONSTRAINT PK_CCJRV PRIMARY KEY (Id_RV, Id_Juez, Id_Comp, Año_Show_Comp) )
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Raza_Variedad (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  NombreRaza VARCHAR(45) NOT NULL,
  NombreVariedad VARCHAR(45),
  Descripcion_General VARCHAR(1000) NOT NULL,
  NombreClub VARCHAR(45) NOT NULL,
  PagClub VARCHAR(100),
  Aparienciageneral VARCHAR(500) NOT NULL,
  Condicionesdesclasificacion VARCHAR(500) NOT NULL,
  Añovigenciaestandar YEAR NOT NULL,
  Grupo VARCHAR(15) NOT NULL,
  URL_Imagen VARCHAR(5000),
  CONSTRAINT Grupocheck CHECK(Grupo IN ('Sporting','Hound','Working','Terrier','Toy','Non-Sporting','Herding')) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Especialista (
  Id_RV INT NOT NULL REFERENCES Raza_Variedad(Id),
  Id_Juez INT NOT NULL REFERENCES Juez(N_juezAKC),
  anoinicio YEAR NOT NULL,
  CONSTRAINT PK_Esp PRIMARY KEY(Id_RV, Id_Juez) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Estandar_De_Competencia (
  Id INT PRIMARY KEY,
  tipo VARCHAR(45) NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(1000),
  CONSTRAINT tipo_check CHECK(tipo IN ('tam_prop_cont','cabeza','cue_lom_cuerpo','otro')) )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Campeon (
  AKCcod INT PRIMARY KEY,
  Sexo VARCHAR(45) NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  Titulo VARCHAR(5) NOT NULL,
  PuntajeActual INT NOT NULL,
  Id_RV INT NOT NULL,
  Id_Lugar INT NOT NULL,
  CONSTRAINT fk_RV FOREIGN KEY(Id_RV) REFERENCES Raza_Variedad(Id),
  CONSTRAINT fk_Lugar FOREIGN KEY(Id_Lugar) REFERENCES Lugar(Id),
  CONSTRAINT titulo_check CHECK(Titulo IN ('CH','GCH','GCHS','GCHG','GCHP')) )
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Pariente_Pedigree ( 
  AKC_1 INT NOT NULL REFERENCES Campeon(AKCCod),
  AKC_2 INT NOT NULL REFERENCES Campeon(AKCCod),
  Parentesco VARCHAR(45) NOT NULL,
  CONSTRAINT ptscocheck CHECK(Parentesco IN ('Padre','Madre','Abuelo','Abuela')),
  CONSTRAINT PK_PP PRIMARY KEY (AKC_1, AKC_2) )
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS RV_E (
  Id_RV INT NOT NULL REFERENCES Raza_Variedad(Id),
  Id_Estandar INT NOT NULL REFERENCES Estandar_De_Competencia(Id),
  CONSTRAINT PK_RV_E PRIMARY KEY(Id_RV, Id_Estandar))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Handler_ (
  Id_Per INT NOT NULL REFERENCES Persona(Id),
  AKC_Camp INT NOT NULL REFERENCES Campeon(AKCcod),
  CONSTRAINT PK_Handler PRIMARY KEY (Id_Per, AKC_Camp))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Criador (
  Id_Per INT NOT NULL REFERENCES Persona(Id),
  AKC_Camp INT NOT NULL REFERENCES Campeon(AKCcod),
  CONSTRAINT PK_Criador PRIMARY KEY (Id_Per, AKC_Camp))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Dueño (
  Id_Per INT NOT NULL REFERENCES Persona(Id),
  AKC_Camp INT NOT NULL REFERENCES Campeon(AKCcod),
  CONSTRAINT PK_Dueño PRIMARY KEY (Id_Per, AKC_Camp))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS Inscripcion (
  Id INT NOT NULL AUTO_INCREMENT,
  AKC_Camp INT NOT NULL REFERENCES Campeon(AKC_cod),
  Año_Show YEAR NOT NULL REFERENCES Shows(Año),
  Id_Persona INT(10) NOT NULL REFERENCES Persona(DocIdentidad),
  BOB TINYINT,
  BOV TINYINT,
  BOS TINYINT,
  Award TINYINT,
  BOG TINYINT,
  BIS TINYINT,
  CONSTRAINT PK_Inscripcion PRIMARY KEY (Id, AKC_Camp, Año_Show, Id_Persona) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Hist_Ticket_Tipo (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  fechai DATE NOT NULL,
  fechaf DATE,
  tipo VARCHAR(20) NOT NULL,
  monto INT NOT NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Entrada (
  numero_entrada INT NOT NULL,
  Año_Show YEAR NOT NULL REFERENCES Shows(Año),
  fechacompra  DATE NOT NULL,
  horacompra TIME NOT NULL,
  monto INT NOT NULL, #calculado
  tipo VARCHAR(20) NOT NULL,
  CONSTRAINT check_tipo CHECK (tipo IN('GeneralAdulto','GeneralNiño','AccesoGeneral')),
  CONSTRAINT PK_Entrada PRIMARY KEY (numero_entrada, Año_Show) )
ENGINE = InnoDB;


/*
CREATE TABLE IF NOT EXISTS Users (
  user_id INT(20) PRIMARY KEY AUTO_INCREMENT,
  user_firstName VARCHAR(100) NOT NULL,
  user_lastName VARCHAR(100) NOT NULL,
  user_email VARCHAR(150) NOT NULL,
  user_phone VARCHAR(100),
  user_adress VARCHAR(150),
  user_password VARCHAR(40) NOT NULL,
  user_login VARCHAR(100) NOT NULL,
  user_dateOfBirth DATE NOT NULL,
  user_gender VARCHAR(20) NOT NULL,
  user_creationDate DATETIME NOT NULL,
  CONSTRAINT check_gender CHECK(user_gender IN ('Masculino', 'Femenino')) )
ENGINE = InnoDb;
*/