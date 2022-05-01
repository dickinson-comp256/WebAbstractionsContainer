// Create an express app
var express = require('express')
var cors = require('cors')
var app = express()
app.use(cors())
app.listen(8000);

// Connect to the sqlite database
var sqlite3 = require('sqlite3').verbose()
let db = new sqlite3.Database("/db/Northwind.db");

// Functions for each API endpoints are below.

app.get("/sample", (req, res) => {
    courseData = {
       message: "Just Some Sample Data",
       semester: "Spring 2022",
       classList: [
         {
           class: "COMP 256",
           time: "MWF 8:30"
         },
         {
           class: "COMP 492",
           time: "TF 1:30"
         }
       ]
    };

    res.json(courseData);
});

app.get("/customers/bycountry", (req, res) => {
    var country = req.query.country;

    var sql = "SELECT CompanyName " +
              "FROM Customers " +
              "WHERE Country='" + country + "';";

    db.all(sql, [], (err, rows) => {
      if (err != null) {
        console.log("ERROR: " + err);
      }
      else {
        customerData = {
          name: "Customers by Country",
          country: country,
          count: rows.length,
          data: rows
        }

        res.json(customerData);
      }
    });
});


// Default response for any endpoint other than those handled above.
app.use(function(req, res){
    res.status(404);  // Not Found.
});
