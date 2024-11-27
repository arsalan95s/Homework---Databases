DROP
DATABASE IF EXISTS pet_database;
CREATE
DATABASE pet_database;
USE
pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet
(
    petname VARCHAR(20) NOT NULL PRIMARY KEY,
    owner   VARCHAR(45),
    species VARCHAR(45),
    gender  CHAR(1),
    birth   DATE,
    death   DATE,
    CONSTRAINT chk_gender CHECK ( gender IN ('M', 'F') )
    );

CREATE TABLE petEvent
(
    ID        INT AUTO_INCREMENT PRIMARY KEY,
    petname   VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark    VARCHAR(15),
    FOREIGN KEY (petname) REFERENCES petPet (petname)
    );