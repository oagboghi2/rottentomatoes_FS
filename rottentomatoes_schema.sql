DROP DATABASE IF EXISTS rottentomatoes;
        CREATE DATABASE rottentomatoes;

\c rottentomatoes

DROP TABLE users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name  VARCHAR(100),
  email VARCHAR(100)
);


DROP TABLE series;
CREATE TABLE series(
  id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  released_year INTEGER,
  genre VARCHAR(100),
  editor_rating INTEGER,
  users_id INTEGER REFERENCES users(id)
);

DROP TABLE userRatings;
CREATE TABLE userRatings(
  id SERIAL PRIMARY KEY,
  users_id INTEGER REFERENCES users(id),
  series_id INTEGER REFERENCES series(id),
  purchases_id INTEGER REFERENCES purchases(id),
  user_reviews DECIMAL
);



DROP TABLE purchases;
CREATE TABLE purchases(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  released_year INTEGER,
  genre VARCHAR,
  price DECIMAL,
  users_id INTEGER REFERENCES users(id)
);

INSERT INTO users (first_name, last_name, email) VALUES
    ('Thomas', 'Stoneman','kmiller@rhyta.com'),
    ('Wyatt', 'Skaggs','other2wise@cuvox.de'),
    ('Kimbra', 'Masters', 'rthef@dayrep.com'),
    ('Domingo', 'Cortes','whjch@einrot.com'),
    ('Colt', 'Steele','alwex@fleckens.hu'),
    ('Pinkie', 'Petit', 'powergirl2@fleckens.hu'),
    ('Marlon', 'Crafford','weinste@superrito.com');

INSERT INTO series (title, released_year, genre, editor_rating) VALUES
    ('Archer', 2009, 'Animation',9),
    ('Arrested Development', 2003, 'Comedy',9),
    ('Bobs Burgers', 2011, 'Animation',8),
    ('Bojack Horseman', 2014, 'Animation',9),
    ('Breaking Bad', 2008, 'Drama',9),
    ('Curb Your Enthusiasm', 2000, 'Comedy',9),
    ('Fargo', 2014, 'Drama',8),
    ('Freaks and Geeks', 1999, 'Comedy',8),
    ('General Hospital', 1963, 'Drama',7),
    ('Halt and Catch Fire', 2014, 'Drama',9),
    ('Malcolm In The Middle', 2000, 'Comedy',7),
    ('Pushing Daisies', 2007, 'Comedy',8),
    ('Seinfeld', 1989, 'Comedy',9),
    ('Stranger Things', 2016, 'Drama',8);

INSERT INTO purchases (title, released_year, genre, price, users_id) VALUES
    ('Archer', 2009, 'Animation',9.99,6),
    ('Arrested Development', 2003, 'Comedy',19.99,2),
    ('Bobs Burgers', 2011, 'Animation',19.99,6),
    ('Bojack Horseman', 2014, 'Animation',19.99,6),
    ('Breaking Bad', 2008, 'Drama',39.99,3),
    ('Curb Your Enthusiasm', 2000, 'Comedy',39.99,5),
    ('Fargo', 2014, 'Drama',19.99,1),
    ('Freaks and Geeks', 1999, 'Comedy',19.99,4),
    ('General Hospital', 1963, 'Drama',29.99,1),
    ('Halt and Catch Fire', 2014, 'Drama',19.99,4),
    ('Malcolm In The Middle', 2000, 'Comedy',19.99,7),
    ('Pushing Daisies', 2007, 'Comedy',19.99,1),
    ('Seinfeld', 1989, 'Comedy',59.99,7),
    ('Stranger Things', 2016, 'Drama',19.99,3);

INSERT INTO userRatings (users_id, series_id, purchases_id, user_reviews) VALUES
   (1,1,1,8.6),
   (1,2,3,9.1),
   (2,3,4,7.6),
   (5,6,6,8.6),
   (3,7,2,9.8),
   (6,2,11,7.7),
   (6,14,12,8.1),
   (4,13,9,9.2),
   (2,11,6,7.6),
   (1,10,8,9.3),
   (2,13,13,8.7),
   (3,3,8,6.5),
   (4,8,1,8.7),
   (5,9,2,8.2);
