DROP TABLE ResidentPhones;
DROP TABLE ResidentTestingCenter;
DROP TABLE Resident;
DROP TABLE TestingCenter;
DROP TABLE CityCounty;
DROP TABLE Zip;
DROP TABLE ZipCity;
DROP TABLE City;
DROP TABLE County;
DROP TABLE ResidentZip;


CREATE TABLE County (
    CountyID INT PRIMARY KEY,
    CountyName VARCHAR(200),
    CountyPopulation INT
);


CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(300),
    CityPopulation INT
);


CREATE TABLE Zip (
    ZipID INT PRIMARY KEY,
    ZipCode VARCHAR(10)
);


CREATE TABLE CityCounty (
    CityID INT,
    CountyID INT,
    PRIMARY KEY (CityID, CountyID),
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (CountyID) REFERENCES County(CountyID)
);


CREATE TABLE Resident (
    ResidentID INT PRIMARY KEY,
    SSN VARCHAR(9) UNIQUE NOT NULL,
    ResidentName VARCHAR(500) NOT NULL,
    FirstName VARCHAR(500) NOT NULL,
    LastName VARCHAR(500) NOT NULL,
    ResidentAddr VARCHAR(2000) NOT NULL,
    BirthDate DATE NOT NULL,
    Age INT 
);


CREATE TABLE TestingCenter (
    TestCenterID INT PRIMARY KEY,
    TestCenterName VARCHAR(500) NOT NULL,
    TestCenterPhone VARCHAR(11) NOT NULL,
    TestCenterAddr VARCHAR(100) NOT NULL
);


CREATE TABLE ResidentTestingCenter (
    ResidentID INT,
    TestCenterID INT,
    TestingDate DATE,
    TestingResult VARCHAR(100),
    PRIMARY KEY (ResidentID, TestCenterID, TestingDate),
    FOREIGN KEY (ResidentID) REFERENCES Resident(ResidentID),
    FOREIGN KEY (TestCenterID) REFERENCES TestingCenter(TestCenterID)
);


CREATE TABLE ResidentPhones (
    ResidentID INT,
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (ResidentID) REFERENCES Resident(ResidentID)
);




INSERT INTO County (CountyID, CountyName, CountyPopulation) VALUES (1, 'Los Angeles County', 10039107);
INSERT INTO County (CountyID, CountyName, CountyPopulation) VALUES (2, 'Orange County', 3175692);
INSERT INTO County (CountyID, CountyName, CountyPopulation) VALUES (3, 'San Diego County', 3338330);


INSERT INTO City (CityID, CityName, CityPopulation) VALUES (1, 'Los Angeles', 3971883);
INSERT INTO City (CityID, CityName, CityPopulation) VALUES (2, 'Anaheim', 350965);
INSERT INTO City (CityID, CityName, CityPopulation) VALUES (3, 'San Diego', 1419516);


INSERT INTO Zip (ZipID, ZipCode) VALUES (1, '90001');
INSERT INTO Zip (ZipID, ZipCode) VALUES (2, '92801');
INSERT INTO Zip (ZipID, ZipCode) VALUES (3, '92101');


INSERT INTO CityCounty (CityID, CountyID) VALUES (1, 1);
INSERT INTO CityCounty (CityID, CountyID) VALUES (2, 2);
INSERT INTO CityCounty (CityID, CountyID) VALUES (3, 3);


INSERT INTO Resident (ResidentID, SSN, ResidentName, FirstName, LastName, ResidentAddr, BirthDate, Age) VALUES 
(1, '123456789', 'John Doe', 'John', 'Doe', '123 Main St, Los Angeles, CA 90001', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 42);
INSERT INTO Resident (ResidentID, SSN, ResidentName, FirstName, LastName, ResidentAddr, BirthDate, Age) VALUES 
(2, '987654321', 'Jane Smith', 'Jane', 'Smith', '456 Oak Ave, Anaheim, CA 92801', TO_DATE('1995-09-22', 'YYYY-MM-DD'), 28);


INSERT INTO County (CountyID, CountyName, CountyPopulation) VALUES (4, 'Ventura County', 846006);
INSERT INTO County (CountyID, CountyName, CountyPopulation) VALUES (5, 'Santa Barbara County', 446499);


INSERT INTO City (CityID, CityName, CityPopulation) VALUES (4, 'Ventura', 106433);
INSERT INTO City (CityID, CityName, CityPopulation) VALUES (5, 'Santa Barbara', 92093);


INSERT INTO Zip (ZipID, ZipCode) VALUES (4, '93001');
INSERT INTO Zip (ZipID, ZipCode) VALUES (5, '93101');


INSERT INTO CityCounty (CityID, CountyID) VALUES (4, 4);
INSERT INTO CityCounty (CityID, CountyID) VALUES (5, 5);


INSERT INTO Resident (ResidentID, SSN, ResidentName, FirstName, LastName, ResidentAddr, BirthDate, Age) VALUES 
(3, '555668877', 'Bob Marley', 'Bob', 'Marley', '789 Pine St, Ventura, CA 93001', TO_DATE('1985-07-12', 'YYYY-MM-DD'), 37);
INSERT INTO Resident (ResidentID, SSN, ResidentName, FirstName, LastName, ResidentAddr, BirthDate, Age) VALUES 
(4, '112233445', 'Alice Johnson', 'Alice', 'Johnson', '321 Elm St, Santa Barbara, CA 93101', TO_DATE('1990-11-15', 'YYYY-MM-DD'), 32);


INSERT INTO TestingCenter (TestCenterID, TestCenterName, TestCenterPhone, TestCenterAddr) VALUES (1, 'Central Health Center', '1234567890', '100 Health Blvd, Los Angeles, CA');
INSERT INTO TestingCenter (TestCenterID, TestCenterName, TestCenterPhone, TestCenterAddr) VALUES (2, 'Community Clinic', '0987654321', '200 Community Rd, Anaheim, CA');


INSERT INTO ResidentTestingCenter (ResidentID, TestCenterID, TestingDate, TestingResult) VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Negative');
INSERT INTO ResidentTestingCenter (ResidentID, TestCenterID, TestingDate, TestingResult) VALUES (2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 'Positive');


INSERT INTO ResidentPhones (ResidentID, PhoneNumber) VALUES (1, '8001234567');
INSERT INTO ResidentPhones (ResidentID, PhoneNumber) VALUES (2, '8007654321');

