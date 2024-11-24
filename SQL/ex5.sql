SELECT * FROM recipes WHERE name = 'Pasta';

SELECT r.recipeID, r.name, a.username
FROM recipes r
JOIN author a ON r.recipeID = a.recipeID;

SELECT recipeID, AVG(rating) AS average_rating
FROM ratings
GROUP BY recipeID;

SELECT DISTINCT recipeID
FROM userSavedRecipes
WHERE username IN (
    SELECT username
    FROM userSavedRecipes
    WHERE recipeID = 101
);

SELECT r.recipeID, r.name
FROM recipes r
WHERE EXISTS (
    SELECT 1
    FROM recipeIngredients ri
    JOIN ingredients i ON ri.ingredientID = i.ingredientID
    WHERE ri.recipeID = r.recipeID AND i.foodGroup = 'Vegetables'
);

SELECT recipeID, COUNT(*) AS tag_count
FROM recipeTags
GROUP BY recipeID
HAVING COUNT(*) > 3;

SELECT r.recipeID, r.name, a.username, i.name AS ingredient_name
FROM recipes r
JOIN author a ON r.recipeID = a.recipeID
JOIN recipeIngredients ri ON r.recipeID = ri.recipeID
JOIN ingredients i ON ri.ingredientID = i.ingredientID
WHERE r.recipeID IN (
    SELECT recipeID
    FROM ratings
    WHERE rating > 4
);