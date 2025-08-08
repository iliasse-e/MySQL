## 

SHOW databases;

USE movies;

SHOW tables;

SELECT * FROM movie LIMIT 5, 5; -- LIMIT is good for pagination

SELECT title, popularity FROM movie WHERE budget < 2000000; -- 

SELECT nom, ville FROM utilisateurs WHERE age >= 18 AND ville = 'Paris'; -- using AND, OR, NOT

SELECT * FROM produits WHERE prix BETWEEN 10 AND 20; -- BETWEEN min AND max

SELECT * FROM employes WHERE (departement = 'Ventes' OR departement = 'IT') AND salaire > 3000; -- Using () is crucial to respect an order

SELECT * FROM movie WHERE title LIKE 'a%'; -- Starts with 'a'

SELECT * FROM movie WHERE title LIKE '%a'; -- End with 'a'

SELECT * FROM movie WHERE title LIKE '%a%' -- Contains 

SELECT * FROM movie WHERE title LIKE 'a%s' -- Starts with 'a' ends with 's'
