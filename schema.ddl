-- Could not: 
We cannot enforce the constraint of "Every venue has at least 10 seat" 
-- Did not:

-- Extra constraints:
(1) each venue has no less than 1 section.
(2) each ticket_id cannot have more than 1 user.
(3) each seat belongs to exactly one venue.
-- Assumptions:
?(1) a buyer can purchanse multiple tickets at the same point of time
(2) any seat has a fixed mobility for all concerts
?(3) any city can have no or multiple venues.
(4) venues can have the same name across cities, but each city only has one venue with the same name. That is, city and venue_name uniquly define a venue.

drop schema if exists ticketchema cascade;
create schema ticketchema;
set search_path to ticketchema;

-- All registered Owners, each owner has a unique ownerid. An owner can be a person, company, or an organization
CREATE TBALE Owner (
    ownerid integer PRIMARY KET,
    name varchar(50) NOT NULL,
    phone varchar(20) NOT NULL unique
);

-- Every venue has exactly one owner.
CREATE TABLE Ownership (
    ownerid integer NOT NULL REFERENCES Owner,
    vid integer PRIMARY KEY REFERENCES Venue
);


-- All registered Venue. A venue has a name (not unique), city, and street address.
CREATE TABLE Venue (
    vid integer PRIMARY KEY,
    name varchar NOT NULL,
    city varchar(50) NOT NULL,
    address varchar(300) NOT NULL
);

-- 
CREATE TABLE SeatInfo (
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    vid integer NOT NULL REFERENCES Venue(vid),
    mobility boolean NOT NULL, 
    PRIMARY KEY (seat_name, section_name, vid)
);

-- Concerts are booked into venues. 
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
CREATE TABLE Ticket (
    cid,
    seat_name,
    section_name,
    vid
)
--
CREATE TABLE Price (
    cid integer NOT NULL REFERENCES Concert,
    section_name varchar(20) REFERENCES SeatInfo,
    price float NOT NULL
);
