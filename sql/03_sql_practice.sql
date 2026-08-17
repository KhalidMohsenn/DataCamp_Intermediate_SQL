-- Following Course Material For Practice
-- COUNT and DISTINCT
SELECT COUNT (birthdate) AS count_birthdates FROM people;

SELECT COUNT(name) AS count_name, COUNT(birthdate) AS count_birthdates 
FROM people;

SELECT COUNT(*) AS total_records
FROM people;

SELECT DISTINCT language
FROM films;

SELECT COUNT(DISTINCT birthdate) AS count_distinct_birthdates
FROM people;

SELECT COUNT(film_id) AS count_film_id
FROM reviews;

SELECT COUNT(*) AS count_records 
FROM people

SELECT COUNT(birthdate) AS count_birthdate
FROM people;

SELECT COUNT(language) AS count_languages,COUNT(country) AS count_countries
FROM films;

SELECT DISTINCT country FROM films

SELECT COUNT(DISTINCT country) AS count_distinct_countries FROM films
-----------------------------------------------------------------------------------------------------------------------
-- Formating
SELECT person_id, role 
FROM roles 
LIMIT 10;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Filtering Numbers
SELECT title 
FROM films
WHERE release_year > 1960;

SELECT title 
FROM films
WHERE release_year < 1960;

SELECT title 
FROM films
WHERE release_year <= 1960;

SELECT title 
FROM films
WHERE release_year = 1960;

SELECT title 
FROM films
WHERE release_year <> 1960;

SELECT title 
FROM films
WHERE country='Japan';

SELECT film_id,imdb_score
FROM reviews
WHERE imdb_score>7.0;

SELECT film_id,facebook_likes
FROM reviews
WHERE facebook_likes<1000;
LIMIT 10;

SELECT COUNT(num_votes) as films_over_100K_votes
FROM reviews
WHERE num_votes>=100000;

SELECT COUNT(language) AS count_spanish
FROM films
WHERE language ='Spanish';
-----------------------------------------------------------------------------------------------------------------------
-- Multiple Criteria
--(SELECT *
--FROM coats 
--WHERE color='yellow' OR length='short';)

--(SELECT * 
--FROM coats
--WHERE color='yellow' AND length='short';)

--(SELECT *
--FROM coats
--WHERE buttons BETWEEN 1 AND 5;)

SELECT title
FROM films
WHERE release_year=1994 OR 
	release_year=2000;

SELECT title
FROM films
WHERE release_year>1994 AND 
	release_year<2000;

SELECT title
FROM films
WHERE (release_year=1994 OR release_year=2000)
	AND (certification='PG' OR certification='R');

SELECT title
FROM films
WHERE release_year>=1994 AND 
	release_year<=2000;

SELECT title
FROM films
WHERE release_year
	BETWEEN 1994 AND 2000;

SELECT title
FROM films
WHERE release_year
	BETWEEN 1994 AND 2000 AND country= 'UK';

SELECT title , release_year
FROM films
WHERE language='German' AND release_year<2000;

SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';

SELECT *
FROM films
WHERE release_year> 2000 AND release_year<2010
    AND language='German';

SELECT title , release_year
FROM films
WHERE release_year=1990 OR release_year=1999;

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language='Spanish' OR language='English');

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
	AND (gross>2000000);

SELECT title, release_year
FROM films
WHERE release_year 
    BETWEEN 1990 AND 2000;

SELECT title, release_year
FROM films
WHERE release_year 
	BETWEEN 1990 AND 2000 AND (budget > 100000000);

SELECT title, release_year
FROM films
WHERE release_year 
	BETWEEN 1990 AND 2000 
	AND (budget > 100000000)
	AND (language='Spanish');

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	AND (language='Spanish' OR language='French');
-----------------------------------------------------------------------------------------------------------------------
-- Filtering Text (LIKE | NOT LIKE | IN) (% | _)
SELECT name 
FROM people
WHERE name LIKE 'Ad%';

SELECT name
FROM people
WHERE name LIKE 'Ev_';

SELECT name
FROM people
WHERE name NOT LIKE 'A.%';

SELECT name 
FROM people
WHERE name LIKE '%r';

SELECT name 
FROM people
WHERE name LIKE '__t%';

SELECT title
FROM films
WHERE release_year = 1920
OR release_year = 1930
OR release_year = 1940;

SELECT title
FROM films
WHERE release_year IN (1920,1930,1940);

SELECT title
FROM films
WHERE country IN ('Germany','France');

SELECT name 
FROM people
WHERE name LIKE 'B%';

SELECT name
FROM people
WHERE name LIKE '_r%';

SELECT name
FROM people
WHERE name NOT LIKE 'A%';

SELECT title,release_year
FROM films
WHERE release_year IN (1990,2000)
AND duration>120;

SELECT title, language
FROM films
WHERE language IN ('English','Spanish','French');

SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17','R')
    AND language IN('English','Italian','Greek');

SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English'
	AND certification IN ('G','PG','PG-13');
-----------------------------------------------------------------------------------------------------------------------
-- Null Values
SELECT * 
FROM people;

SELECT name
FROM people
WHERE birthdate IS NULL;

SELECT COUNT (*) AS no_birthdates
FROM people
WHERE birthdate IS NULL;

SELECT COUNT (name) AS count_birthdates
FROM people
WHERE birthdate IS NOT NULL;

SELECT COUNT (certification) AS count_certification
FROM films;

SELECT COUNT (certification) AS count_certification
FROM films
WHERE certification IS NOT NULL;

SELECT title AS no_budget_info
FROM films 
WHERE budget IS NULL;

