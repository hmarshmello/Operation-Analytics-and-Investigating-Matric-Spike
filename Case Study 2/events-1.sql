USE metricspike;
DROP TABLE events;

CREATE TABLE events(
user_id int,
occured_at datetime,
event_type varchar(50),
event_name varchar(50),
location varchar(50),
device varchar(70),
user_type int
);

LOAD DATA INFILE 'D:/Trainity/Operation Analytics and Investigating Metric Spike/Case Study 2/events.csv'
INTO TABLE events
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;