
SELECT genre_table.name, COUNT(artist_table.id) AS artist_number
FROM genre_table
LEFT JOIN artist_genre_binding_table ON genre_table.id = artist_genre_binding_table.genre_id
LEFT JOIN artist_table ON artist_genre_binding_table.artist_id = artist_table.id
GROUP BY genre_table.name;

SELECT album_table.name, COUNT(tracks_table.id) AS tracks_number
FROM album_table
LEFT JOIN tracks_table ON album_table.id = tracks_table.album_id
WHERE album_table.year BETWEEN 2019 AND 2020
GROUP BY album_table.name;

SELECT album_table.name, AVG(tracks_table.duration) AS average_track_length
FROM album_table
LEFT JOIN tracks_table ON album_table.id = tracks_table.album_id
GROUP BY album_table.name;

SELECT artist_table.name
FROM artist_table
LEFT JOIN album_artist_binding_table ON artist_table.id = album_artist_binding_table.artist_id
LEFT JOIN album_table ON album_artist_binding_table.album_id = album_table.id
WHERE album_table.year != 2020;

SELECT collection_table.name
FROM collection_table
LEFT JOIN collection_track_binding_table ON collection_table.id = collection_track_binding_table.collection_id
LEFT JOIN tracks_table ON collection_track_binding_table.track_id = tracks_table.id
LEFT JOIN album_artist_binding_table ON tracks_table.album_id = album_artist_binding_table.album_id
LEFT JOIN artist_table ON album_artist_binding_table.artist_id = artist_table.id
WHERE artist_table.name = 'U2';

SELECT album_table.name
FROM album_table
LEFT JOIN album_artist_binding_table ON album_table.id = album_artist_binding_table.album_id
LEFT JOIN artist_genre_binding_table ON album_artist_binding_table.artist_id = artist_genre_binding_table.artist_id
GROUP BY album_table.name
HAVING COUNT(artist_genre_binding_table.genre_id) > 1;

SELECT tracks_table.name
FROM tracks_table
LEFT JOIN collection_track_binding_table ON tracks_table.id = collection_track_binding_table.track_id
WHERE collection_track_binding_table.collection_id IS NULL;

SELECT artist_table.name
FROM artist_table
LEFT JOIN album_artist_binding_table ON artist_table.id = album_artist_binding_table.artist_id
LEFT JOIN tracks_table ON album_artist_binding_table.album_id = tracks_table.album_id
WHERE tracks_table.duration = (SELECT MIN(tracks_table.duration) FROM tracks_table);

SELECT album_table.name
FROM album_table
LEFT JOIN tracks_table ON album_table.id = tracks_table.album_id
GROUP BY album_table.name
HAVING COUNT(tracks_table.id) = (SELECT MIN(tracks_table.id) FROM tracks_table);


