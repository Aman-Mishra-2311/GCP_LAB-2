-- Exercise n1.
-- Given the shared file top_4000_movies_data.csv
-- 1. Create a BigQuery table “Movie”
-- 2. Find the top 10 highest budget films, year by year, from 2016 to 2020



WITH Movies AS (
SELECT FORMAT_DATE("%Y",Release_Date)as year ,Movie_Title,Production_Budget,RANK() OVER (PARTITION BY year ORDER BY Production_Budget DESC) AS Rank
FROM (
  
     ( SELECT *,FORMAT_DATE("%Y",Release_Date)as year  FROM  `nttdata-c4e-bde.uc1_15.Movie`
      where ( Release_Date Between '2016-01-01' AND '2020-12-31' )
      order by Production_Budget Desc
     )
)
)
SELECT year ,Movie_Title,Production_Budget,Rank 
FROM Movies
where rank<=10
order by year DESC,Rank asc