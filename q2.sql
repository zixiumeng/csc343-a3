-- For each owner, report how many venues they own.
set search_path to ticketchema;
DROP TABLE IF EXISTS q2 CASCADE;

CREATE TABLE q2 (
    ownerid integer,
    name varchar(50),
    venue_num integer
);

INSERT INTO q2 (
    SELECT ownerid, name, phone, count(*) as venue_num
    FROM Ownership JOIN Owner USING (ownerid)
    GROUP BY ownerid
);