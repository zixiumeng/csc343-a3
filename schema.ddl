-- Could not: 
We can not enforce the constraint of "Every Venue has at least 10 seats" without assertion/triggers
-- Did not:

?(1) each venue has no less than 1 section.
THIS CAN BE ENFORCED BY TICKET PRIMARY KEY(2) each ticket_id cannot be bought twice 
(3) each seat belongs to exactly one venue.
-- Assumptions:
?(1) a buyer can purchanse multiple tickets at the same point of time
(2) any seat has a fixed mobility for all concerts
?(3) any city can have no or multiple venues.
(4) venues can have the same name across cities, but each city only has one venue with the same name. That is, city and venue_name uniquly define a venue.
A concert is defined by their name(not unique) and datetime.

TO DELETE:
REFERENCES只能给unique/KEY
不用concert id, use (concert_name, datetime) instead
owner 直接用phone number虽然可以但是感觉有点点奇怪 还是用owner ID吧
reference table(...) "..." is optional


drop schema if exists ticketchema cascade;
create schema ticketchema;
set search_path to ticketchema;

-- All registered Owners, each owner has a unique ownerid. 
-- An owner can be a person, company, or an organization.
-- No two owners have the same phone number.
CREATE TBALE Owner (
    ownerid integer PRIMARY KET,
    name varchar(50) NOT NULL,
    phone varchar(20) NOT NULL unique
);

-- Some people/organizations own multiple venues 
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
    unique (concert_name, datetime)
);

--
CREATE TABLE User (
    username varchar(20) PRIMARY KEY
);

--
CREATE TABLE Purchase (
    tid integer PRIMARY KEY REFERENCES Ticket,
    datetime timestamp,
    username NOT NULL REFERENCES User
);

-- 
CREATE TABLE Ticket (
    tid integer PRIMARY KEY,
    cid REFERENCES Concert
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    unique(concert_name, datetime, seat_name, section_name)
);

--
CREATE TABLE Price (
    concert_name,
    datetime, 

    cid integer NOT NULL REFERENCES Concert,
    section_name varchar(20) REFERENCES SeatInfo,
    price float NOT NULL
);
