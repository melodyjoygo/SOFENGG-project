const Database = require("./database");
var database = new Database();

exports.getClerkAddRequests = function(){
    return database.query("SELECT * FROM clerk_add_request LEFT JOIN users ON clerk_add_request.userID = users.userID LEFT JOIN user_Types on users.userType = user_Types.utID NATURAL JOIN materials LEFT JOIN material_types ON materials.materialType = material_types.mtID LEFT JOIN suppliers ON materials.supplierID = suppliers.supplierID WHERE status = 'Pending'")
}

exports.getStockmanEditRequests = function(){
    return database.query("SELECT * FROM softengdb.stockman_edit_requests LEFT JOIN materials ON stockman_edit_requests.currItemID = materials.materialID LEFT JOIN material_types ON material_types.mtID = materials.materialType LEFT JOIN suppliers ON suppliers.supplierID = stockman_edit_requests.currSupplierID LEFT JOIN (SELECT requestID,supplierName AS 'newSupplier',type AS 'newType',materialName AS 'newItemName' FROM stockman_edit_requests LEFT JOIN materials ON materials.materialID = stockman_edit_requests.newItemID LEFT JOIN material_types ON material_types.mtID = materials.materialType LEFT JOIN suppliers ON suppliers.supplierID = stockman_edit_requests.newSupplierID) newTable ON newTable.requestID = stockman_edit_requests.requestID")
}

exports.getStockmanReleaseRequests = function(){
    return database.query("SELECT * FROM stockman_release_requests LEFT JOIN users ON stockman_release_requests.userID = users.userID LEFT JOIN user_Types on users.userType = user_Types.utID LEFT JOIN projects ON stockman_release_requests.projectID = projects.projectID LEFT JOIN materials ON materials.materialID = stockman_release_requests.itemID LEFT JOIN material_types ON material_types.mtID = materials.materialID LEFT JOIN suppliers ON suppliers.supplierID = materials.supplierID")
}