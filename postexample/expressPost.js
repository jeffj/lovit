var express = require('express')
var app = express(),
	fs= require('fs'),
	html;

//app.use(express.bodyParser({ keepExtensions: true, uploadDir: "./uploads" }));                     

fs.readFile('form.html', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  html=data
});
app.get('/', function (req, res) {

  res.send(html)

})
app.post('/', function (req, res) {

 var ctype = req.get("content-type"); //2
    var ext = ctype.substr(ctype.indexOf('/')+1); //3
  console.log(req.params.id)
	  console.log(ctype, ext)


  var filePath ="./uploads/"+Math.random()+".png"

   var writable = fs.createWriteStream(filePath); //7
   req.pipe(writable); //8
   req.on('end', function (){ //9
    console.log("end")
     res.send(201,{'_id':"2"});
   });  

  // res.send({
  // 	success:true
  // })
})


var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)

})