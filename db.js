const pgp = require('pg-promise')();
const connectionString = 'postgres://localhost:5432/rottentomatoes';
const db = pgp(connectionString);
var entry = process.argv[2]

function getSeries(req,res,next){
  var arg = req.params.arg;
  db.any(`SELECT userRatings.id, series.title, user_reviews FROM series JOIN userratings ON series.id = userratings.users_id WHERE series.title = $1
    AND user_reviews <= 9.2;`, arg)
  .then(function(data){
    res.status(200).json({
      status: 'success',
      data: data
    });
    return data;
  });
}

function getASeries(req,res,next){
  db.any(`SELECT title, editor_ratings AS "Editor Rating" FROM series WHERE title = $1`, entry)
  .then(function(data){
    console.log(data);
    return data;
  });
}

function getAllSeries(req,res,next){
  db.any(`SELECT * FROM series`)
  .then(function(data){
    res.status(200).json({
      status: 'success',
      data: data
    });
    console.log(data);
    return data;
  });
}

module.exports = {getSeries, getAllSeries, getASeries}
