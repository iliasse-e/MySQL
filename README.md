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

```sql
```



```sql
```



```sql
```

## EXPLAIN QUERY PLAN
