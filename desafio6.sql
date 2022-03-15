SELECT
  ROUND(MIN(plans.price) / 100, 2) AS faturamento_minimo,
  ROUND(MAX(plans.price) / 100, 2) AS faturamento_maximo,
  ROUND((SUM(plans.price) / COUNT(users.id)) /100, 2) AS faturamento_medio,
  ROUND(SUM(plans.price) / 100, 2) AS faturamento_total
FROM SpotifyClone.plans AS plans
JOIN SpotifyClone.users AS users ON users.plan_id = plans.id;