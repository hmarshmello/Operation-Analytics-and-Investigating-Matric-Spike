#VIEW DATABASE
USE metricspike;
SELECT * FROM events;
SELECT * FROM emailevents;
SELECT * FROM users;
SHOW COLUMNS IN events;

#Weekly User Engagement
SELECT YEAR(created_at) year, WEEK(created_at) weeknumber, COUNT(*) ActiveUsers
FROM users
WHERE state = "active"
GROUP BY 1,2
ORDER BY 1;

#User Growth Analysis (macbook pro)
SELECT YEAR(occured_at) year, DAY(occured_at) day, device, COUNT(*) Users
FROM events 
WHERE device = 'macbook pro'
GROUP BY 1,2
ORDER BY 1,2;

#Weekly Retention Analysis
SELECT * FROM events where event_type = 'signup_flow';
SELECT event_name, count(*) FROM events group by event_name;
SELECT WEEK(occured_at) Week, count(*) Retention_of_users
FROM events 
where event_type = 'signup_flow' and event_name = 'complete_signup'
GROUP BY 1
ORDER BY 1;

#Weekly Engagement Per Device
SELECT device Device, AVG(Users) Avg_Weekly_Users, AVG(Device_used) Avg_Device_Used
FROM ( 
	SELECT WEEK(occured_at) Week, device, COUNT(DISTINCT(user_id)) Users, COUNT(device) Device_Used
	FROM events 
	WHERE event_type = 'engagement' and event_name = 'login'
	GROUP BY 1,2
    ORDER BY 1) A
GROUP BY 1;

#Email Engagement Analysis
SELECT * FROM emailevents;
SELECT 	Week, Users, 
		Weekly_Digest_Sent, Weekly_Digest_Sent - LAG(Weekly_Digest_Sent) OVER(ORDER BY WEEK) as Digest_Growth,
        email_open, email_open - LAG(email_open) OVER(ORDER BY WEEK) as Email_Open_Growth,
        email_clickthrough, email_clickthrough - LAG(email_clickthrough) OVER(ORDER BY WEEK) as Email_Clickthrough_Growth,
        sent_reengagement_email, sent_reengagement_email - LAG(sent_reengagement_email) OVER(ORDER BY WEEK) as Sent_EngageMail_Growth
FROM(
	SELECT 	WEEK(occured_at) Week, COUNT(DISTINCT(userid)) Users, 
			SUM(IF(action = 'sent_weekly_digest',1,0)) as Weekly_Digest_Sent,
			SUM(IF(action = 'email_open',1,0)) as email_open,
			SUM(IF(action = 'email_clickthrough',1,0)) as email_clickthrough,
			SUM(IF(action = 'sent_reengagement_email',1,0)) as sent_reengagement_email
	FROM emailevents
	GROUP BY 1
	ORDER BY 1
    ) A;

