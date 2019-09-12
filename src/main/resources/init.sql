CREATE DATABASE IF NOT EXISTS startrackships
    COLLATE utf8_general_ci;

USE startrackships;

DROP TABLE IF EXISTS ships;

CREATE TABLE ships
(
    idship   INTEGER     NOT NULL AUTO_INCREMENT,
    nameship VARCHAR(50) NULL,
    crewsize INTEGER(4)  NULL,
    speed    double      NULL,
    PRIMARY KEY (idShip)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;

INSERT INTO ships(nameship, crewsize, speed)
values ('USS Enterprise-A', 5, 4),
       ('USS Enterprise-D', 5, 6),
       ('USS Enterprise-E', 5, 7),
       ('USS Enterprise', 5, 9.7),
       ('USS Defiant', 5, 9.9),
       ('USS Voyager', 5, 9.9),
       ('Enterprise NX-01', 5, 3.5);

DROP TABLE IF EXISTS crewmembers;

CREATE TABLE crewmembers
(
    idmember   INTEGER(5)  NOT NULL AUTO_INCREMENT,
    namemember VARCHAR(50) NULL,
    rankmember INTEGER(2)  NULL,
    idship     INTEGER(5)  NULL,
    PRIMARY KEY (idMember),
    FOREIGN KEY (idship) REFERENCES ships (idship)
        ON DELETE SET NULL
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;

INSERT INTO crewmembers(namemember, rankmember, idship)
values ('James T. Kirk', 10, 1),
       ('Leonard McCoy', 10, 1),
       ('Montgomery Scott', 10, 2),
       ('Nyota Uhura', 10, 2),
       ('Hikaru Sulu', 10, 3),
       ('Pavel Chekov', 10, 3),
       ('Christine Chapel', 10, 4),
       ('Janice Rand', 10, 4),
       ('Sarek', 10, 4),
       ('Amanda Grayson', 10, 5),
       ('Spoke', 10, 6);



DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id                    INTEGER(5)   NOT NULL AUTO_INCREMENT,
    username              VARCHAR(50)  NOT NULL,
    password              varchar(100) NOT NULL,
    authorities           VARCHAR(10)  NOT NULL,
    accountnonexpired     BOOLEAN      NOT NULL,
    accountnonlocked      BOOLEAN      NOT NULL,
    credentialsnonexpired BOOLEAN      NOT NULL,
    enabled               BOOLEAN      NOT NULL,

    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;

INSERT INTO users(username, password, authorities, accountnonexpired, accountnonlocked, credentialsnonexpired, enabled)
VALUES ('user', '$2a$10$kKmLugy7McZIHnVJaUJeCu2ZD3ochJ/4jiwUA8HimH2ZW6A7/.4Sm', 'USER', true, true, true, true),
       ('admin', '$2a$10$kKmLugy7McZIHnVJaUJeCu2ZD3ochJ/4jiwUA8HimH2ZW6A7/.4Sm', 'ADMIN', true, true, true, true);