SELECT 
  users.name AS usuario,
  IF(YEAR(MAX(user_history.date_time)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.users AS users
JOIN SpotifyClone.user_history AS user_history ON user_history.user_id = users.id
GROUP BY usuario
ORDER BY usuario;