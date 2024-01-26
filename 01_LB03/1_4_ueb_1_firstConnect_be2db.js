// Damit JS die Verbindung zur Datenbank aufbauen kann, müssen vorher die entsprechenden MySql-Module geladen werden.
// Dies geschieht mit dem Befehl "npm install mysql"

// Die installierten MySql-Module werden in unser Script geladen
const mysql = require("mysql");

// Credentials / Zugriffsdaten zur Datenbank
// Diese werden normalerweise in einem File, in einem besonders geschützten Netzwerk-Computer gelagert.
// Die Übung_6 besteht darin diese Credentials auszulagern in eine separate Datei
const config = {
    host: 'localhost',
    user: 'appAdmin',
    password: 'appAdminPW',
    database: 'appDB',}

// Wir bereiten die Verbindung zur Datenbank vor
const connection = mysql.createConnection(config)

// Der Verbindungsaufbau wird durchgeführt. Im Erfolgsfall wird eine Bestätigung, ansonsten die Fehlermeldung, ausgegeben.
connection.connect(function(err) {
    if (err) throw(err);
    console.log("Connected! Endlich!!!");
});

