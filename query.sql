## 

SHOW databases;

USE movies;

SHOW tables;

SELECT * FROM movie LIMIT 5, 5; -- LIMIT is good for pagination

SELECT title, popularity FROM movie WHERE budget < 2000000; -- 

SELECT nom, ville FROM utilisateurs WHERE age >= 18 AND ville = 'Paris'; -- using AND, OR, NOT

SELECT * FROM produits WHERE prix BETWEEN 10 AND 20; -- BETWEEN min AND max
