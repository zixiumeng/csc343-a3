-- Insert into Owners
INSERT INTO Owner VALUES
    (1, 'Corporation of Massey Hall and Roy Thomson Hall', '647-888-8888')
    (2, 'Maple Leaf Sports & Entertainment', '647-999-8080');

-- Insert into Ownership
INSERT INTO Ownership VALUES
    (1, 1), (1, 2), (2, 3);



-- Insert into Venues
INSERT INTO Venue VALUES
    (1, 'Massey Hall', 'Toronto', '178 Victoria Street'), 
    (2, 'Roy Thomson Hall', 'Toronto', '60 Simcoe St'),
    (3, 'Scotiabank Arena', 'Toronto', '40 Bay St');

-- Insert into SectionInfo
INSERT INTO SectionInfo VALUES
    ('floor', 'Massey Hall'),
    ('balcony', 'Massey Hall'),
    ('main hall', 'Roy Thomson Hall'),
    ('100', 'Scotiabank Arena'),
    ('200', 'Scotiabank Arena'),
    ('300', 'Scotiabank Arena');


-- Insert into SeatInfo
INSERT INTO SeatInfo VALUES
    ('A1', 'floor', 1， True),
    ('A2', 'floor', 1， True),
    ('A3', 'floor', 1， True),
    ('A4', 'floor', 1， True),
    ('A5', 'floor', 1， True),
    ('A6', 'floor', 1， True),
    ('A7', 'floor', 1， True),
    ('A8', 'floor', 1， True),
    ('A9', 'floor', 1， True),
    ('A10', 'floor', 1， True),
    ('B1', 'floor', 1， False),
    ('B2', 'floor', 1， False),
    ('B3', 'floor', 1， False),
    ('B4', 'floor', 1， False),
    ('B5', 'floor', 1， False),
    ('B6', 'floor', 1， False),
    ('B7', 'floor', 1， False),
    ('B8', 'floor', 1， False),
    ('B9', 'floor', 1， False),
    ('B10', 'floor', 1， False),
    ('C1', 'balcony', 1， False),
    ('C2', 'balcony', 1， False),
    ('C3', 'balcony', 1， False),
    ('C4', 'balcony', 1， False),
    ('C5', 'balcony', 1， False),
    ('AA1', 'main hall', 2， False),
    ('AA2', 'main hall', 2， False),
    ('AA3', 'main hall', 2， False),
    ('BB1', 'main hall', 2， False),
    ('BB2', 'main hall', 2， False),
    ('BB3', 'main hall', 2， False),
    ('BB4', 'main hall', 2， False),
    ('BB5', 'main hall', 2， False),
    ('BB6', 'main hall', 2， False),
    ('BB7', 'main hall', 2， False),
    ('BB8', 'main hall', 2， False),
    ('CC1', 'main hall', 2， False),
    ('CC2', 'main hall', 2， False),
    ('CC3', 'main hall', 2， False),
    ('CC4', 'main hall', 2， False),
    ('CC5', 'main hall', 2， False),
    ('CC6', 'main hall', 2， False),
    ('CC7', 'main hall', 2， False),
    ('CC8', 'main hall', 2， False),
    ('CC9', 'main hall', 2， False),
    ('CC10', 'main hall', 2， False),
    ('row1, seat1', '100', 3，True),
    ('row1, seat2', '100', 3，True),
    ('row1, seat3', '100', 3，True),
    ('row1, seat4', '100', 3，True),
    ('row1, seat5', '100', 3，True),
    ('row2, seat1', '100', 3，True),
    ('row2, seat2', '100', 3，True),
    ('row2, seat3', '100', 3，True),
    ('row2, seat4', '100', 3，True),
    ('row2, seat5', '100', 3，True),
    ('row1, seat1', '200', 3，False),
    ('row1, seat2', '200', 3，False),
    ('row1, seat3', '200', 3，False),
    ('row1, seat4', '200', 3，False),
    ('row1, seat5', '200', 3，False),
    ('row2, seat1', '200', 3，False),
    ('row2, seat2', '200', 3，False),
    ('row2, seat3', '200', 3，False),
    ('row2, seat4', '200', 3，False),
    ('row2, seat5', '200', 3，False),
    ('row1, seat1', '300', 3，False),
    ('row1, seat2', '300', 3，False),
    ('row1, seat3', '300', 3，False),
    ('row1, seat4', '300', 3，False),
    ('row1, seat5', '300', 3，False),
    ('row2, seat1', '300', 3，False),
    ('row2, seat2', '300', 3，False),
    ('row2, seat3', '300', 3，False),
    ('row2, seat4', '300', 3，False),
    ('row2, seat5', '300', 3，False);
    

-- Insert into Concert
INSERT INTO Concert VALUES
    (1, 'Ron Sexsmith', '2022-12-03 19:30:00', 1),
    (2, 'Women''s Blues Review', '2022-11-23 20:00:00', 1),
    (3, 'Mariah Carey - Merry Christmas to all', '2022-12-09 20:00:00', 3),
    (4, 'Mariah Carey - Merry Christmas to all', '2022-12-11 20:00:00', 3),
    (5, 'TSO - Elf in concert', '2022-12-09 19:30:00', 2),
    (6, 'TSO - Elf in concert', '2022-12-10 14:30:00', 2),
    (7, 'TSO - Elf in concert', '2022-12-10 19:30:00', 2);
    
-- Insert into price
INSERT INTO Price VALUES
    (1, 'floor', 130),
    (1, 'balcony', 99),
    (2, 'floor', 150),
    (2, 'balcony', 125),
    (3, '100', 986),
    (3, '200', 244),
    (3, '300', 176),
    (4, '100', 936),
    (4, '200', 194),
    (4, '300', 126),
    (5, 'main hall', 159),
    (6, 'main hall', 159),
    (7, 'main hall', 159);
    
-- Insert into UserInfo
INSERT INTO UserInfo VALUES
    (ahightower),
    (d_targaryen),
    (cristonc);


-- Insert into Purchase
INSERT INTO Purchase VALUES
    (1, '2022-11-11 12:00:00', 'ahightower'),
    (2, '2022-11-11 12:00:00', 'ahightower'),
    (3, '2022-11-11 21:00:00', 'd_targaryen'),
    (4, '2022-11-11 21:00:00', 'd_targaryen'),
    (5, '2022-11-11 22:00:00', 'cristonc'),
    (6, '2022-11-11 22:00:00', 'cristonc'),
    (7, '2022-11-11 22:00:00', 'cristonc');

-- Insert into Ticket
INSERT INTO Ticket VALUES
    (1, 2, 'A5', 'floor'),
    (2, 2, 'C2', 'balcony'),
    (3, 1, 'B3', 'floor'),
    (4, 7, 'BB7', 'main hall'),
    (5, 3, 'row1, seat3', '100'),
    (6, 4, 'row2, seat3', '200'),
    (7, 4, 'row2, seat4', '200');
    
    
    
    
    
