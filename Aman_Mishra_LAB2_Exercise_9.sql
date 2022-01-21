-- Exercise n. 9
-- Find for each commit on Github on a .c file of the Linux kernel, the previous and the next
-- commit.
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: sample_commits
-- Tip: Lag and Lead functions can be useful
-- (see: https://cloud.google.com/bigquery/docs/reference/standard-sql/navigation_functions)

SELECT repo_name,
h.new_path as file,
committer.date as date,
LAG(commit)OVER ( ORDER BY committer.date ASC) AS previous_commit,
commit,
LEAD(commit)OVER ( ORDER BY committer.date ASC) AS next_commit 
FROM `bigquery-public-data.github_repos.sample_commits`,UNNEST(difference) as h
where repo_name Like '%linux%' AND h.new_path Like 'kernel%.c'
ORDER BY date ASC