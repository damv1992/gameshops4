CREATE DATABASE gameshops4 COLLATE 'utf8mb4_general_ci';

CREATE TABLE Configuracion (
    CodigoConfiguracion bigint NOT NULL,
    NombrePagina varchar(200) NOT NULL,
    IconoPagina varchar(500) NOT NULL,
    LogoPagina varchar(500) NOT NULL,
    FrasePagina varchar(500) NOT NULL,
    SobreNosotros mediumtext NOT NULL,
    EstadoPagina boolean NOT NULL,
    PRIMARY KEY (CodigoConfiguracion)
);
CREATE TABLE RedesSociales (
    CodigoSocial bigint NOT NULL,
    EnlaceSocial mediumtext NOT NULL,
    IconoSocial varchar(50) NOT NULL,
    PRIMARY KEY (CodigoSocial)
);
CREATE TABLE MetodosPago (
    CodigoMetodo bigint NOT NULL,
    ImagenMetodo varchar(500) NOT NULL,
    PRIMARY KEY (CodigoMetodo)
);
CREATE TABLE Publicidades (
  CodigoPublicidad bigint NOT NULL,
  Titular varchar(200) NOT NULL,
  Descripcion mediumtext NOT NULL,
  ImagenPublicidad varchar(500) NOT NULL,
  EnlacePublicidad mediumtext,
  EstadoPublicidad boolean NOT NULL,
  FechaHoraInicio datetime,
  FechaHoraFin datetime,
  PRIMARY KEY (CodigoPublicidad)
);
CREATE TABLE Usuarios (
    CodigoUsuario bigint NOT NULL,
    Usuario varchar(200) UNIQUE NOT NULL,
    Contrasena varchar(500) NOT NULL,
    Telefono varchar(12),
    RolAsignado varchar(50) NOT NULL,
    FechaHoraRegistro datetime,
    PRIMARY KEY (CodigoUsuario)
);
CREATE TABLE Plataformas (
    CodigoPlataforma bigint NOT NULL,
    NombrePlataforma varchar(200) UNIQUE NOT NULL,
    IconoPlataforma varchar(500) NOT NULL,
    PRIMARY KEY (CodigoPlataforma)
);
CREATE TABLE Tipos (
    CodigoTipo bigint NOT NULL,
    NombreTipo varchar(200) NOT NULL,
    PRIMARY KEY (CodigoTipo)
);
CREATE TABLE Generos (
    CodigoGenero bigint NOT NULL,
    NombreGenero varchar(200) UNIQUE NOT NULL,
    PRIMARY KEY (CodigoGenero)
);
CREATE TABLE Productos (
    CodigoProducto bigint NOT NULL,
    NombreProducto varchar(200) NOT NULL,
    Descripcion mediumtext,
    FotoProducto mediumtext,
    Precio float NOT NULL,
    Plataforma bigint NOT NULL,
    Tipo bigint NOT NULL,
    PRIMARY KEY(CodigoProducto),
    FOREIGN KEY (Plataforma) REFERENCES Plataformas (CodigoPlataforma),
    FOREIGN KEY (Tipo) REFERENCES Tipos (CodigoTipo)
);
CREATE TABLE GenerosProducto (
    Genero bigint NOT NULL,
    Producto bigint NOT NULL,
    PRIMARY KEY (Genero, Producto),
    FOREIGN KEY (Genero) REFERENCES Generos (CodigoGenero),
    FOREIGN KEY (Producto) REFERENCES Productos (CodigoProducto)
);
CREATE TABLE Alquileres (
    CodigoProducto bigint NOT NULL,
    NombreProducto varchar(200) NOT NULL,
    Descripcion mediumtext,
    FotoProducto mediumtext,
    Precio float NOT NULL,
    Plataforma bigint NOT NULL,
    Tipo bigint NOT NULL,
    PRIMARY KEY(CodigoProducto),
    FOREIGN KEY (Plataforma) REFERENCES Plataformas (CodigoPlataforma),
    FOREIGN KEY (Tipo) REFERENCES Tipos (CodigoTipo)
);
CREATE TABLE GenerosAlquiler (
    Genero bigint NOT NULL,
    Producto bigint NOT NULL,
    PRIMARY KEY (Genero, Producto),
    FOREIGN KEY (Genero) REFERENCES Generos (CodigoGenero),
    FOREIGN KEY (Producto) REFERENCES Alquileres (CodigoProducto)
);
CREATE TABLE Carritos (
    DireccionIp varchar(200) NOT NULL,
    Producto bigint NOT NULL,
    PRIMARY KEY (DireccionIp, Producto),
    FOREIGN KEY (Producto) REFERENCES Productos (CodigoProducto)
);

/*
    id18807032_gameshop
    id18807032_memesis
    L#[J13q?tjMB!#T(
*/