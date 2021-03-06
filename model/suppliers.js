const Database = require("./database");
var database = new Database();

exports.create = function(supplierName,contactNum) {
    Promise.resolve(database.query("SELECT COUNT(supplierID) AS 'count' FROM suppliers")).then(function(value) {
        database.query("INSERT INTO suppliers (supplierID, supplierName,contactNumber) VALUES ?", [[[(value[0].count + 1), supplierName,contactNum]]])
    })
}

exports.getSupplier = function(supplierID){
    return database.query("SELECT * FROM suppliers WHERE suppliers.supplierID = ?",[supplierID])
}

exports.getAll = function() {
    return database.query("SELECT * FROM suppliers");
}

exports.edit = function(suppID,suppName,contactNum){
    database.query("UPDATE suppliers SET supplierName = ?, contactNumber = ? WHERE supplierID = ?",[suppName,contactNum,suppID])
}
