
-- STORED PROCEDURE 1 – Check total stock by category.

DELIMITER #
CREATE PROCEDURE GetTotalStockByCategory()
BEGIN
SELECT catergory_name, SUM(QtyOnHand) AS TotalStock
    FROM product
    JOIN category ON product.category_id = category.category_id
    GROUP BY catergory_name;
END # ;


-- STORED PROCEDURE 2 - Top 10 products

DELIMITER #
CREATE PROCEDURE GetTop10Products()
BEGIN
SELECT *
FROM
(SELECT p.product_name, SUM(t.QuantitySold) AS TotalQuantitySold
    FROM TransactionsDetails t
    JOIN product p
    ON t.Product_ID = p.product_id
    GROUP BY product_name) x
    ORDER BY TotalQuantitySold DESC
    LIMIT 10;
END # ;



-- STORED PROCEDURE 3 - GetCustomerCountByGender

DELIMITER #
CREATE PROCEDURE GetCustomerCountByGender()
BEGIN
SELECT gender, COUNT(*) AS NumCustomers
    FROM customer
    GROUP BY gender;
END # ;





-- TRIGGER 1 – Check Quantity

DELIMITER #
CREATE TRIGGER check_quantity
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
IF new.QtyOnHand < 5 THEN
    INSERT INTO LowStock (ProductName, QuantityOnHand) VALUES (new.product_name, new.QtyOnHand);
  END IF  END IF;
END# ;


-- TRIGGER 2  - UPDATE transactionsdetails

DELIMITER #
CREATE TRIGGER update_transactiondetails
AFTER INSERT ON transactiondetails
FOR EACH ROW
BEGIN
UPDATE product
  SET QtyOnHand  = QtyOnHand  - NEW.QuantitySold
  WHERE product.Product_ID = NEW.Product_ID
END# ;



-- TRIGGER 3 - TransactionManager

DELIMITER #
CREATE TRIGGER TransactionManager
AFTER INSERT 
ON TransactionStaging
FOR EACH ROW
BEGIN
INSERT INTO transactions 
SELECT new.transaction_ID, new.customer_id, SUM(new.order_amount) as order_amount, new.order_date, new.ship_date, new.sales_rep_id, new.shipment_id 
FROM TransactionStaging 
GROUP BY new.transaction_ID, new.customer_id, new.order_date, new.ship_date, new.sales_rep_id, new.shipment_id;
INSERT INTO TransactionsDetails VALUES (new.TransctionDetail_ID ,new.Transaction_ID, new.Product_ID ,new.UnitPrice,new.QuantitySold);
END# ;
