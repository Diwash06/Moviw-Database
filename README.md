**Project Description**
This project is designed to manage and analyze data related to movies, actors, directors, genres, and reviews. The database stores information such as movie titles, release years, ratings, and reviews, as well as the actors and directors associated with each movie. The system includes a range of features, such as:

Searching for movies based on genre, rating, or cast.
Fetching movie reviews for analysis.
Supporting case-insensitive searches through the use of SQL functions (UPPER(), LOWER()).
Using stored procedures for fetching high-rated movies or movies by specific criteria.
The project includes a well-structured relational database with tables for movies, actors, directors, genres, and reviews, and supports multiple relationships such as many-to-many between movies and actors or genres.

**Key Features**
Movies Table: Stores movie information like title, release year, and rating.
Actors and Directors Tables: Store information about actors and directors, respectively.
Reviews Table: Stores reviews for each movie, including reviewer name, review text, and rating.
Genres Table: Stores genre information, with many-to-many relationships between movies and genres.
Stored Procedures: For fetching high-rated movies, movies by genre, or by actor.
SQL Functions: Case-insensitive searches and formatting using UPPER() and LOWER().

**Conclusion**
This project provides a comprehensive solution for managing a movie database, allowing users to efficiently store and retrieve information about movies, actors, directors, genres, and reviews. By using SQL features like UPPER(), LOWER(), and stored procedures, the system supports advanced querying features, including case-insensitive searches and filtering based on various criteria such as ratings or cast.
The use of relational database management ensures that data is organized in a structured manner, and the many-to-many relationships between movies, actors, and genres add flexibility to the system. This project demonstrates how SQL, relational databases, and stored procedures can be leveraged to build efficient and scalable systems for data management.

