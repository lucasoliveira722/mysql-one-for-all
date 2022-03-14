SELECT
  users.name AS usuario,
  COUNT(user_history.date_time) AS qtde_musicas_ouvidas,
  ROUND(SUM(songs.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS users
JOIN SpotifyClone.user_history AS user_history ON user_history.user_id = users.id
JOIN SpotifyClone.songs AS songs ON songs.id = user_history.song_id
GROUP BY usuario
ORDER BY usuario;