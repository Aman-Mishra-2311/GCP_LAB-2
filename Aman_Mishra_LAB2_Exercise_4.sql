--Exercise n. 4
--1. Find the first 3 most used pairs of OS and Browser from mobile devices for each
--available country on 1st August 2017
--2. Produce a new table with the query result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_20170801
-- Tip: ARRAY_AGG functions can be useful
-- (see: https://cloud.google.com/bigquery/docs/reference/standard-sql/aggregate_functions)


with country_data as(
    select country , ARRAY_AGG(STRUCT(operatingSystem,browser,rank)LIMIT 3) as country_rank from(
    select country,operatingSystem ,browser ,rank from(
     select *,ROW_NUMBER()  OVER (
        PARTITION By country
        ORDER BY counter DESC
    ) AS rank from (
     SELECT geoNetwork.country as country,device.operatingSystem as operatingSystem,
     device.browser as browser,count(*) as counter
     from 
    `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
    where device.isMobile = True
     group by country,operatingSystem,browser
     order by country
    )
    )
    )
     WHERE country NOT like '(%)'
    GROUP BY country
)

SELECT * FROM country_data
ORDER BY country