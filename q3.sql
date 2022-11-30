set search_path to ticketchema;
DROP TABLE IF EXISTS q3 CASCADE;

CREATE TABLE q3 (
    vid integer,
    venue_name varchar(20),
    city varchar(50),
    percentage float
);

DROP VIEW IF EXISTS Mobility CASCADE;

CREATE VIEW Mobility AS
    SELECT vid, count(CASE WHEN mobility is True THEN 1 END)/count(*) as percentage
    FROM SeatInfo 
    GROUP BY vid;

INSERT INTO q3 (
    SELECT vid, name as venue_name, city, percentage
    FROM Mobility JOIN Venue USING (vid)
);