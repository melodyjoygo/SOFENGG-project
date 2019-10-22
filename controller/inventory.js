const express = require("express");
const router = express.Router();

const materials = require("../model/materials")
const materialType = require("../model/materials_types")
const Clients = require("../model/clients")
const Suppliers = require("../model/suppliers");
const Inventory = require("../model/inventory");

router.get("/",(req,res)=>{
    Promise.resolve(materialType.getAll()).then(function(types){
        Promise.resolve(Suppliers.getAll()).then(function(suppliers){
            res.render("inventory.hbs",{
                types:types,
                supplier:suppliers
            })
        })
    })
})

router.post("/addItem",(req,res)=>{
    let type = req.body.type
    let itemName = req.body.itemName
    let unit = req.body.unitOfMeasure
    let supplierID = req.body.supplier
    let cost = req.body.unitCost
    var empty = false
    var exist = false
    var count
    
    if(type === "" || itemName === "" || unit === "" || supplierID === "" || cost === "")
        empty = true;
    
    if(empty){
        res.render("inventory.hbs",{
            message:3
        })
    }
    else{
            Promise.resolve(materials.getAll()).then(function(values){
                count = values.length
                for(let i = 0; i < values.length; i++){
                    if((itemName.toLowerCase() === values[i].materialName.toLowerCase()) && (type == values[i].materialType) && (supplierID == values[i].supplierID) && cost == values[i].price)
                       exist = true;
                }
                if(exist){
                    res.render("inventory.hbs",{
                        message:1
                    })  
                }
                else{
                    Promise.resolve(materials.create(itemName,type,supplierID,cost)).then(function(value){
                        Promise.resolve(Inventory.create(count + 1,'0',new Date().toISOString().slice(0, 19).replace('T', ' '))).then(function(val){
                            res.render("inventory.hbs",{
                                message:2
                            }) 
                        })   
                    }) 
                }  
            })
        
      
    }
})

module.exports = router;