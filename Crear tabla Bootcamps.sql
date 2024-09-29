-- Crear tabla Bootcamps
CREATE TABLE Bootcamps (
    ID_bootcamp INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Alumnos
CREATE TABLE Alumnos (
    ID_alumno INT PRIMARY KEY,
    ID_bootcamp INT,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Documento_Identificacion VARCHAR(50),
    FOREIGN KEY (ID_bootcamp) REFERENCES Bootcamps(ID_bootcamp)
);

-- Crear tabla Direcciones
CREATE TABLE Direcciones (
    ID_direccion INT PRIMARY KEY,
    ID_alumno INT,
    Pais VARCHAR(50),
    Codigo_postal VARCHAR(10),
    Poblacion VARCHAR(50),
    Ciudad VARCHAR(50),
    Calle VARCHAR(100),
    FOREIGN KEY (ID_alumno) REFERENCES Alumnos(ID_alumno)
);

-- Crear tabla Pagos
CREATE TABLE Pagos (
    ID_pago INT PRIMARY KEY,
    ID_alumno INT,
    Metodo_pago VARCHAR(50),
    Cantidad DECIMAL(10, 2),
    FOREIGN KEY (ID_alumno) REFERENCES Alumnos(ID_alumno)
);

-- Crear tabla Cursos
CREATE TABLE Cursos (
    ID_curso INT PRIMARY KEY,
    ID_bootcamp INT,
    Nombre_Curso VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    FOREIGN KEY (ID_bootcamp) REFERENCES Bootcamps(ID_bootcamp)
);

-- Crear tabla Inscripciones
CREATE TABLE Inscripciones (
    ID_inscripcion INT PRIMARY KEY,
    ID_alumno INT,
    ID_curso INT,
    Fecha_inscripcion DATE,
    FOREIGN KEY (ID_alumno) REFERENCES Alumnos(ID_alumno),
    FOREIGN KEY (ID_curso) REFERENCES Cursos(ID_curso)
);

-- Crear tabla Profesores
CREATE TABLE Profesores (
    ID_profesor INT PRIMARY KEY,
    ID_bootcamp INT,
    Nombre VARCHAR(100),
    FOREIGN KEY (ID_bootcamp) REFERENCES Bootcamps(ID_bootcamp)
);
