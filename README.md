## Manipuler une TABLE

Créer une table :

```sql
CREATE TABLE posts (
  title VARCHAR(150),
  content TEXT,
  category VARCHAR(50),
  created_at DATETIME
);
```

Supprimer une colonne :

```sql
ALTER TABLE posts DROP category;
```

Ajouter une colonne :

```sql
ALTER TABLE posts ADD category VARCHAR(50);
```

Modifier le nom d'une table ou d'une colonne :

```sql
ALTER TABLE posts RENAME TO contents;

ALTER TABLE posts RENAME COLUMN created_at TO createdAt;
```

Supprimer une table :

```sql
DROP TABLE posts;
```

## Manipuler des données


Insérer des données :

```sql
INSERT INTO recipes (
  title, 
  slug, 
  date, 
  duration
)
VALUES (
  'Salade de fruits',
  'salade-de-fruits',
  1607779237,
  30
);
```

Sélectionner des données :

[Voir la commande Select](./select-queries.sql)


Supprimer des données :

```sql
DELETE FROM recipes WHERE title = 'Takoyaki 1';

DELETE FROM recipes; -- Attention cette commande supprime la table
```

Mettre à jour des données :


```sql
UPDATE recipes SET title = 'Takoyaki 1'; -- Attention cette commande reset toute la table

UPDATE recipes SET title = 'Salade niçoise' WHERE title LIKE 'salade%';
```

## Clé primaire et index

Créer une clé primaire :

```sql
CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY, -- On peut ajouter la clé AUTOINCREMENT
); 
```

Créer un index :

Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

```sql
CREATE UNIQUE INDEX index_slug ON recipes (slug);
```

## NULL & DEFAULT


Contraindre une colonne à avoir une valeur :

```sql
CREATE TABLE posts (
  title VARCHAR(150) NOT NULL,
  content TEXT,
);
```

Valeur par défaut :

```sql
CREATE TABLE posts (
  title VARCHAR(150) NOT NULL UNIQUE, -- UNIQUE impose une contrainte d'unicité de la valeur
  size TEXT DEFAULT 10,
);
```

## Clé étrangère et jointure

Pour créer une clé étrangère

```sql
CREATE TABLE IF NOT EXISTS recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(150) NOT NULL,
    date DATETIME,
    duration INTEGER DEFAULT 0 NOT NULL,
    category_id INTEGER DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES category(id)
); 
```

Pour éviter d'avoir une table qui envoie un chiffre (en guise d'information sur la clé étrangère), la jointure résoud ce problème :

```sql
SELECT recipes.id, recipes.title, category.label -- On peut renommer le nom de la colonne (sympa pour être exploité dans un joli DTO)
FROM recipes -- On peut utiliser un alias pour éviter la répétition
JOIN category
ON recipes.category_id = category.id; -- On peut utiliser WHERE mais aprs le JOIN
```

`LEFT JOIN` : Inclus les résultat même sur l'élément de la jointure est NULL.

`INNER JOIN` / Ou bien `JOIN` : Exclus ... 

`RIGHT JOIN` fait la même chose que `LEFT JOIN` mais commence la requête par la droite.

`FULL JOIN` ...

### Contraintes de clé étrangère

Si on supprime une valeur lié à une autre table, que se passe t-il ?

Chose que l'on peut préciser via l'utilisation de `ON DELETE RESTRICT` :

```sql
-- ON DELETE RESTRICT : On empêche la suppression d'une clé étrangère si elle est renseignée dans un récipe

CREATE TABLE IF NOT EXISTS recipes (
    ...
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE RESTRICT
);

-- ON DELETE CASCADE : On efface chaque ligne qui dépendait de la clé étrangère qui a été supprimé

-- ON DELETE SET NULL : Comme son nom l'indique
```

## Agrégation des données

`COUNT`, `SUM` , `AVG` ...

```sql
SELECT GROUP_CONCAT(title, ' - ') as merged_recipes -- le ' - ' est identique au join en Javascript
FROM recipes;
```

#### GROUP BY

```sql
SELECT COUNT(id), duration
FROM recipes
GROUP BY duration;
```

Utiliser `HAVING` au lieu de `WHERE` :

```sql
SELECT COUNT(id), duration
FROM recipes
GROUP BY duration
HAVING duration < 40;
```

On peut aussi utiliser une jointure dans le `GROUP BY` :

```sql
SELECT c.label, COUNT(r.id) as recipe_number
FROM recipes r
JOIN category c
ON category_id = c.id
GROUP BY c.label;
```

Groupement multiple :

```sql
SELECT c.label, COUNT(r.id) as recipe_number, r.title
FROM recipes r
JOIN category c
ON category_id = c.id
GROUP BY c.label, r.title; -- On regroupe par label et par titre, ce qui va dupliquer certains label
```

## LIMIT & ORDER BY

```sql
ODER BY count ASC -- Ou bien DESC

-- On peut chainer les ORDER BY :

ODER BY count DESC, i.name ASC
```

Deux syntaxes pour `LIMIT` :

```sql
LIMIT 3 OFFSET 2;

LIMIT 2, 3;
```


## EXPLAIN QUERY PLAN

Commande qui explicite le processus par lequel chemine le langage.


```sql
```


```sql
```
