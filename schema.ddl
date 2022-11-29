-- Could not: 
When a seat is deleted in SeatInfo, we cannot employ the constraint on Venue that each venue must have no less than 10 seats without trigger or assertion.
-- Did not:

-- Extra constraints:
(1) each venue has no less than 1 section.
(2) each ticket_id cannot have more than 1 user.
(3) each seat belongs to exactly one venue.
-- Assumptions:
(1) a buyer can purchanse multiple tickets at the same point of time
(2) any seat has a fixed mobility for all concerts
(3) any city can have no or multiple venues.
(4) venues can have the same name across cities, but each city only has one venue with the same name. That is, city_name and venue_name are unique
(5) it requires no gap time between any 2 different concerts held at the same venue, and there is no constraint on the presentation time for concerts.
(6) each venue must have at least one owner


drop schema if exists ticketchema cascade;
create schema ticketchema;
set search_path to ticketchema;

-- All registered Owners, each owner has a unique ownerid. An owner can be a person, company, or an organization
CREATE TBALE Owner (
    owner_phone varchar(20) PRIMARY KEY,
    name varchar(50) NOT NULL
);

-- 
CREATE TABLE Ownership (
    ownerid integer NOT NULL REFERENCES Owner,
    vid integer PRIMARY KEY REFERENCES Venue,
);


-- All registered Venue.
CREATE TABLE Venue (
    vid integer PRIMARY KEY,
    name varchar NOT NULL,
    city varchar(50) NOT NULL,
    address varchar(300) NOT NULL,
    owner varchar(20) NOT NULL,
    CONSTRAINT seat_number_no_less_than_10 AS CHECK(
        SELECT *
        FROM Venue
        WHERE 
          (SELECT count(section_name || seat_name)
           FROM SeatInfo
           WHERE SeatInfo.vid == Venue.vid
          ) >= 10) 
    );

--
CREATE TABLE SeatInfo (
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    vid integer NOT NULL REFERENCES Venue(vid),
    mobility boolean NOT NULL, 
    PRIMARY KEY (seat_name, section_name, vid)
);

--
CREATE TABLE Concert (
    cid integer PRIMARY KEY,
    concert_name varchar(30) NOT MULL,
    datetime timestamp NOT NULL,
    vid integer NOT NULL REFERENCES Venue(vid), 
    UNIQUE (vid, datetime)
);

--
CREATE TABLE User (
    username varchar(20) PRIMARY KEY
);

--
CREATE TABLE Purchase (
    ticket_id integer PRIMARY KEY,
    username varchar(20) NOT NULL REFERENCES User,
    cid NOT NULL REFERENCES Concert,
    seat_name varchar(10) NOT NULL REFERENCES SeatInfo,
    section_name varchar(20) NOT NULL REFERENCES SeatInfo,
    datetime timestamp NOT NULL,
);

--
CREATE TABLE Price (
    cid integer NOT NULL REFERENCES Concert,
    section_name varchar(20) REFERENCES SeatInfo,
    price float NOT NULL
);
