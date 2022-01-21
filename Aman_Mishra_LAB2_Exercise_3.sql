--Exercise n. 3
--Find how many times a page it was visited in July 2017. Group by date the result
--Public Dataset: bigquery-public-data.google_analytics_sample
--Table involved: ga_sessions_201707* (wildcard)

(SELECT  date, h.page.pagePath, Count(h.page.pagePath) as COunter  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170701`, UNNEST(hits) as h 
GROUP BY date,h.page.pagePath)
