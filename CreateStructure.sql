DROP DATABASE IF EXISTS dbo;
CREATE DATABASE dbo;

DROP TABLE IF EXISTS SKU;
CREATE TABLE SKU(
	ID_Identity INT, 
    Code VARCHAR(45) UNIQUE,
    Name VARCHAR(30)
);

DROP TABLE IF EXISTS Family;
CREATE TABLE Family(
	ID_Identity INT,
    SurName VARCHAR(45),
    BudgetValue INT
);

DROP TABLE IF EXISTS Basket;
CREATE TABLE Basket(
	ID_Identity INT,
    ID_SKU INT,
    ID_Family INT,
    Quantity INT UNSIGNED,
    Value INT UNSIGNED,
    PurchaseDate DATETIME DEFAULT NOW(),
    DiscountValue INT,
    
    FOREIGN KEY (ID_SKU) REFERENCES SKU(ID_Identity),
    FOREIGN KEY (ID_Family) REFERENCES Family(ID_Identity)
);