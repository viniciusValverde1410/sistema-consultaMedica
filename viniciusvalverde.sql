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

INSERT INTO pacientes (nome, idade, data_nascimento, email, telefone)
VALUES ('Vinicius Valverde', 16, '2007/09/12', 'viniciusvalverde@gmail.com', '(11) 99689-1030');


INSERT INTO pacientes (nome, idade, data_nascimento, email, telefone)
VALUES ('Pedro Oliveira', 22, '2002/08/12', 'pedrosantos@gmail.com', '(19) 99699-2040'),
('Giovanni Gonçalves', 14, '2010/04/12', 'giovannigoncalves@gmail.com', '(19) 99756-8961');


INSERT INTO pacientes (nome, idade, data_nascimento, email, telefone)
VALUES
 ('Vitor Sampaio', 16, '2008/03/10', 'vitorsampaio@gmail.com', '(71) 99452-9631'),
 ('Gabriela Fernanda', 17, '2007/10/16', 'gabibarbosa@gmail.com', '(19) 99254-8156'),
 ('Julia Martins', 16, '2008/07/12', 'juliaarruda@gmail.com', '(19) 99234-3678');
 
 INSERT INTO pacientes (nome, idade, data_nascimento, email, telefone)
 VALUES
 ('Vitor Argeri', 17, '2007/05/14', 'vitorargeri@gmail.com', '(19) 99169-9863'),
 ('Mariana Silva', 16, '2008/03/12', 'marianasilva@gmail.com', '(19) 99315-7012'),
 ('Marcos Junior' , 17, '2007/05/14', 'marcosjunior@gmail.com', '(19) 99041-0513'),
 ('João Pedro' , 17, '2007/01/27', 'joaopedro@gmail.com', '(19) 99879-1034');
 
 INSERT INTO pacientes (nome, idade, data_nascimento, email, telefone)
 VALUES
 ('Miguel Martins', 16, '2008/07/28', 'miguelsilva@gmail.com', '(19) 99629-1932');

 