const express = require("express");
const router = express.Router();

const materials = require("../model/materials")
const materialType = require("../model/materials_types")
const Clients = require("../model/clients")
const Suppliers = require("../model/suppliers");
const Inventory = require("../model/inventory");
const Releases = require("../model/stockman_requests")

function titleCase(str) {
   var splitStr = str.toLowerCase().split(' ');
   for (var i = 0; i < splitStr.length; i++) {
       splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);     
   }
   return splitStr.join(' '); 
}

router.get("/",(req,res)=>{
    Promise.resolve(materialType.getAll()).then(function(types){
        Promise.resolve(Suppliers.getAll()).then(function(suppliers){
            Promise.resolve(Inventory.getAllTableView()).then(function(inventory){
                Promise.resolve(Inventory.getAllMeasurements()).then(function(units){
                    Promise.resolve(materials.getAllWithSupplier()).then(function(items){
                        Promise.resolve(Releases.getYears()).then(function(years){
                            if (years != ''){
                                Promise.resolve(Releases.getReleased(1,years[0].years)).then(function(released){
                                    res.render("inventory.hbs",{
                                        types:types,
                                        supplier:suppliers,
                                        inventory:inventory,
                                        unit:units,
                                        items:items,
                                        years:years,
                                        released:released,
                                        userType:req.session.userType,
                                        firstName: req.session.firstName,
                                        lastName :req.session.lastName,
                                        currEmail: req.session.email,
                                        currType: req.session.type,
                                        password: req.session.password
                                    })
                                })
                            }
                            else{
                                res.render("inventory.hbs",{
                                    types:types,
                                    supplier:suppliers,
                                    inventory:inventory,
                                    unit:units,
                                    items:items,
                                    years:years,
                                    userType:req.session.userType,
                                    firstName: req.session.firstName,
                                    lastName :req.session.lastName,
                                    currEmail: req.session.email,
                                    currType: req.session.type,
                                    password: req.session.password
                                })
                            }
                        })
                    })
                })
            })
        })
    })
})

router.post("/addItem",(req,res)=>{
    let type = req.body.type
    let itemName = req.body.itemName
    let supplierID = req.body.supplier
    let unit = req.body.unit
    
    var empty = false
    var exist = false
    
    if(type === "" || itemName === "" || unit === "" || supplierID === "")
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
                    Promise.resolve(materials.create(itemName,type,supplierID,unit)).then(function(value){        
                        res.render("inventory.hbs",{
                            message:2
                        }) 
                    }) 
                }  
            })
        
      
    }
})

router.post("/addMaterial",async (req,res)=>{
    let material = req.body.materialName.trim()
    var empty = false
    var exist = false
    if(material === "")
        empty = true;
    
    if(empty){
        res.render("inventory.hbs",{
            message:3
        })
    }
    else{
        await Promise.resolve(materialType.getAll()).then(function(value){
            for(let i = 0; i < value.length; i++){
                if(material.toLowerCase() === value[i].type.toLowerCase())
                    exist = true
            }
        })
        if(exist){
            res.render("inventory.hbs",{
                    message:5
            })
        }
        else{
            material = titleCase(material)
            Promise.resolve(materialType.create(material)).then(function(value){
                res.render("inventory.hbs",{
                    message:4
                }) 
            })  
        }
    }
})


router.post("/editMaterial",(req,res)=>{
    let currItem = req.body.currItem
    let newType = req.body.newType
    let newName = req.body.newName
    let newUnit = req.body.newUnit
    let newSupplier = req.body.newSupplier
    var empty = false
    if(newName === "")
        empty = true
    
    if(empty){
        res.render("inventory.hbs",{
            message:3
        })
    }
    else{
        Promise.resolve(materials.edit(currItem,newName,newType,newSupplier)).then(function(data){
            res.render("inventory.hbs",{
                message:7
            })
        })
    }
    
})


router.post("/editMaterialType",async (req,res)=>{
    let currType = req.body.currType
    let newType = req.body.newType.trim()
    var empty = false
    var exist = false
    if(newType === "")
        empty = true
    
    await Promise.resolve(materialType.getAll()).then(function(data){
        for(let i = 0; i < data.length; i++){
            if(newType.toLowerCase() === data[i].type.toLowerCase()){
                if(currType != data[i].mtID)
                    exist = true
            }
        }
    })
    
    if(empty){
        res.render("inventory.hbs",{
            message:3
        })
    }
    else if(exist){
        res.render("inventory.hbs",{
            message:5
        })
    }
    else{
        newType = titleCase(newType)
        Promise.resolve(materialType.edit(currType,newType)).then(function(data){
            res.render("inventory.hbs",{
                message:6
            })
        })
    }
        
})

router.post("/getReleased",(req,res)=>{
    let month = req.body.month
    let year = req.body.year

    if(month == 13){
        Promise.resolve(Releases.getReleasedAllMonth(year)).then(function(data){
            res.send(data)
        })
    }
    else{
        Promise.resolve(Releases.getReleased(month,year)).then(function(data){
            res.send(data)
        })
    }
})

module.exports = router;