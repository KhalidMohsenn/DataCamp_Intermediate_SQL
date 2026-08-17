# DataCamp Intermediate SQL

## Project Overview

This project contains my practical work from the DataCamp Intermediate SQL course, implemented independently using PostgreSQL and pgAdmin 4.

The project recreates the course's relational movie database locally and uses it to practice SQL concepts through hands-on queries.

The database contains information about films, people involved in film production, film reviews, and the roles people had in different films.

The purpose of this project was to strengthen practical SQL skills by working with a relational database and applying SQL concepts to real-world-style data.

---

## Database Overview

The database consists of four related tables:

| Table | Description | Records |
|---|---|---:|
| `films` | Information about films, including release year, country, duration, language, certification, gross, and budget | 4,968 |
| `people` | Information about people associated with the films | 8,397 |
| `reviews` | Review and rating information for films | 4,968 |
| `roles` | Relationships between people and films, including their roles | 19,791 |

---

## Database Schema

The database uses primary keys and foreign keys to establish relationships between the four tables.

### Primary Keys

- `films.id`
- `people.id`
- `reviews.id`
- `roles.id`

### Foreign Keys

- `reviews.film_id` → `films.id`
- `roles.film_id` → `films.id`
- `roles.person_id` → `people.id`

### Entity Relationship Diagram

![Database Schema](schema/database_schema.png)

The original pgAdmin ERD file is also included in the `schema` folder.

---

## SQL Concepts Practiced

The project includes practical exercises covering the following SQL concepts:

### Data Exploration

- `COUNT()`
- `DISTINCT`
- `COUNT(DISTINCT ...)`
- Record counting

### Filtering Data

- `WHERE`
- Comparison operators
- `AND`
- `OR`
- `BETWEEN`
- `IN`
- `LIKE`
- `NOT LIKE`
- Wildcards (`%` and `_`)

### Handling NULL Values

- `IS NULL`
- `IS NOT NULL`
- Counting missing values
- Filtering records based on missing information

### Aggregate Functions

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `ROUND()`

### Calculations and Aliasing

- Arithmetic operations
- Column aliases using `AS`
- Calculating profit
- Converting film duration from minutes to hours
- Calculating percentages
- Working with calculated values

### Sorting and Grouping

- `ORDER BY`
- Ascending and descending sorting
- Sorting by multiple columns
- `GROUP BY`
- Grouping by multiple columns

### Filtering Grouped Data

- `HAVING`
- Using `WHERE` before grouping
- Using `HAVING` to filter grouped results
- Combining `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT`

---

## Data Import and Preparation

The original CSV files contain values and missing fields that do not always directly match the final PostgreSQL data types.

To handle this, staging tables were used during the data import process.

The data was initially loaded into text-based staging tables and then converted into the appropriate PostgreSQL data types before being inserted into the final tables.

Examples include:

- Converting values such as `1916.0` to integers
- Converting empty strings to `NULL`
- Converting text values to `DATE`
- Converting numeric text values to `INT`, `BIGINT`, and `FLOAT`
- Generating IDs for the `reviews` table because the source CSV does not contain an `id` column

After the data was successfully transferred into the final tables, the staging tables were removed.

---

## Project Structure

```text
DataCamp_Intermediate_SQL/
│
├── README.md
│
├── data/
│   ├── films.csv
│   ├── people.csv
│   ├── reviews.csv
│   └── roles.csv
│
├── schema/
│   ├── database_schema.pgerd
│   └── database_schema.png
│
└── sql/
    ├── 01_create_tables.sql
    ├── 02_import_data.sql
    └── 03_sql_practice.sql
