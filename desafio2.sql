SELECT
  COUNT(DISTINCT s.id) AS cancoes,
  COUNT(DISTINCT ar.id) AS artistas,
  COUNT(DISTINCT al.id) AS albuns
FROM SpotifyClone.songs AS s
JOIN SpotifyClone.albums AS al
JOIN SpotifyClone.artists AS ar;