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

-- Each section has a name, such as “floor level 1” that is unique to
-- that venue, but another venue might use the same section name.
CREATE TBALE SectionInfo (
    section_name varchar(20) NOT NULL,
    vid integer NOT NULL REFERENCES Venue,
    PRIMARY KEY (section_name, vid)
)

-- Each seat has a name, and it belogns to exactly one section
-- Each section has a name, such as “floor level 1” that is unique to
-- that venue, but another venue might use the same section name.
-- Seat names do not repeat within the same section in a venue. 
-- Some seats are accessible to people with mobility issues. 
CREATE TABLE SeatInfo (
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    vid integer NOT NULL REFERENCES Venue(vid),
    mobility boolean NOT NULL, 
    PRIMARY KEY (seat_name, section_name, vid), 
    (section_name, vid) REFERENCES SectionInfo(section_name, vid)
);

-- Concerts are booked into venues. Every Concert has a name, a date and time and is in exactly one venue. 
-- Venue can only have one concert at a given time.
CREATE TABLE Concert (
    cid integer PRIMARY KEY,
    concert_name varchar(30) NOT MULL,
    datetime timestamp NOT NULL,
    vid integer NOT NULL REFERENCES Venue(vid),
    unique (concert_name, datetime), 
    unique(vid, datetime)
);

-- Users of the app have a unique username.
CREATE TABLE User (
    username varchar(20) PRIMARY KEY
);

-- A user can purchase one or more tickets to any concert.
CREATE TABLE Purchase (
    tid integer PRIMARY KEY REFERENCES Ticket,
    datetime timestamp,
    username NOT NULL REFERENCES User
);

-- A ticket of the concert, with ticket_id, concert_id, seat_name, section_name on it. 
-- Ticket
CREATE TABLE Ticket (
    tid integer PRIMARY KEY,
    cid integer NOT NULL REFERENCES Concert
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    unique(cid, seat_name, section_name)
);

-- The price of a ticket depends the concert and the section in which the seat is located in the venue.
CREATE TABLE Price (
    cid integer NOT NULL REFERENCES Concert,
    section_name varchar(20) NOT NULL,
    price float NOT NULL,
    PRIMARY KEY (cid, section)
);
