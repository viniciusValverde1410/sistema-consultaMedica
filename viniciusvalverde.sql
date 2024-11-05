CREATE DATABASE sistemamedico;

CREATE TABLE pacientes(
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
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
    sintoma_paciente VARCHAR(50) NOT NULL,
    id_medico INT NOT NULL,
    data_consulta DATE,
    CONSTRAINT fk_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente),
    CONSTRAINT fk_medico
        FOREIGN KEY (id_medico)
        REFERENCES medicos (id_medico)
);

INSERT INTO pacientes (nome, data_nascimento, email, telefone)
VALUES ('Vinicius Valverde', '2007/09/12', 'viniciusvalverde@gmail.com', '(19) 99689-1030');

INSERT INTO pacientes (nome, data_nascimento, email, telefone)
VALUES ('Pedro Oliveira', '2002/08/12', 'pedrosantos@gmail.com', '(19) 99699-2040'),
('Giovanni Gonçalves', '2010/04/12', 'giovannigoncalves@gmail.com', '(19) 99756-8961');

INSERT INTO pacientes (nome, data_nascimento, email, telefone)
VALUES
 ('Vitor Sampaio', '2008/03/10', 'vitorsampaio@gmail.com', '(71) 99452-9631'),
 ('Gabriela Fernanda', '2007/10/16', 'gabibarbosa@gmail.com', '(19) 99254-8156'),
 ('Julia Martins', '2008/07/12', 'juliaarruda@gmail.com', '(19) 99234-3678');
 
 INSERT INTO pacientes (nome, data_nascimento, email, telefone)
 VALUES
 ('Vitor Argeri', '2007/05/14', 'vitorargeri@gmail.com', '(19) 99169-9863'),
 ('Mariana Silva',  '2008/03/12', 'marianasilva@gmail.com', '(19) 99315-7012'),
 ('Marcos Junior' , '2007/05/14', 'marcosjunior@gmail.com', '(19) 99041-0513'),
 ('João Pedro' , '2007/01/27', 'joaopedro@gmail.com', '(19) 99879-1034');
 
 INSERT INTO pacientes (nome, data_nascimento, email, telefone)
 VALUES
 ('Miguel Martins', '2008/07/28', 'miguelsilva@gmail.com', '(19) 99629-1932');

 INSERT INTO pacientes (nome, data_nascimento, email, telefone)
 VALUES
 ('Marina Silva', '1998/03/12', 'marinasilva@gmail.com', '(19) 99457-8612'),
 ('Marcos Silva', '1980/01/28', 'marcosilva@gmail.com', '(19) 99391-8102'),
 ('Maria Marques', '1970/5/30', 'mariamarques@gmail.com', '(19) 99451-4102'),
 ('João Cleber', '1982/04/04', 'jotacleber@gmail.com', '(19) 99012-8512');

 INSERT INTO medicos (nome, idade, especialidade)
 VALUES
 ('Dr. Osvaldo Queiroz', 45, 'Cardiologista'), 1
 ('Dra. Larissa Silva', 32, 'Pediatra'),       2
 ('Dr. Carlos Maranhão', 28, 'Oftamologista'), 3
 ('Dra. Laura Marques', 24, 'Ortopedista'),    4
 ('Dr. Marcos Braz', 42, 'Clinico Geral'),     5
 ('Dra. Julia Fernandes', 32, 'Neurologista'), 6
 ('Dr. Thiago Ferraz', 24, 'Otorrinolaringologista'), 7
 ('Dra. Nathalia Silva', 36, 'Dermatologista'); 8

 INSERT INTO consultas (id_paciente, sintoma_paciente, id_medico, data_consulta)
 VALUES
 (2, 'Dor de cabeça', 5, '2025-1-12'),
 (1, 'Dor no pé', 4, '2024-12-01'),
 (3, 'Verruga', 8, '2024-11-08'),
 (4, 'Consulta rotineira', 2, '2024-12-24'),
 (5, 'Secreção Nasal', 7, '2024-12-15'),
 (17, 'Dor no coração', 1, '2025-01-03'),
 (20, 'Dor nas vista', 3, '2024-11-27'),
 (19, 'Perda de memória', 6, '2024-11-08');

SELECT p.nome AS paciente, m.nome AS médico, m.especialidade, c.data_consulta, c.id_consulta 
FROM consultas c 
JOIN pacientes p 
ON c.id_paciente = p.id_paciente 
JOIN medicos m 
ON c.id_medico = m.id_medico
WHERE data_consulta <= CURRENT_DATE;

SELECT p.nome AS paciente, p.email, p.telefone
FROM pacientes p
LEFT JOIN consultas c
ON c.id_paciente = p.id_paciente
WHERE c.id_consulta IS NULL;


