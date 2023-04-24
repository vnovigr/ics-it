DROP DATABASE IF EXISTS dbo;
CREATE DATABASE IF NOT EXISTS dbo;
USE dbo;

CREATE TABLE IF NOT EXISTS dbo.SKU(
	ID_Identity BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Code VARCHAR(45) UNIQUE,
    Name VARCHAR(30)
);

-- Установка разделителя для определения хранимой процедуры
DELIMITER $$

-- Создание хранимой процедуры для добавления новых записей и вычисления кода
CREATE PROCEDURE AddSKU(IN product_name VARCHAR(255))
BEGIN
    INSERT INTO SKU (Name) VALUES (product_name);
    SET @new_id = LAST_INSERT_ID();
    SET @new_code = CONCAT('s', @new_id);
    UPDATE SKU SET Code = @new_code WHERE ID = @new_id;
END $$

-- Восстановление стандартного разделителя
DELIMITER ;

CREATE TABLE IF NOT EXISTS Family(
	ID_Identity BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SurName VARCHAR(45),
    BudgetValue INT
);

CREATE TABLE IF NOT EXISTS Basket(
	ID_Identity BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_SKU BIGINT UNSIGNED NOT NULL,
    ID_Family BIGINT UNSIGNED NOT NULL,
    Quantity INT UNSIGNED,
    Value INT UNSIGNED,
    PurchaseDate DATETIME DEFAULT NOW(),
    DiscountValue INT,
    
    FOREIGN KEY (ID_SKU) REFERENCES SKU(ID_Identity),
    FOREIGN KEY (ID_Family) REFERENCES Family(ID_Identity)
);