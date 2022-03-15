SELECT
  artists.name AS artista,
  albums.name AS album,
  COUNT(artists_users.user_id) AS seguidores
FROM SpotifyClone.artists AS artists
JOIN SpotifyClone.albums AS albums ON albums.artist_id = artists.id
JOIN SpotifyClone.artists_users AS artists_users ON artists_users.artist_id = artists.id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;