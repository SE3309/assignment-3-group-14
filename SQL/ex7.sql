CREATE VIEW originalUserSelectedRecipes(username, recipeID)
AS SELECT u.username, u.recipeID
FROM userSavedRecipes u
WHERE u.username > 'user_20';

select * from originalUserSelectedRecipes;

INSERT INTO userSavedRecipes (
	username,
    recipeID
) VALUES(
	'user_4',
    567
);

select * from originalUserSelectedRecipes;

CREATE VIEW allHealthyIngredients(ingredientName, ingredientID)
AS SELECT i.name, i.ingredientID
FROM ingredients i
WHERE i.foodGroup = 'Healthy'
ORDER BY name;

SELECT * FROM allHealthyIngredients;

INSERT INTO ingredients (
	ingredientID,
    foodGroup,
    name
) VALUES(
	10246,
	'Healthy',
    'ingredient_8'
);
SELECT * FROM allHealthyIngredients;