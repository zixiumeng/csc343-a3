-- For each owner, report how many venues they own.
set search_path to ticketchema;
DROP TABLE IF EXISTS q2 CASCADE;


CREATE TABLE q2 (
    ownerid integer,
    name varchar(50),
    phone varchar(20),
    venue_num integer
);

DROP VIEW IF EXISTS MostOwner CASCADE;

CREATE VIEW MostOwner AS
    SELECT ownerid, count(*) as venue_num
    FROM Ownership
    GROUP BY ownerid;

INSERT INTO q2 (
    SELECT ownerid, name, phone, venue_num
    FROM MostOwner JOIN Owner USING (ownerid)
);