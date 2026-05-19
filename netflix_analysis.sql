-- Create Netflix table
CREATE TABLE netflix (
    show_id VARCHAR(20),
    TYPE VARCHAR(20),
    title VARCHAR(300),
    director TEXT,
    cast_members TEXT,
    country TEXT,
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);
SELECT * FROM netflix;

--Total Movies vs TV Shows
SELECT TYPE,
COUNT(*) AS total_content
FROM netflix
GROUP BY TYPE;

--Top Countries
SELECT country,
COUNT(*) AS total_content
FROM netflix
GROUP BY country
ORDER BY total_content DESC
LIMIT 10;

--Release Trend
SELECT release_year,
COUNT(*) AS total_released
FROM netflix
GROUP BY release_year
ORDER BY release_year;

--Ratings Analysis
SELECT rating,
COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

--Genre Popularity
SELECT listed_in,
COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

--Top Directors
SELECT director,
COUNT(*) AS total_titles
FROM netflix
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

--Ranking Function According to Total Movies
SELECT director,
COUNT(*) AS total_movies,
RANK() OVER(ORDER BY COUNT(*) DESC) AS director_rank
FROM netflix
GROUP BY director;