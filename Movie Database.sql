Create Database Movie_database;
use Movie_database;
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);
INSERT INTO Genres (genre_name) VALUES ('Action'), ('Comedy'), ('Drama'),('Romantic');

CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);
INSERT INTO Directors (first_name, last_name) VALUES ('Lokesh', 'Kanagaraj'), ('Mani', 'Ratnam');

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    rating DECIMAL(8,2),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);
INSERT INTO Movies (title, release_year, rating, director_id) 
VALUES ('family', 2010, 8.8, 1), ('Drama', 2003, 8.1, 2),('Action',2020,7.4,1);

CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);
INSERT INTO Actors (first_name, last_name) VALUES ('Kamal', 'Hassan'), ('Ajith', 'Kumar'), ('Jayam', 'Ravi'), ('silambarasan', 'TR');
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    reviewer_name VARCHAR(255),
    review_text TEXT,
    rating INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
INSERT INTO Reviews(movie_id,reviewer_name,review_text,rating)values
(1,'Diwash','Excellent,wow!',80),
(2,'Naresh','Thrilling Movie',60),
(3,'Mohan','Nice family movie',50);

CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);
INSERT INTO Movie_Actors (movie_id, actor_id) 
VALUES (1, 1), (1, 2), (2, 3), (2, 4);

CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
INSERT INTO Movie_Genres (movie_id, genre_id) 
VALUES (1, 1), (2, 1), (2, 2);

SELECT*FROM Genres;
SELECT*FROM Movies;
SELECT*FROM Directors;
SELECT*FROM Actors;
SELECT*FROM Reviews;
SELECT*FROM Moview_genres;
SELECT*FROM Movie_Actors;

SELECT m.title, m.release_year, m.rating
FROM Movies m
JOIN Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
WHERE g.genre_name = 'Action';

SELECT title, release_year, rating
FROM Movies
WHERE rating > 8.0;

SELECT m.title, m.release_year, m.rating
FROM Movies m
JOIN Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
WHERE g.genre_name IN ('Action', 'Comedy')
GROUP BY m.movie_id
HAVING COUNT(DISTINCT g.genre_name) = 2;

DELIMITER //

CREATE PROCEDURE GetHighRatedMovies(IN min_rating DECIMAL(8,2))
DELIMITER&&
BEGIN
    SELECT m.movie_id, m.title, m.release_year, m.rating
    FROM Movies m
    INNER JOIN Reviews r ON m.movie_id = r.movie_id
    WHERE r.rating > min_rating;
    DELIMITER;
    END&&
DELIMITER ;

SELECT ucase(title) from Movies;
SELECT lcase(title) from Movies;

