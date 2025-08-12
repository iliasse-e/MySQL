## 

SHOW databases;

USE movies;

SHOW tables;

SELECT * FROM movie LIMIT 5, 5; -- LIMIT is good for pagination

SELECT title, popularity FROM movie WHERE budget < 2000000; -- 

SELECT nom, ville FROM utilisateurs WHERE age >= 18 AND ville = 'Paris'; -- using AND, OR, NOT

SELECT * FROM produits WHERE prix BETWEEN 10 AND 20; -- BETWEEN min AND max

SELECT * FROM employes WHERE (departement = 'Ventes' OR departement = 'IT') AND salaire > 3000; -- Using () is crucial to respect an order


-- LIKE est différent du = , il permet d'ouvrir une recherche plus large (il est indifferent à la majuscule/minuscule)

SELECT * FROM movie WHERE title LIKE 'a%'; -- Starts with 'a'

SELECT * FROM movie WHERE title LIKE '%a'; -- End with 'a'

SELECT * FROM movie WHERE title LIKE '%a%' -- Contains 

SELECT * FROM movie WHERE title LIKE 'a%s' -- Starts with 'a' ends with 's'
  

-- IN

SELECT title FROM recipes WHERE title IN ('Harira', 'Salade de fruits'); -- Plusieurs données

  
-- Arithmetics operators & alias

  
SELECT prix + taxe AS prix_total FROM produits; -- Alias d'une opération

SELECT *, (revenue - budget) AS profit FROM movie; -- Ajoute une colonne profit

SELECT title, (revenue - budget) AS profit FROM movie WHERE (revenue - budget) < 0; -- On doit répéter l'opération dans le WHERE


-- REGEX

SELECT nom FROM employes WHERE nom REGEXP '^A';


-- NOT

SELECT * FROM country WHERE NOT country_name = "Austria";


-----------------------------
-- SQL Aggregate Functions --
-----------------------------

-- MAX() & MIN()

SELECT MAX(popularity) FROM movie; -- Get Maximum of a column
