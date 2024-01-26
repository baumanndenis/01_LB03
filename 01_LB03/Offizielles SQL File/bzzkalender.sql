--Datenbank erstellen
CREATE DATABASE bzzkalender;

USE bzzkalender;

--Ersteller-Tabelle erstellen
CREATE TABLE IF NOT EXISTS ersteller (
    ErstellerID INT PRIMARY KEY AUTO_INCREMENT,
    Erstellervorname VARCHAR(255) NOT NULL,
    Erstellername VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);


INSERT INTO ersteller (ErstellerID, Erstellervorname, Erstellername, Username, Password)
VALUES
    (1, 'Max', 'Mustermann', 'MaxM', 'Pass123'),
    (2, 'Anna', 'Musterfrau', 'AnnaM', 'Pass456'),
    (3, 'John', 'Doe', 'JohnD', 'Pass789'),
    (4, 'Laura', 'Schmidt', 'LauraS', 'Pass987'),
    (5, 'Felix', 'Müller', 'FelixM', 'Pass654'),
    (6, 'Sophie', 'Schulz', 'SophieS', 'Pass321'),
    (7, 'Erik', 'Wagner', 'ErikW', 'Pass987'),
    (8, 'Maria', 'Fischer', 'MariaF', 'Pass654'),
    (9, 'Tom', 'Schneider', 'TomS', 'Pass321'),
    (10, 'Lisa', 'Becker', 'LisaB', 'Pass789');

SELECT * FROM ersteller;



--Abteilung-Tabelle erstellen
CREATE TABLE IF NOT EXISTS abteilung (
    AbteilungID INT PRIMARY KEY AUTO_INCREMENT,
    Abteilungname VARCHAR(255) NOT NULL
);

INSERT INTO abteilung (AbteilungID, Abteilungname) VALUES
    (1, 'Lehrer'),
    (2, 'Mediamatiker'),
    (3, 'KV'),
    (4, 'FaBe'),
    (5, 'BMS')
;

SELECT * FROM abteilung;


--Tabelle erstellen
CREATE TABLE IF NOT EXISTS status (
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    Status VARCHAR(255) NOT NULL
);

INSERT INTO status (StatusID, Status) VALUES
    (1, 'Entwurf'),
    (2, 'Veröffentlicht'),
    (3, 'Wartend')
;

SELECT * FROM status;




--Tabelle Freigabe erstellen
CREATE TABLE IF NOT EXISTS freigabe (
    FreigabeID INT PRIMARY KEY AUTO_INCREMENT,
    Freigabe VARCHAR(255) NOT NULL
);

INSERT INTO freigabe (FreigabeID, Freigabe) VALUES
    (1, 'Freigegeben'),
    (2, 'Nicht Freigegeben')
;

SELECT * FROM freigabe;



--Tabelle Ort erstellen
CREATE TABLE IF NOT EXISTS schulhaus (
    SchulhausID INT PRIMARY KEY AUTO_INCREMENT,
    Schulhaus VARCHAR(255)
);

INSERT INTO schulhaus (SchulhausID, Schulhaus) VALUES
    (1, 'BZZ Horgen'),
    (2, 'BZZ Stäfa')
;


SELECT * FROM schulhaus;



--Tabelle für Schulzimmer erstellen
CREATE TABLE IF NOT EXISTS zimmer (
    ZimmerID INT PRIMARY KEY AUTO_INCREMENT,
    Zimmer VARCHAR(255)
)

INSERT INTO zimmer (Zimmer)
VALUES
    ('Aula'),
    ('102'),
    ('103'),
    ('104'),
    ('105'),
    ('201'),
    ('202'),
    ('203'),
    ('204'),
    ('205');

SELECT * FROM zimmer;



--Tabelle für Ereignisse anlegen
CREATE TABLE IF NOT EXISTS eintraege (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    Datum DATE NOT NULL,
    Zeit TIME NOT NULL,
    Eventname VARCHAR(255) NOT NULL,
    SchulhausID INT,
    ZimmerID INT,
    ErstellerID INT,
    AbteilungID INT,
    StatusID INT,
    FreigabeID INT

);

INSERT INTO eintraege (Datum, Zeit, Eventname, SchulhausID, ZimmerID, ErstellerID, AbteilungID, StatusID, FreigabeID) VALUES
    ('2023-01-10', '09:00:00','Abschlussfeier', '1','1','1','2','1','1'),
    ('2023-03-10', '12:00:00','Geburtstag', '1','1','1','1','1','1');

SELECT * FROM eintraege;

--Ausgabe Backend
SELECT
    e.EventID,
    e.Datum,
    e.Zeit,
    e.Eventname,
    s.Schulhaus,
    z.Zimmer,
    a.Abteilungname,
    er.Erstellervorname,
    er.Erstellername,
    st.Status,
    f.Freigabe
FROM eintraege e
JOIN schulhaus s ON e.SchulhausID = s.SchulhausID
JOIN zimmer z ON e.ZimmerID = z.ZimmerID
JOIN ersteller er ON e.ErstellerID = er.ErstellerID
JOIN abteilung a ON e.AbteilungID = a.AbteilungID
JOIN status st ON e.StatusID = st.StatusID
JOIN freigabe f ON e.FreigabeID = f.FreigabeID;

--Ausgabe Frontend
SELECT
    e.EventID,
    e.Datum,
    e.Zeit,
    e.Eventname,
    s.Schulhaus,
    z.Zimmer,
    a.Abteilungname
FROM eintraege e
JOIN schulhaus s ON e.SchulhausID = s.SchulhausID
JOIN zimmer z ON e.ZimmerID = z.ZimmerID
JOIN abteilung a ON e.AbteilungID = a.AbteilungID
;