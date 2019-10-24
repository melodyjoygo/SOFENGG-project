const express = require("express");
const router = express.Router();

const Clients = require("../model/clients")

function titleCase(str) {
   var splitStr = str.toLowerCase().split(' ');
   for (var i = 0; i < splitStr.length; i++) {
       splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);     
   }
   return splitStr.join(' '); 
}

router.get("/",(req,res)=>{
    res.render("clients.hbs")
})

router.post("/add",(req,res)=>{
    let client = req.body.clientname
    var exist = false;
    var empty = false;
    
    if(client === "")
        empty = true
    
    if(empty){
        res.render("clients.hbs",{
                    message:3
                }) 
    }
    else{
        Promise.resolve(Clients.getAll()).then(function(value){
            for(let i = 0; i < value.length; i++){
                if(client.toLowerCase() === value[i].clientName.toLowerCase()){
                    exist = true
                }
            }
            if(exist){
                res.render("clients.hbs",{
                    message:1
                })
            }
            else{
                client = titleCase(client)
                Promise.resolve(Clients.create(client)).then(function(value){
                    res.render("clients.hbs",{
                        message:2
                    })
                })
            }
        })  
    }
})

module.exports = router;