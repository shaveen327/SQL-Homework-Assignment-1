#World Database Questions:

#Easy:

#1. List all countries in South America.
SELECT Name FROM country WHERE Continent = "South America";

#2. Find the population of 'Germany'.
SELECT Population FROM country WHERE Name = "Germany";

#3. Retrieve all cities in the country 'Japan'.
SELECT Name FROM city WHERE CountryCode = “JPN”

#Medium:

#4. Find the 3 most populated countries in the "Africa" region
SELECT Name, Population FROM country WHERE Continent = "Africa" order by Population DESC LIMIT 3;

#5. Retrieve the country and its life expectancy where the population is between 1 and 5 million.
SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 and 5000000;

#6. List countries with an official language of 'French'.
SELECT country.Name FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";


#Chinook Database Questions:

#Easy:

#7. Retrieve all album titles by the artist 'AC/DC'.
SELECT Album.Title FROM Album
JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = "AC/DC";

#8. Find the name and email of customers located in 'Brazil'.
SELECT FirstName, LastName, Email FROM Customer WHERE country = "Brazil";

#9. List all playlists in the database.
SELECT Name FROM Playlist;

#Medium:

#10. Find the total number of tracks in the 'Rock' genre.
SELECT COUNT(*) AS TotalTrack FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';

#11. List all employees who report to 'Nancy Edwards'.
SELECT FirstName, LastName FROM Employee 
WHERE ReportsTo = (SELECT EmployeeId FROM Employee 
WHERE FirstName = 'Nancy' AND LastName = 'Edwards');

#12. Calculate the total sales per customer by summing the total amount in invoices.
SELECT CustomerID, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY CustomerID;


#Part 2: Create Your Own Database
#In this section, you will design and create a new database, insert some data, and write queries to extract information from it. You can use the database with YOUR compute ID as the name of the database. You have write privileges there.

#1. **Design Your Database:** Create a database for a small business of your choice, with at least 3 tables with appropriate columns.

#2. **Create the Tables:** Write SQL statements to create the tables for your database. Ensure that each table has a primary key and relationships where appropriate.
CREATE TABLE Customers ( 
CustomerID INT AUTO_INCREMENT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100), 
Email VARCHAR(100) NOT NULL);

CREATE TABLE Orders (
OrderID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL (5,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

CREATE TABLE Bowl (
BowlID INT AUTO_INCREMENT PRIMARY KEY, 
Name VARCHAR(255) NOT NULL, 
Category VARCHAR(100), 
Price DECIMAL(5, 2) NOT NULL);

#3. **Insert Data:** Insert at least 5 rows of data into each of the tables you created.
INSERT INTO Customers (FirstName, LastName, Email) VALUES
('Lupita', 'Nyongo', 'lupita.nyongo@virginia.edu'),
('Jackie', 'Chan', 'jackie.chan@virginia.edu'),
('Simone', 'Ashley', 'simone.ashley@virginia.edu'),
('Woody', 'Harrelson', 'woody.harrelson@virginia.edu'),
('Diana', 'Ross', 'diana.ross@virginia.edu');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-01-02', 13.25),
(2, '2024-02-03', 14.25),
(3, '2024-03-04', 13.65),
(4, '2024-04-05', 12.85),
(5, '2024-05-06', 13.25);

INSERT INTO Bowl (Name, Category, Price) VALUES
('Apollo', 'Signature Grain Bowls', 13.25),
('Balboa', 'Signature Grain Bowls', 14.25),
('Mayweather', 'Signature Salads', 13.65),
('Pesto Caesar', 'Signature Salads', 12.85),
('Tamari', 'Signature Salads', 13.25);

#4. **Write Queries:** Write at least 3 queries to extract data from your new database
SELECT * FROM Customers ORDER BY FirstName;
SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;
SELECT Name FROM Bowl WHERE Category = 'Signature Grain Bowls';

