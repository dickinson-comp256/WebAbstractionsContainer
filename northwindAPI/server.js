// Create express app
var express = require("express")
var app = express()

// Connect to the sqlite database
var sqlite3 = require('sqlite3').verbose()
var md5 = require('md5')

const DBSOURCE = "/db/Northwind.db" 
let db = new sqlite3.Database(DBSOURCE, (err) => {
    if (err) {
      // Cannot open database
      console.error(err.message)
      throw err
    }else{
        console.log('Connected to the SQlite database.')
    }
})
        
// Start server
var HTTP_PORT = 8000 
app.listen(HTTP_PORT, () => {
    console.log("Server running on port %PORT%".replace("%PORT%",HTTP_PORT))
});


// Root endpoint
app.get("/", (req, res, next) => {
    res.json({
    	message:"Northwind API is up and Ok"
    })
});

// Insert other API endpoints here.

app.get("/test", (req, res, next) => {
    res.json({
       message: "The /test endpoint works!!"
    })
});

app.get("/customers", (req, res, next) => {
    var sql = "SELECT * FROM Customers;"
    var params = []
    db.all(sql, params, (err, rows) => {
        if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
        res.json({
            "message":"success",
            "data": rows
        })
      });
});

// Default response for any other request
app.use(function(req, res){
    res.status(404);
});
