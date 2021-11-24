CREATE DATABASE db_Cinema;     /*create cinema data base*/

USE db_Cinema;                 /*allow use cinema data base*/

--start section for create table in data base CINEMA--

CREATE TABLE tbl_actors (                                     /*create the table actors*/
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),       /*asigning the primary key for actors*/
	actors_fname VARCHAR(30) NOT NULL,						/*asigning the actors first name column for actors*/
	actors_lname VARCHAR(30) NOT NULL,						/*asigning the actors last name column for actors*/
	actors_country VARCHAR(30) NOT NULL					     /*asigning the actors country column for actors*/
);

CREATE TABLE tbl_directors (									 /*create the table directors*/
	directors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),       /*asigning the primary key for directors*/
	directors_fname VARCHAR(30) NOT NULL,					   /*asigning the directors first name column for actors*/
	directors_lname VARCHAR(30) NOT NULL,						/*asigning the directors last name column for actors*/
	directors_country VARCHAR(30) NOT NULL					     /*asigning the directors country column for actors*/
);


CREATE TABLE tbl_generomovie (								 	  /*create the table generomovie*/
	genero_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),            /*asigning the primary key for genero movie*/
	genero_type VARCHAR(30) NOT NULL						      /*asigning the genero type column for table genero*/
);


CREATE TABLE tbl_movies (										 /*create the table movies*/
	movie_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),			/*asingning the primary key for movies*/
	movie_name VARCHAR(50) NOT NULL,                            /*asigning the movie name column for movies*/
	movie_year INT NOT NULL,                                    /*asigning the movie year column for movies*/
	movie_country VARCHAR(50) NOT NULL,							/*asigning the movie country column for movies*/
	movie_genero INT  NOT NULL CONSTRAINT fk_genero_id FOREIGN KEY REFERENCES tbl_generomovie(genero_id) ON UPDATE CASCADE ON DELETE CASCADE,     /*asigning the foreing key in table movies from the table genero (primary key)*/
	movie_director INT  NOT NULL CONSTRAINT fk_director_id FOREIGN KEY REFERENCES tbl_directors(directors_id) ON UPDATE CASCADE ON DELETE CASCADE /*asigning the foreing key in table movies from the table directors (primary key)*/
);

CREATE TABLE tbl_detailmovies (                                 /*create the table detailmovies*/
	detailmovie_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),     /*asingning the primary key for detailmovies (maybe no neccesary but I did it)*/
	detailmovie_movie INT  NOT NULL CONSTRAINT fk_detailmovie_id FOREIGN KEY REFERENCES tbl_movies(movie_id) ON UPDATE CASCADE ON DELETE CASCADE,   /*asigning the foreing key in table detailmovies from the table movies (primary key)*/
	detailmovie_actor INT  NOT NULL CONSTRAINT fk_detailmovieactor FOREIGN KEY REFERENCES tbl_actors(actors_id) ON UPDATE CASCADE ON DELETE CASCADE /*asigning the foreing key in table detailmovies from the table actors (primary key)*/
);

--end section for create table in data base CINEMA--


--start section for add vaules in the created tables in data base CINEMA--

INSERT INTO tbl_actors
	(actors_fname, actors_lname, actors_country)
	VALUES
	('manuela', 'velazco', 'espain'),
	('roberto', 'cobo', 'mexico'),
	('tom', 'cruise', 'estados unidos'),
	('hector', 'babenco', 'brazil'),
	('emily', 'blunt', 'england')
;

INSERT INTO tbl_directors
	(directors_fname, directors_lname, directors_country)
	VALUES
	('jaume', 'balanguero', 'Espain'),
	('luis', 'bunuel', 'Espain'),
	('christopher', 'mcquarrie', 'estados unidos'),
	('carlos', 'vasconcelos', 'brazil'),
	('rodrigo', 'santoro', 'brazil')
;


INSERT INTO tbl_generomovie
	(genero_type)
	VALUES
	('drama'),
	('terror'),
	('fiction'),
	('aventure'),
	('action')
;

INSERT INTO tbl_movies
	(movie_name, movie_year, movie_country, movie_genero, movie_director)
	VALUES
	('los olvidados', '1952', 'mexico', 1, 2),
	('rec', '2007', 'espain', 2, 1),
	('jack reacher', '2012', 'estados unidos', 5, 3),
	('carandiru', '2003', 'brazil', 1, 5),
	('edge of tommorrow', '2014', 'estados unidos', 5, 3)
;
--end section for add vaules in the created tables in data base CINEMA--

--start query relation between difents tables-- 
SELECT A1.movie_name, A1.movie_year, A1.movie_country, A2.genero_type, A3.directors_fname,  A3.directors_lname  /*select the columns to show*/
FROM 
[dbo].[tbl_movies] A1                                                                    /*select the main table movies to show*/
INNER JOIN [dbo].[tbl_generomovie] A2 ON A2.genero_id=A1.movie_genero			  		 /*combine the values from table genero movie into table main table*/	
INNER JOIN [dbo].[tbl_directors] A3 ON A3.directors_id=A1.movie_director                 /*combine the values from table directors into the main table*/
;
