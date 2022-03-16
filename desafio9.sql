SELECT 
  COUNT(user_history.date_time) AS quantidade_musicas_no_historico
FROM SpotifyClone.user_history AS user_history
JOIN SpotifyClone.users AS users ON users.id = user_history.user_id
WHERE users.name = 'Bill';