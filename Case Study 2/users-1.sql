CREATE TABLE users(
	user_id int PRIMARY KEY ,
    created_at DATETIME,
    company_id int,
    language varchar(35),
    activated_at DATETIME,
    state varchar(30)
);

LOAD DATA INFILE 'D:/Trainity/Operation Analytics and Investigating Metric Spike/Case Study 2/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;