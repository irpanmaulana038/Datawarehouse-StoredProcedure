CREATE DATABASE DWH;


CREATE TABLE DimCustomer(
CustomerID INT  NOT NULL,
CustomerName Varchar(50),
Address Varchar(Max) NULL,
CityName Varchar(100),
StateName Varchar(100),
Age Varchar(3) NULL,
Gender Varchar(10) NULL,
Email Varchar(50) NULL,
PRIMARY KEY(CustomerID)
);


CREATE TABLE DimAccount(
AccountID INT NOT NULL,
CustomerID INT NULL,
AccountType Varchar(10) NULL,
Balance INT NULL,
DataOpened DATETIME2(0) NULL,
Status Varchar(10) NULL,
PRIMARY KEY(AccountID),
FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID)
);


CREATE TABLE DimBranch(
BranchID INT  NOT NULL,
BranchName Varchar(50) NULL,
BranchLocation Varchar(50) NULL,
PRIMARY KEY(BranchID)
);


CREATE TABLE FactTransaction(
TransactionID INT NOT NULL,
CustomerID INT NULL,
AccountID INT NULL,
Amount INT NULL,
TransactionDate DATETIME2(0),
Transaction_type Varchar(50) NULL,
BranchID INT NULL,
PRIMARY KEY(TransactionID),
FOREIGN KEY (AccountID) REFERENCES DimAccount(AccountID),
FOREIGN KEY (BranchID) REFERENCES DimBranch(BranchID)
);
