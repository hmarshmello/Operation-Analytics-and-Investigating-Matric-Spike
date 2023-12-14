#View Data
SELECT *
FROM job_data
ORDER BY date;

#Jobs Reviewed Over Time
SELECT (COUNT(job_id)) / (SUM(time_spent) / 3600) JobsOverTime, date
FROM job_data
WHERE date LIKE '2020-11%'
GROUP BY date;

#Throughput Analysis

	#daily metric
		SELECT date,avg(tp) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as avgtp
		FROM (
			SELECT date,count(*)/(sum(time_spent)) as tp
			FROM job_data
			GROUP BY date 
		) jd
		GROUP BY date;
    
    #7-day Rolling Average Throughput
		SELECT ROUND(AVG(avgtp), 2) AS 7dayavgtp
		FROM (
			SELECT date, ROUND(AVG(tp), 2) AS avgtp
			FROM (
				SELECT date, COUNT(*) / (SUM(time_spent)) AS tp
				FROM job_data
				GROUP BY date) jd
		GROUP BY date) jd1;
    
#Language Share Analysis

WITH langCount as (
SELECT language, count(language) as c
FROM job_data
WHERE date BETWEEN "2020-10-30" and "2020-11-30"
GROUP BY language
),
totalJobs as(
	SELECT COUNT(*) as total
	FROM job_data
    WHERE date BETWEEN "2020-10-30" and "2020-11-30"
)

SELECT language, ROUND(c/total,3) * 100 percent
FROM langCount CROSS JOIN totalJobs;

#Duplicate Rows Detection
SELECT rnum
FROM(
	SELECT ROW_NUMBER() OVER(PARTITION BY date,job_id,actor_id) as rnum
	FROM job_data
    ) dups
WHERE rnum > 1