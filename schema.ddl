-- Could not: We do not use 
-- Did not:
-- Extra constraints:
-- Assumptions:

drop schema if exists ticketchema cascade;
create schema ticketchema;
set search_path to ticketchema;

-- All registered Venue.
CREATE TABLE Venue (
    vid integer PRIMARY KEY,
    name varchar NOT NULL,
    city varchar(50) NOT NULL,
    address varchar(300) NOT NULL
);

-- All registered Owners, each owner has a unique ownerid. 
CREATE TBALE Owner (
    ownerid integer PRIMARY KEY,
    owner varchar NOT NULL,
    phone integer NOT NULL unique
);

-- 
CREATE TABLE Ownership (
    ownerid integer NOT NULL REFERENCES Owner,
    vid integer PRIMARY KEY REFERENCES Venue,
);

--
CREATE TABLE SeatInfo (
    seat_name varchar(10) NOT NULL,
    section_name varchar(20) NOT NULL,
    vid integer NOT NULL REFERENCES Venue,
    mobility boolean NOT NULL, 
    PRIMARY KEY (seat_name, section_name, vid)
);

--
CREATE TABLE Concert (
    cid integer PRIMARY KEY,
    concert_name varchar(30) NOT MULL,
    datetime timestamp NOT NULL,
    vid integer NOT NULL REFERENCES Venue, 
    UNIQUE (concert_name, datetime)
);

--
CREATE TABLE User (
    username varchar(20) PRIMARY KEY
);

--
CREATE TABLE Purchase (
    username varchar(20) NOT NULL REFERENCES User,
    cid NOT NULL REFERENCES Concert,
    seat_name varchar(10) NOT NULL REFERENCES SeatInfo,
    section_name varchar(20) NOT NULL REFERENCES SeatInfo,
    vid integer NOT NULL REFERENCES Venue,
    datetime timestamp NOT NULL,
    PRIMARY KEY (username, datetime)
);

--
CREATE TABLE Price (
    cid integer NOT NULL REFERENCES Concert,
    section_name varchar(20) REFERENCES SeatInfo,
    price float NOT NULL
);
