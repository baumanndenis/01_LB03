/* Nicht vergessen: nmp install mysql starten in der console, damit JS-Parameter gesetzt werden */

// Die installierten MySql-Module werden in unser Script geladen
const mysql = require("mysql");

// Credentials / Zugriffsdaten zur Datenbank
const config = {
    host: 'localhost',
    database: 'appDB',
    user: "appAdmin",
    password: 'appAdminPW'
}

const connection = mysql.createConnection(config)

// Der Verbindungsaufbau wird durchgeführt. Im Erfolgsfall wird der Name der verbundenen Datenbank angezeigt.
// Im Fehlerfall wird die Fehlermeldung ausgegeben.
connection.connect(function(err) {
    if (err) throw err;
    console.log('Connected to MySQL database:', connection.config.database);
    var sqlstmt = 'SELECT current_date';
    // Das SQL-Statement wird vorbereitetet
    connection.query(sqlstmt, function (err, result) {
        if (err) throw err;
        console.log('Data from MySQL:');
        console.table(result); // This will output data in a table format

    });
});
