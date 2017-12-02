const express = require('express');
const pgp = require('pg-promise')();
const db = require('./db.js');
const router = express.Router();



router.get('/api/rottentomatoes/:arg', db.getSeries);
router.get('/api/rottentomatoes/all', db.getAllSeries);
router.get('/api/rottentomatoes', db.getASeries);


module.exports = router;
