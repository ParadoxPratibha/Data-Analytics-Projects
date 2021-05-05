
-- =================================================
--   General SQL Queries 01
-- =================================================

-- The database used for these set of questions 
-- contains the following 3 tables: 
--
-- persons (person_id, first_name, last_name, 
--          gender, birth_date, street, town, 
--          county)
-- likes (person_id, food)
-- knows (person_id, friend_id)

-- =================================================
-- List the names (first and last) of all those 
-- whose first or last name contains the letter ‘r’ 
-- (lowercase only).
-- -------------------------------------------------

SELECT first_name, last_name
FROM persons
WHERE first_name LIKE '%r%' OR last_name LIKE '%r%';

-- =================================================
-- List for each county the number of individuals 
-- who hail from that county. List the results 
-- alphabetically by county.
-- -------------------------------------------------

SELECT county, COUNT(*)
FROM persons
GROUP BY county
ORDER BY COUNT(*) DESC;

-- =================================================
-- List the names of all individuals who like a 
-- food that contains the letter ’e’ (lowercase 
-- only). Each name should appear at most once
-- -------------------------------------------------

SELECT DISTINCT first_name, last_name
FROM persons JOIN likes
ON persons.person_id = likes.person_id
WHERE likes.food LIKE '%e%';

-- =================================================
-- List the names of all those individuals who know 
-- Aoife Ahern.
-- NOTE: Assuming and a person doesn't know 
-- themselves unless stated in the knows TABLE
-- -------------------------------------------------

SELECT DISTINCT P.first_name, P.last_name
FROM persons AS P JOIN knows AS K 
ON P.person_id = K.person_id
WHERE K.friend_id = (SELECT person_id
                        FROM persons
                        WHERE first_name = 'Aoife' AND last_name = 'Ahern');

-- =================================================
-- List the names of all those individuals who do 
-- not know Aoife Ahern.
-- -------------------------------------------------

SELECT first_name, last_name
FROM persons
WHERE person_id IN (SELECT person_id
                    FROM persons

                    EXCEPT

                    SELECT P.person_id
                    FROM persons AS P JOIN knows AS K 
                    ON P.person_id = K.person_id
                    WHERE K.friend_id = (SELECT person_id
                                        FROM persons
                                        WHERE first_name = 'Aoife' AND last_name = 'Ahern')
                    );

-- =================================================
-- List the names of all those individuals who know 
-- both Aoife Ahern and Declan Duffy.
-- -------------------------------------------------

SELECT P.first_name, P.last_name
FROM persons AS P JOIN knows AS K1 JOIN knows AS K2
ON P.person_id = K1.person_id AND K1.person_id = K2.person_id
WHERE K1.friend_id = (SELECT person_id
                     FROM persons
                     WHERE first_name = 'Aoife' AND last_name = 'Ahern')
                     AND
    K2.friend_id = (SELECT person_id
                     FROM persons
                     WHERE first_name = 'Declan' AND last_name = 'Duffy');

-- =================================================
-- List the names of the youngest and oldest 
-- individuals. In the event of a tie, list at least 
-- one of the youngest/oldest.
-- -------------------------------------------------

SELECT first_name, last_name
FROM persons
WHERE birth_date = (SELECT MIN(birth_Date)
                    FROM persons
                )

UNION

SELECT first_name, last_name
FROM persons
WHERE birth_date = (SELECT MAX(birth_Date)
                    FROM persons
                );

-- =================================================
-- List in descending order of popularity all the 
-- foods liked by people from the town Cork.
-- -------------------------------------------------

SELECT L.food, COUNT(*)
FROM persons AS P JOIN likes AS L
ON P.person_id = L.person_id
WHERE P.town = 'Cork'
GROUP BY L.food
ORDER BY COUNT(*) DESC;
