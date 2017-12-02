const express = require('express');
const bodyParser = require('body-parser');
const app = express();

const ejs = require('ejs');
app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

const mainRoutes = require('./routes.js');

app.get('/', (req,res,next)=>{
  res.send("Working")
})


app.listen(3000, function(){
  console.log("The backend is in another castle");
})
