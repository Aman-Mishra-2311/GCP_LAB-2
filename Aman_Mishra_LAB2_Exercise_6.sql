-- Exercise n. 6
-- Find the top 10 StackOverflow users (the id) by accepted responses on 2010 posts
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: stackoverflow_posts, posts_answers, users


#standardSQL
Select  owner_user_id as id_user ,count(owner_user_id) as cOunt from `bigquery-public-data.stackoverflow.stackoverflow_posts` 
where id in (Select accepted_answer_id from `bigquery-public-data.stackoverflow.stackoverflow_posts` )  AND creation_date Between '2010-01-01' AND '2010-12-31'
GROUP BY owner_user_id 
ORDER BY cOunt DESC LIMIT 10;