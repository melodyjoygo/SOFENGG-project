const Database = require("./database");
var database = new Database();

exports.create = function(clientID,projectNumber,dateAdded) {
    Promise.resolve(database.query("SELECT COUNT(projectID) AS 'count' FROM projects")).then(function(value) {
        database.query("INSERT INTO projects (projectID, clientID,projectNumber,dateAdded) VALUES ?", [[[(value[0].count + 1), clientID,projectNumber,dateAdded]]])
    })
}

exports.getAll = function() {
    return database.query("SELECT * FROM projects");
}

exports.getLatest = function(){
    return database.query("SELECT * FROM projects ORDER BY projects.projectNumber DESC LIMIT 1")
}