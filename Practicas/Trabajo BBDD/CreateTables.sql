------------------------------------------------------
-- Centro       : Cesur Sevilla
-- Descripcion : Script de creacion de BBDD Clinica
-- Autor : Fernando Perez Nieto
-- Autor : Jonatan Carrera Viera
-- Autor : Eva Cardenas Bermudez
-- Autor : Pablo Dominguez Romero
-- Autor : Rafael Felipe Herrera Chavez
------------------------------------------------------

-- Eliminacion de Base de Datos.
DROP DATABASE IF EXISTS Clinica

-- Creacion de Base de datos.
CREATE DATABASE Clinica
GO

-- Uso de Base de datos.
USE Clinica
GO

-- Creacion de la tabla Pacientes
CREATE TABLE Pacientes(
    idPaciente INT NOT NULL IDENTITY(1,1),
    nombre_paciente VARCHAR(50) NOT NULL,
	apellidos_paciente VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    genero CHAR NOT NULL,
	fNacimiento DATE NOT NULL,
    codPost VARCHAR(5) NOT NULL,
    email_paciente VARCHAR(100) NOT NULL,
    telefono1_paciente INT NOT NULL,
    telefono2_paciente INT NULL,
    comentarios_paciente VARCHAR(200) NULL
	
	CONSTRAINT PK_PACIENTE PRIMARY KEY (idPaciente)
)

-- Creacion de la tabla Odontologos
CREATE TABLE Odontologos(
    idProfesional INT NOT NULL IDENTITY(1,1),
    nombre_profesional VARCHAR(50) NOT NULL,
    apellidos_profesional VARCHAR(100) NOT NULL,
    email_profesional VARCHAR(100) NOT NULL,
    telefono_profesional INT NOT NULL,
    comision INT NOT NULL,
    idResponsable INT NULL,
    fechaLiquidacion DATE NOT NULL

    CONSTRAINT PK_ODONTOLOGO PRIMARY KEY (idProfesional),
    CONSTRAINT FK_RESPONSABLE FOREIGN KEY (idResponsable) REFERENCES Odontologos(idProfesional)
	--RELACION RECURSIVA DENTRO DE LA PROPIA TABLA ENTRE PROFESIONAL Y QUIEN ES SU RESPONSABLE
)

-- Creacion de la tabla Patologias
CREATE TABLE Patologias (
    idPatologia INT NOT NULL IDENTITY(1,1),
    nombre_patologias VARCHAR(50) NOT NULL
    
	CONSTRAINT PK_PATOLOGIA PRIMARY KEY (idPatologia)
)

-- Creacion de la tabla FormasPago
CREATE TABLE FormasPago (
    idFCobro INT NOT NULL IDENTITY(1,1),
    nombre_formas_pago VARCHAR(20) NOT NULL

    CONSTRAINT PK_FORMA_PAGO PRIMARY KEY (idFCobro)
)

-- Creacion de la tabla Destino
--TABLA DE DESTINO DEL DINERO DEL COBRO PARA LLEVAR EL CIERRE DE CAJA DIARIO
CREATE TABLE Destino(
    idDestino INT NOT NULL IDENTITY(1,1),
    nombre_destino VARCHAR(10) NOT NULL

    CONSTRAINT PK_DESTINO PRIMARY KEY (idDestino)
)

-- Creacion de la tabla Familias
CREATE TABLE Familias (
    idFamilia INT NOT NULL IDENTITY(1,1),
    nombre_familia VARCHAR(100) NOT NULL

    CONSTRAINT PK_FAMILIA PRIMARY KEY (idFamilia)
)

-- Creacion de la tabla Tratamientos
CREATE TABLE Tratamientos(
    idTratamiento INT NOT NULL IDENTITY(1,1),
    codTto VARCHAR(10) NOT NULL,
    nombre_tratamiento VARCHAR(100) NOT NULL,
	precio DECIMAL(7,2) NOT NULL,
    codFamilia INT NOT NULL

    CONSTRAINT PK_TRATAMIENTO PRIMARY KEY (idTratamiento),
    CONSTRAINT FK_FAMILIA FOREIGN KEY (codFamilia) REFERENCES Familias(idFamilia)
)

-- Creacion de la tabla Patologias_Pacientes
CREATE TABLE Patologias_Pacientes(
    idPaciente INT NOT NULL,
    idPatologia INT NOT NULL
	
	CONSTRAINT PK_PATOLOGIA_PACIENTE PRIMARY KEY (idPaciente, idPatologia),
	CONSTRAINT FK_PATOLOGIA FOREIGN KEY (idPatologia) REFERENCES Patologias(idPatologia),
    CONSTRAINT FK_PACIENTE_PAT FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente)
)

-- Creacion de la tabla Visitas
CREATE TABLE Visitas(
    idServicio INT NOT NULL IDENTITY(1,1),
    idProfesional INT NOT NULL,
    idPaciente INT NOT NULL,
    idTratamiento INT NOT NULL,
    idFPago INT NOT NULL,
    idDestino INT NOT NULL,
    fecha_visitas DATE NOT NULL,
    pagado DECIMAL(7,2) NOT NULL,
    restante DECIMAL(7,2) NOT NULL,
    comentarios_visitas VARCHAR(250) NULL,
    finalizado BIT NOT NULL

    CONSTRAINT PK_VISITA PRIMARY KEY (idServicio),
    CONSTRAINT  FK_PROFESIONAL FOREIGN KEY (idProfesional) REFERENCES Odontologos(idProfesional),
    CONSTRAINT  FK_PACIENTE FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
    CONSTRAINT  FK_TRATAMIENTO FOREIGN KEY (idTratamiento) REFERENCES Tratamientos(idTratamiento),
    CONSTRAINT  FK_FPAGO FOREIGN KEY (idFPago) REFERENCES FormasPago(idFCobro),
    CONSTRAINT  FK_DESTINO FOREIGN KEY (idDestino) REFERENCES Destino(idDestino)
)