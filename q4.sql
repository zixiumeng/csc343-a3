set search_path to ticketchema;
DROP TABLE IF EXISTS q4 CASCADE;

CREATE TABLE q4 (
    username varchar(20)
);

INSERT INTO q4 (
    SELECT username
    FROM Purchase
    GROUP BY username
    HAVING count(*) >= all (SELECT count(*)
                            FROM Purchase
                            GROUP BY username)
);