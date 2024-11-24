-- adds a highly rated tag to recipes that are rated above 3 stars
UPDATE recipeTags
SET tag1 = 'Highly Rated'
WHERE recipeID IN (
    SELECT recipeID
    FROM ratings
    GROUP BY recipeID
    HAVING AVG(rating) > 3
);

-- deletes a user's saved searches
DELETE FROM userSavedSearches
WHERE username = 'sample_user';

-- adds the first five search results with vegetarian tag to a users saved searches
INSERT INTO userSavedSearches (username, search)
SELECT 'user123', CONCAT('RecipeID: ', recipeID, ', Name: ', name)
FROM recipes r
JOIN recipeTags rt ON r.recipeID = rt.recipeID
WHERE 'Vegetarian' IN (rt.tag1, rt.tag2, rt.tag3, rt.tag4, rt.tag5)
LIMIT 5;
