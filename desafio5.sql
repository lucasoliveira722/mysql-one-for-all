SELECT
  songs.name AS cancao,
  COUNT(user_history.date_time) AS reproducoes
FROM SpotifyClone.songs AS songs
JOIN SpotifyClone.user_history AS user_history ON user_history.song_id = songs.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;