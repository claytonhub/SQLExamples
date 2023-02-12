CREATE TABLE quartos (
    numero INT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    vista VARCHAR(50) NOT NULL
);

CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    nome_responsavel VARCHAR(255) NOT NULL,
    RG VARCHAR(255) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    numero_quarto INT REFERENCES quartos (numero),
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    meio_pagamento VARCHAR(50) NOT NULL
);