-- 1. PREREQUISITES

-- 2. QUESTION 2
-- What are the Top 25 schools (.edu domains)?
SELECT email_domain, COUNT(*)
FROM users
GROUP BY email_domain
ORDER BY COUNT(*) DESC
LIMIT 25;

-- How many .edu learners are located in New York?
SELECT city, COUNT(*)
FROM users
WHERE city = 'New York';

-- The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app? 
SELECT mobile_app, COUNT(*)
FROM users
WHERE mobile_app = 'mobile-user';

-- 3. QUESTION 3
SELECT sign_up_at,
   strftime('%H', sign_up_at) AS 'hour', COUNT(*) AS 'signups per hour'
FROM users
GROUP BY HOUR
ORDER BY HOUR;

-- 4. QUESTION 4
-- Do different schools (.edu domains) prefer different courses?
SELECT users.email_domain,
  COUNT(
    CASE
    WHEN progress.learn_cpp = 'started' OR progress.learn_cpp = 'completed' THEN users.user_id
  END) AS c_plus_plus,
  COUNT(
    CASE
    WHEN progress.learn_sql = 'completed' OR progress.learn_sql = 'started' THEN users.user_id
  END) AS sql,
  COUNT(
    CASE
    WHEN progress.learn_html = 'completed' OR progress.learn_html = 'started' THEN users.user_id
  END) AS html,
  COUNT(
    CASE
    WHEN progress.learn_javascript = 'started' OR progress.learn_javascript = 'completed' THEN users.user_id
  END) AS javascript,
  COUNT(
    CASE
    WHEN progress.learn_java = 'started' OR progress.learn_java = 'completed' THEN users.user_id
  END) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
  GROUP BY 1
  LIMIT 20;

-- What courses are the New Yorkers students taking?
SELECT users.email_domain,
  COUNT(
    CASE
    WHEN progress.learn_cpp = 'started' OR progress.learn_cpp = 'completed' THEN users.user_id
  END) AS c_plus_plus,
  COUNT(
    CASE
    WHEN progress.learn_sql = 'completed' OR progress.learn_sql = 'started' THEN users.user_id
  END) AS sql,
  COUNT(
    CASE
    WHEN progress.learn_html = 'completed' OR progress.learn_html = 'started' THEN users.user_id
  END) AS html,
  COUNT(
    CASE
    WHEN progress.learn_javascript = 'started' OR progress.learn_javascript = 'completed' THEN users.user_id
  END) AS javascript,
  COUNT(
    CASE
    WHEN progress.learn_java = 'started' OR progress.learn_java = 'completed' THEN users.user_id
  END) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
  WHERE city = 'New York'
  GROUP BY 1;

-- What courses are the Chicago students taking?
SELECT users.email_domain,
  COUNT(
    CASE
    WHEN progress.learn_cpp = 'started' OR progress.learn_cpp = 'completed' THEN users.user_id
  END) AS c_plus_plus,
  COUNT(
    CASE
    WHEN progress.learn_sql = 'completed' OR progress.learn_sql = 'started' THEN users.user_id
  END) AS sql,
  COUNT(
    CASE
    WHEN progress.learn_html = 'completed' OR progress.learn_html = 'started' THEN users.user_id
  END) AS html,
  COUNT(
    CASE
    WHEN progress.learn_javascript = 'started' OR progress.learn_javascript = 'completed' THEN users.user_id
  END) AS javascript,
  COUNT(
    CASE
    WHEN progress.learn_java = 'started' OR progress.learn_java = 'completed' THEN users.user_id
  END) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
  WHERE city = 'Chicago'
  GROUP BY 1;
-- 
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u
LEFT JOIN progress p
ON u.user_id = p.user_id
GROUP BY 1
ORDER BY 1
LIMIT 10;