SELECT COUNT (*) AS count_language_known
FROM films
WHERE language IS NOT NULL;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Aggregate Functions (AVG | SUM | MIN | MAX | COUNT)
-- Summarizing data
SELECT AVG(budget)
FROM films;

SELECT SUM(budget)
FROM films;

SELECT MIN(budget)
FROM films;

SELECT MAX(budget)
FROM films;

-- AVG and SUM only numeric fields    ||     COUNT, MIN and MAX for various data types
SELECT MIN(country) AS min_country
FROM films;

SELECT MAX(country) AS max_country
FROM films;

SELECT SUM(duration) AS total_duration
FROM films;

SELECT AVG(duration) AS average_duration
FROM films;

SELECT MAX(release_year) as latest_year
FROM films;

SELECT MIN(duration) AS shortest_film
FROM films;
-----------------------------------------------------------------------------------------------------------------------
-- Summarizing subsets
SELECT AVG(budget) AS avg_budget
FROM films
WHERE release_year>=2010;

SELECT SUM (budget) AS sum_budget
FROM films
WHERE release_year=2010;

SELECT MIN(budget) AS min_budget
FROM films
WHERE release_year=2010;

SELECT MAX(budget) AS max_budget
FROM films
WHERE release_year=2010;

SELECT COUNT(budget) AS count_budget
FROM films
WHERE release_year=2010;

--ROUND( number_to_round, decimal_place)
SELECT AVG(budget) AS avg_budget
FROM films
WHERE release_year>=2010;

SELECT ROUND(AVG(budget),2) AS avg_budget
FROM films
WHERE release_year>=2010;

SELECT ROUND(AVG(budget)) AS avg_budget
FROM films
WHERE release_year>=2010;

SELECT ROUND(AVG(budget),-2) AS avg_budget
FROM films
WHERE release_year>=2010;

SELECT SUM(gross) as total_gross
FROM films
WHERE release_year >=2000;

SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%';

SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year=1994;

SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

SELECT ROUND(AVG(facebook_likes),1) AS avg_facebook_likes
FROM reviews;

SELECT ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM films;

-----------------------------------------------------------------------------------------------------------------------
-- Aliasing and Arithmetic (+,-,* and /)
SELECT (gross-budget) AS profit
FROM films;

SELECT title, (duration/60.0) AS duration_hours
FROM films;

SELECT  COUNT(deathdate)* 100.0 / COUNT(*) AS percentage_dead
FROM people;

SELECT (MAX(release_year)-MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

SELECT title, ROUND(duration / 60.0,2) AS duration_hours
FROM films;
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Sorting and Grouping
-- Sorting results
SELECT title, budget
FROM films
ORDER BY budget;

SELECT title, budget
FROM films
ORDER BY title;

SELECT title, budget
FROM films
ORDER BY budget ASC;

SELECT title, budget
FROM films
ORDER BY budget DESC;

SELECT title, budget
FROM films
WHERE budget IS NOT NULL
ORDER BY budget DESC;

SELECT title,
FROM films
ORDER BY release_year;

SELECT title,release_year
FROM films
ORDER BY release_year;

SELECT birthdate,name
FROM people
ORDER BY birthdate, name DESC;

SELECT name 
FROM people
ORDER BY name;

SELECT title,duration
FROM films
ORDER BY duration DESC;

SELECT release_year,duration,title
FROM films
ORDER BY release_year,duration;

SELECT certification,release_year,title
FROM films
ORDER BY certification,release_year DESC;
-----------------------------------------------------------------------------------------------------------------------
-- Grouping data
SELECT certification, COUNT(title) AS title_count
FROM films
GROUP BY certification;

SELECT certification, language, COUNT(title) AS title_count
FROM films
GROUP BY certification, language;

SELECT certification, COUNT(title) AS title_count
FROM films
GROUP BY certification
ORDER BY title_count DESC;

SELECT release_year,COUNT(title) AS film_count
FROM films
GROUP BY release_year;

SELECT release_year,AVG(duration) AS avg_duration
FROM films
GROUP BY release_year;

SELECT release_year,country,MAX(budget) AS max_budget
FROM films
GROUP BY release_year,country
ORDER BY release_year,country;

SELECT COUNT(language) AS no_language, release_year
FROM films
GROUP BY release_year
ORDER BY no_language DESC;
-----------------------------------------------------------------------------------------------------------------------
-- Filtering Grouped data    Can't user WHERE with GROUP BY so we use HAVING
SELECT release_year,COUNT(title) as title_count
FROM films
GROUP BY release_year
HAVING COUNT(title) >10;

-- This is because WHERE is executed before the GROUP BY in SQL and HAVING is executed after 
-- So if we have a query with both -> WHERE will be before GROUP BY and HAVING will be after
SELECT certification,COUNT(title) AS title_count
FROM films
WHERE certification IN ('G', 'PG', 'PG-13')
GROUP BY certification
HAVING COUNT(title)>500
ORDER BY title_count
LIMIT 3;

-- (WHERE VS HAVING) WHERE filters individual records while HAVING filters grouped records.
SELECT country,COUNT(DISTINCT certification) AS certification_count
FROM films
GROUP BY country
HAVING COUNT(DISTINCT certification)>10;

SELECT country,ROUND(AVG(budget),2) AS average_budget
FROM films
GROUP BY country
HAVING AVG(budget)>1000000000
ORDER BY average_budget DESC;

SELECT release_year
FROM films
WHERE release_year>1990
GROUP BY release_year;

SELECT release_year, AVG(budget) AS avg_budget,AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget)>60000000;

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC
LIMIT 1;











