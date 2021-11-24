
/*start data base zoo*/

CREATE DATABASE db_zoo;

USE db_zoo;

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(30) NOT NULL
);

INSERT INTO tbl_animalia
	(animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;

SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arsthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;


UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT REPLACE(class_type, 'birds', 'bird') FROM tbl_class;

SELECT class_type FROM tbl_class WHERE class_type = 'bird';

SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL,
);

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '234-543-1234'),
	('mary', 'ann', '234-543-1234'),
	('text', 'burns', '234-543-1234'),
	('gerry', 'kerns', '234-543-1234'),
	('sally', 'fields', '234-543-1234')
;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'ke%';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_u%s';

UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';

SELECT * FROM tbl_persons;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone:'
	FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

DELETE FROM tbl_persons WHERE persons_lname = 'smith';

DROP TABLE tbl_persons;




CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL
);

CREATE TABLE tb1_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);

CREATE TABLE tb1_nutrition (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);

CREATE TABLE tb1_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);

CREATE TABLE tb1_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_order
	(order_type)
	VALUES 
	('carnivore'),
	('herbivore'),
	('omnivore')
;

SELECT * FROM tbl_order;

INSERT INTO tb1_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair o replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to excersice pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;

UPDATE tb1_care SET care_specialist=care_specialist+5000;

SELECT * FROM tb1_care;

INSERT INTO tb1_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruits and rice', 800),
	('warm bottle of milk', 600),
	('syringe fed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;

SELECT * FROM tb1_nutrition;

INSERT INTO tb1_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy knoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
	;

SELECT * FROM tb1_habitat;

INSERT INTO tb1_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('margaret', 'nguyen', '345-283-8321'),
	('mary', 'fischer', '342-212-1000'),
	('arnold', 'holden', '321-453-8956'),
	('kem', 'byesan', '328-500-3040'),
	('delmonte', 'fdeyo', '352-570-0810')
;

SELECT * FROM tb1_specialist;

CREATE TABLE tb1_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT  NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT  NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT  NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT  NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tb1_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT  NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tb1_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care varchar (50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tb1_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);
	
INSERT INTO tb1_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 102, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('brown bear', 1, 100, 3, 5001, 2205, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2205, 'care_0'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;

SELECT * FROM tb1_species;


SELECT * FROM tb1_species WHERE species_name = 'chicken';

SELECT
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tb1_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tb1_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tb1_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tb1_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'penguin'
;

SELECT 
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	FROM tb1_species a1
	INNER JOIN tb1_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tb1_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
;

DROP TABLE tb1_species, tbl_animalia, tb1_care, tbl_class, tb1_nutrition, tbl_order, tb1_specialist;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tb1_species)
	DROP TABLE tb1_species, tbl_animalia, tb1_care, tbl_class, tb1_nutrition, tbl_order, tb1_specialist;

PRINT 'Hello World!'

DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT 'Having fun with' + 'TSQL and MS SQL SERVER!'

PRINT 'I have ' + CONVERT(VARCHAR(50), @var1) + ' dollars...'


--ZOO DATABASE ASSIGNMENT 1

SELECT * FROM [dbo].[tb1_habitat];


--ZOO DATABASE ASSIGNMENT 2

SELECT [species_name],[species_order] FROM [dbo].[tb1_species] WHERE [species_order]=3;


--ZOO DATABASE ASSIGNMENT 3

SELECT [nutrition_type], [nutrition_cost] FROM [dbo].[tb1_nutrition] WHERE [nutrition_cost] <= 600;

--ZOO DATABASE ASSIGNMENT 4
SELECT * FROM [dbo].[tb1_nutrition];
SELECT * FROM [dbo].[tb1_species];
SELECT [species_name],[species_nutrition] AS Nutrition_id  FROM [dbo].[tb1_species]  WHERE [species_nutrition] BETWEEN 2202 AND 2206;

--ZOO DATABASE ASSIGNMENT 5

SELECT [species_name] AS 'Species Name', [nutrition_type] AS 'Nutrition Type' 
FROM 
[dbo].[tb1_species] a1 INNER JOIN  [dbo].[tb1_nutrition] a2 ON a2.[nutrition_id]=a1.[species_nutrition];

--ZOO DATABASE ASSIGNMENT 6
SELECT * from [dbo].[tb1_specialist];
SELECT * from [dbo].[tb1_care];
SELECT * from [dbo].[tb1_species];

SELECT [specialist_fname], [specialist_lname], [specialist_contact]
FROM
[dbo].[tb1_specialist] a1 
INNER JOIN [dbo].[tb1_care] a2 ON a2.[care_specialist]=a1.[specialist_id]
INNER JOIN [dbo].[tb1_species] a3 ON a3.[species_care]=a2.[care_id]
WHERE a3.species_name = 'penguin';