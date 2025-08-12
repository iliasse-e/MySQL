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

```
ALTER TABLE posts DROP category;
```

Ajouter une colonne :

```
ALTER TABLE posts ADD category VARCHAR(50);
```

Modifier le nom d'une table ou d'une colonne :

```
ALTER TABLE posts RENAME TO contents;

ALTER TABLE posts RENAME COLUMN created_at TO createdAt;
```

Supprimer une table :

```
DROP TABLE posts;
```

## Manipuler des données


```
```


```
```
