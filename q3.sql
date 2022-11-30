set search_path to ticketchema;
DROP TABLE IF EXISTS q3 CASCADE;

CREATE TABLE q3 (
    vid integer,
    venue_name varchar(),
    city varchar();
    percentage float
);



INSERT INTO q3 (
    SELECT vid, count(CASE WHEN mobility is True THEN 1 END access)/count(*) as percentage, name, city
    FROM SeatInfo JOIN Venue USING (vid)
    GROUP BY vid
);