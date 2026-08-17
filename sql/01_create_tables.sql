CREATE TABLE films (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    country VARCHAR(50),
    duration INT,
    language VARCHAR(50),
    certification VARCHAR(50),
    gross BIGINT,
    budget BIGINT
);
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE people (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE,
    deathdate DATE
);
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE reviews (
    id INT PRIMARY KEY,
    film_id INT,
    num_user INT,
    num_critic INT,
    imdb_score FLOAT,
    num_votes INT,
    facebook_likes INT,
    FOREIGN KEY (film_id) REFERENCES films(id)
);
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE roles (
    id INT PRIMARY KEY,
    film_id INT,
    person_id INT,
    role VARCHAR(50),
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);