-- Staging tables for appropriate importing of data
CREATE TABLE films_staging (
    id TEXT,
    title TEXT,
    release_year TEXT,
    country TEXT,
    duration TEXT,
    language TEXT,
    certification TEXT,
    gross TEXT,
    budget TEXT
);
SELECT * FROM films_staging LIMIT 10;
SELECT COUNT(*) FROM films_staging;

INSERT INTO films (
    id,
    title,
    release_year,
    country,
    duration,
    language,
    certification,
    gross,
    budget
)
SELECT
    id::INT,
    NULLIF(title, ''),
    NULLIF(release_year, '')::NUMERIC::INT,
    NULLIF(country, ''),
    NULLIF(duration, '')::NUMERIC::INT,
    NULLIF(language, ''),
    NULLIF(certification, ''),
    NULLIF(gross, '')::NUMERIC::BIGINT,
    NULLIF(budget, '')::NUMERIC::BIGINT
FROM films_staging;
SELECT * FROM films LIMIT 10;
SELECT COUNT (*) FROM films;
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE people_staging (
    id TEXT,
    name TEXT,
    birthdate TEXT,
    deathdate TEXT
);
SELECT * FROM people_staging LIMIT 10;
SELECT COUNT (*) FROM people_staging;

INSERT INTO people (
    id,
    name,
    birthdate,
    deathdate
)
SELECT
    id::INT,
    NULLIF(name, ''),
    NULLIF(birthdate, '')::DATE,
    NULLIF(deathdate, '')::DATE
FROM people_staging;
SELECT * FROM people LIMIT 10;
SELECT COUNT(*) FROM people;
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE reviews_staging (
    film_id TEXT,
    num_user TEXT,
    num_critic TEXT,
    imdb_score TEXT,
    num_votes TEXT,
    facebook_likes TEXT
);
SELECT * FROM reviews_staging LIMIT 10;
SELECT COUNT(*) FROM reviews_staging;

INSERT INTO reviews (
    id,
    film_id,
    num_user,
    num_critic,
    imdb_score,
    num_votes,
    facebook_likes
)
SELECT
    ROW_NUMBER() OVER ()::INT,
    NULLIF(film_id, '')::NUMERIC::INT,
    NULLIF(num_user, '')::NUMERIC::INT,
    NULLIF(num_critic, '')::NUMERIC::INT,
    NULLIF(imdb_score, '')::NUMERIC::FLOAT,
    NULLIF(num_votes, '')::NUMERIC::INT,
    NULLIF(facebook_likes, '')::NUMERIC::INT
FROM reviews_staging;
SELECT * FROM reviews LIMIT 10;
SELECT COUNT(*) FROM reviews;
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE roles_staging (
    id TEXT,
    film_id TEXT,
    person_id TEXT,
    role TEXT
);
SELECT * FROM roles_staging LIMIT 10;
SELECT COUNT(*) FROM roles_staging;

INSERT INTO roles (
    id,
    film_id,
    person_id,
    role
)
SELECT
    NULLIF(id, '')::NUMERIC::INT,
    NULLIF(film_id, '')::NUMERIC::INT,
    NULLIF(person_id, '')::NUMERIC::INT,
    NULLIF(role, '')
FROM roles_staging;
SELECT * FROM roles LIMIT 10;
SELECT COUNT(*) FROM roles;
-----------------------------------------------------------------------------------------------------------------------
-- Droping stagning tables
DROP TABLE IF EXISTS films_staging;
DROP TABLE IF EXISTS people_staging;
DROP TABLE IF EXISTS reviews_staging;
DROP TABLE IF EXISTS roles_staging;