-- For each concert, report the total value of all tickets sold 
-- and the percentage of the venue that was sold.

set search_path to ticketchema;
DROP TABLE IF EXISTS q1 CASCADE;

CREATE TABLE q1(
    cid integer,
    concert_name varchar(50),
    datetime timestamp,
    sales float,
    percentage float
);

DROP VIEW IF EXISTS Ticketprice CASCADE;
DROP VIEW IF EXISTS Sales CASCADE;
DROP VIEW IF EXISTS Allticket CASCADE;
DROP VIEW IF EXISTS Soldticket CASCADE;
DROP VIEW IF EXISTS Percentage CASCADE;
DROP VIEW IF EXISTS AllconcertSP CASCADE;

-- Find the price of all ticket
CREATE VIEW Ticketprice AS 
SELECT tid, price, Ticket.cid as cid
FROM Ticket JOIN Price ON (Ticket.cid = Price.cid and Ticket.section_name = Price.section_name)
    JOIN Purchase USING (tid);


-- Find the sales of a concert
CREATE VIEW Sales AS
SELECT sum(price) as sales, cid
FROM Ticketprice
GROUP BY cid;


-- Find # of all ticket for a concert 
--CREATE VIEW Allticket AS
--SELECT cid, count(*) as all_num
--FROM Ticket
--GROUP BY cid;

-- Find # of all ticket for a concert 
CREATE VIEW Allticket AS
SELECT cid, count(seat_name || section_name || vid) as all_num
FROM SeatInfo JOIN Concert USING (vid)
GROUP BY cid;


-- Find # of all tickets sold for a concert
--CREATE VIEW Soldticket AS
--SELECT cid, count(*) as sold_num
--FROM Purchase JOIN Ticket USING (tid)
--GROUP BY cid;

-- Find # of all tickets sold for a concert
CREATE VIEW Soldticket AS
SELECT Concert.cid, count(*) as sold_num
FROM Purchase JOIN Concert USING (cid)
GROUP BY cid;

-- Find the percentage of ticket sold for a concert
CREATE VIEW Percentage AS
SELECT cid, sold_num/all_num as percentage
FROM Allticket JOIN Soldticket USING (cid);

-- Find all concert
CREATE VIEW AllconcertSP AS
SELECT cid, coalesce(sales, 0) as value, coalesce(percentage, 0) as percentage
FROM (SELECT cid FROM Concert) as allconcert LEFT JOIN Sales USING(cid)
                                            LEFT JOIN Percentage USING(cid);

INSERT INTO q1
SELECT cid, concert_name, datetime, value, percentage
FROM AllconcertSP JOIN Concert USING (cid);
