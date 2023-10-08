--1 
-- Create table named Customer with the following description. (create table, like)
CREATE TABLE Customer(
	CustomerId	CHAR (5) Primary key CHECK (CustomerID LIKE 'CS[0-9][0-9][0-9]'),
	CustomerName VARCHAR (70) NOT NULL CHECK (LEN (CustomerName)>5 AND LEN (CustomerName)<70),
	CustomerDOB	DATE NOT NULL,
	CustomerEmail VARCHAR(254)	NOT NULL,
	CustomerPassword VARCHAR (128)	NOT NULL
)

--2
--Add a new column on Staff table named staffAddress with varchar (255) data type. Then add constraint to make sure that the staff’s email ends with ‘@musicstr.com’. (alter table, add, add constraint, like)
ALTER TABLE STAFF
ADD StaffAddress VARCHAR(255)
SELECT * FROM STAFF

ALTER TABLE STAFF
ADD CONSTRAINT CheckEmail CHECK (StaffEmail LIKE '%@musicstr.com')

--3
-- Insert the following data into Artist table (insert)
INSERT INTO Artist 
VALUES ('AR011','Bruno Mars','1985-10-08','brunomars.com')
SELECT * FROM Artist

--4
--Display Name (obtained from albumName in uppercase format) and Price for every album which price is greater than 180000.(upper)
SELECT 'Name' = UPPER(albumName), 'Price' = price
FROM Album
WHERE price > 180000

--5
-- Update data on Album table to increase price by 8000 for every album whose artist was born on 1988.(update, year)
BEGIN TRAN
UPDATE Album
SET price += 8000
FROM Artist A, Album B
WHERE B.artistId = A.artistId AND YEAR(artistDOB)=1988
ROLLBACK
SELECT*FROM Album
