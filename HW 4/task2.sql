INSERT INTO petEvent VALUES
                         ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
                         ('Hammy', '2020-10-15', 'vet', 'antibiotics'),
                         ('Fluffy', NULL, 'Birth', 'Birth to 5 kittens, 2 male' ),
                         ('Claws', '1997-08-03', 'Broken Rib', NULL),
                         ('Puffball', '2020-09-01', 'Death', NULL);
INSERT INTO petPet VALUES
                       ('Hammy', 'Diane', 'M', 'Hamster', '2020-10-30', NULL);

DELETE FROM petPet WHERE owner = 'Harold';

DELETE FROM petEvent WHERE petname = (SELECT petname FROM petPet WHERE owner = 'Harold');
