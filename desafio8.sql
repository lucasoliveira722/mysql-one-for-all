SELECT
  artists.name AS artista,
  albums.name AS album
FROM SpotifyClone.artists AS artists
JOIN SpotifyClone.albums AS albums ON albums.artist_id = artists.id
WHERE artists.name = 'Walter Phoenix'
ORDER BY album;