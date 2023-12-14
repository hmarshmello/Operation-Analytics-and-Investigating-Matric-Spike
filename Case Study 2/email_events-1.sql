USE metricspike;

CREATE TABLE emailevents (
	userid int,
    occured_at datetime,
    action varchar(255),
    user_type int
);

LOAD DATA INFILE 'D:/Trainity/Operation Analytics and Investigating Metric Spike/Case Study 2/email_events.csv'
INTO TABLE emailevents
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;