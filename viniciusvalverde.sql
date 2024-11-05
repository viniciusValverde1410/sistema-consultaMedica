CREATE DATABASE sistemamedico;

CREATE TABLE pacientes(
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE medicos (
    id_medico SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE consultas(
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    sintoma VARCHAR(50) NOT NULL,
    id_medico INT NOT NULL,
    data_consulta DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_consulta TIME NOT NULL,
    CONSTRAINT fk_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente),
    CONSTRAINT fk_medico
        FOREIGN KEY (id_medico)
        REFERENCES medicos (id_medico)
);
