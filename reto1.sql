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
VALUES (NULL,'Juan Gabriel Vasquez','COL'')