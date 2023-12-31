CREATE TABLE IF NOT EXISTS your_table_name (
    date DATE,
    job_id INT,
    actor_id INT,
    event VARCHAR(10),
    language VARCHAR(20),
    time_spent INT,
    org VARCHAR(1)
);

INSERT INTO your_table_name (date, job_id, actor_id, event, language, time_spent, org) VALUES
    ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
    ('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
    ('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
    ('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
    ('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C'),
    ('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
    ('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
    ('2020-11-28', 23, 1005, 'transfer', 'Persian', 22, 'D');
