create database youevent;

CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(30)
) engine = innodb;
CREATE TABLE lieu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ville VARCHAR(255),
    paye VARCHAR (255)
) engine = innodb;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    email VARCHAR (50),
    mdp VARCHAR (30),
    id_role INT,
    Foreign Key (id_role) REFERENCES roles (id)
) engine = innodb;

CREATE TABLE events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30),
    artiste VARCHAR (50),
    description VARCHAR (30),
    dateEvents TIMESTAMP,
    -- image   
    id_user INT,
    Foreign Key (id_user) REFERENCES users (id),
    id_lieu INT,
    Foreign Key (id_lieu) REFERENCES lieu (id)
) engine = innodb;

CREATE TABLE reservation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_de_creation TIMESTAMP DEFAULT NOW(),
    prixTotal INT,
    id_user INT,
    Foreign Key (id_user) REFERENCES users (id)
) engine = innodb;

CREATE TABLE ticket (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(100),
    prix INT,
    quantite INT,
    id_event INT,
    Foreign Key (id_event) REFERENCES events (id)
) engine = innodb;

CREATE TABLE recu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_reservation INT,
    Foreign Key (id_reservation) REFERENCES reservation (id),
    id_ticket INT,
    Foreign Key (id_ticket) REFERENCES ticket (id)
) engine = innodb; 



-- Insert data into 'roles' table
INSERT INTO roles (titre) VALUES
    ('client'),
    ('organisateur'),
    ('admin');

-- Insert data into 'lieu' table
INSERT INTO lieu (ville, paye) VALUES
    ('City1', 'Country1'),
    ('City2', 'Country2'),
    ('City3', 'Country3');

-- Insert data into 'users' table
INSERT INTO users (nom, prenom, email, mdp, id_role) VALUES
    ('ClientFirstName1', 'ClientLastName1', 'client1@example.com', 'password123', 1),
    ('ClientFirstName2', 'ClientLastName2', 'client2@example.com', 'pass456', 1),
    ('OrganizerFirstName1', 'OrganizerLastName1', 'organizer1@example.com', 'orgpass', 2),
    ('OrganizerFirstName2', 'OrganizerLastName2', 'organizer2@example.com', 'orgpass123', 2),
    ('AdminFirstName1', 'AdminLastName1', 'admin1@example.com', 'adminpass', 3),
    ('AdminFirstName2', 'AdminLastName2', 'admin2@example.com', 'adminpass123', 3);

-- Insert data into 'events' table
INSERT INTO events (nom, artiste, description, dateEvents, id_user, id_lieu) VALUES
    ('Event1', 'Artist1', 'Description1', '2023-01-01 12:00:00', 3, 1),
    ('Event2', 'Artist2', 'Description2', '2023-02-15 18:30:00', 4, 2),
    ('Event3', 'Artist3', 'Description3', '2023-03-20 20:00:00', 5, 3);

-- Insert data into 'reservation' table
INSERT INTO reservation (prixTotal, id_user) VALUES
    (100, 1),
    (150, 2),
    (200, 3);

-- Insert data into 'ticket' table
INSERT INTO ticket (type, prix, quantite, id_event) VALUES
    ('General Admission', 30, 50, 1),
    ('VIP', 50, 30, 2),
    ('Regular', 40, 40, 3);

-- Insert data into 'recu' table
INSERT INTO recu (id_reservation, id_ticket) VALUES
    (1, 1),
    (2, 2),
    (3, 3);
