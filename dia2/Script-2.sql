-- Crear la tabla de regiones
CREATE TABLE regiones (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE
);

-- Crear la tabla de departamentos
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    codigo_departamento INT,
    region_id INT REFERENCES regiones(id)
);

-- Crear la tabla de municipios
CREATE TABLE municipios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    codigo_municipio INT UNIQUE,
    codigo_departamento INT,
    departamento VARCHAR(100),
    FOREIGN KEY (codigo_departamento) REFERENCES departamentos(id)
);

-- Crear la tabla de personas
CREATE TABLE personas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    municipio_nacimiento_id INT REFERENCES municipios(id),
    municipio_domicilio_id INT REFERENCES municipios(id)
);
