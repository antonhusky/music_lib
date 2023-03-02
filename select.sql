SELECT * FROM album_table WHERE year = 2018;
SELECT * FROM tracks_table ORDER BY duration DESC LIMIT 1;
SELECT name FROM tracks_table WHERE duration > 210;
SELECT name FROM collection_table WHERE year BETWEEN 2018 AND 2020;
SELECT * FROM artist_table WHERE name NOT LIKE '% %';
SELECT * FROM tracks_table WHERE name LIKE '%my%';