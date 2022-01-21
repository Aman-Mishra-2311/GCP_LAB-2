
-- Exercise n. 8
-- Find the top 10 committers in 2016 on Github repositories that uses the Java language
-- Public Dataset: bigquery-public-data.github_repos
-- Tables involved: languages, sample_commits

#standardSQL
Select committer.name as name,count(committer.name) as cOunt
From `bigquery-public-data.github_repos.sample_commits` 
where repo_name IN (
SELECT a.repo_name

FROM `bigquery-public-data.github_repos.languages` a ,UNNEST(language) as l
JOIN  `bigquery-public-data.github_repos.sample_commits` b  
ON a.repo_name=b.repo_name
where l.name LIKE '%Java'
)

AND  committer.date Between '2016-01-01' AND '2016-12-31'
Group BY name 
Order By cOunt DESC
Limit 10;
