-- Exercise n. 7
-- Find the most popular programming language
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: languages

#standardSQL
Select  h.name as language_name ,count(h.name) as cOunt from `bigquery-public-data.github_repos.languages` ,UNNEST(language) as h
GROUP BY language_name
ORDER BY cOunt DESC LIMIT 1;