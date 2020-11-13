CREATE TABLE IF NOT EXISTS books(
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    author_id INT UNSIGNED,
    title VARCHAR(100) NOT NULL,
    `year` INT UNSIGNED NOT NULL DEFAULT 1900,
    `language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE NOT NULL DEFAULT 10.0,
    sellable TINYINT DEFAULT 1,
    copies INT NOT NULL DEFAULT 1,
    description TEXT
);

CREATE TABLE IF NOT EXISTS authors (
  author_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(3)
);

CREATE TABLE clients(
    client_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL,
    active TINYINT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS operations(
    operation_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INT UNSIGNED,
    client_id INT UNSIGNED,
    operation_type ENUM ('Prestado', 'Devuelto', 'Vendido') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT NOT NULL
);

/*Se inserta todo */
INSERT INTO authors(author_id, name, nationality)
VALUES(NULL,'Juan Rulfo','MEX');

/*Sólo se insertan los valores en las columnas a usar*/
INSERT INTO authors(name, nationality)
VALUES('Gabriel García Márquez','COL');

/*No se nombran las columnas pero se insertan los valores correspondientes*/
INSERT INTO authors 
VALUES (NULL,'Juan Gabriel Vasquez','COL');

/*Para insertar varios valores con una sola instrucción*/
INSERT INTO authors(name, nationality)
VALUES('Julio Cortazar', 'ARG'), 
('Isabel Allende', 'CHI'),
('Octavio Paz', 'MEX'),
('Juan Carlos Onetti', 'URU');

INSERT INTO `clients`(client_id, name, email, birthdate, gender, active) VALUES
	(1,'Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),
	(2,'Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1),
	(3,'Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1),
	(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);

INSERT INTO `clients`(name, email, birthdate, gender, active) 
VALUES ('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
ON DUPLICATE KEY UPDATE active = VALUES(active)

INSERT INTO books(title, author_id) VALUES('El laberinto de la Soledad', 6);

/*Usando un subquery*/
INSERT INTO books(title, author_id, `year`)
VALUES('Vuelta al Laberinto de la Soledad',
    (SELECT author_id FROM authors 
    WHERE name = 'Octavio Paz'
    LIMIT 1
    ), 1960
);
