-- Exercise n. 5
-- Find the top 10 users (the id) who answered the most questions.
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: posts_answers, users

#standardSQL
Select  owner_user_id as id_user ,count(owner_user_id) as cOunt from `bigquery-public-data.stackoverflow.posts_answers` 
where body IS NOT NULL AND creation_date Between '2010-01-01' AND '2010-12-31'
GROUP BY owner_user_id 
ORDER BY cOunt DESC LIMIT 10;
