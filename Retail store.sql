----------------- TABLE CREATE
SELECT
    order_id,
    order_date,
    customer_id,
    customer_name,
    city,
    category,
    sub_category,
    sales,
    quantity,
    profit,
    order_year,
    order_month
FROM
    superstore_retail_data;
    
    

------------------------TABLE NAME    
SELECT *FROM superstore_retail_data;



-------------------NULL REMOVE KARNA
DELETE FROM superstore_retail_data
WHERE ORDER_ID IS NULL;




-----------BLANK/MISSING VALUES CHECK
-----------CHECK NULL VALUE ORDER_ID,CUSTOMER_NAME, SALES
SELECT *FROM superstore_retail_data
WHERE ORDER_ID IS NULL 
OR CUSTOMER_NAME IS NULL
OR SALES IS NULL;


----------------------DUPLICATE DELETE
DELETE FROM superstore_retail_data
WHERE ROWID NOT IN(
SELECT MIN(ROWID)
FROM superstore_retail_data
GROUP BY ORDER_ID);



-----------------DUPLICATE DATA REMOVE KARNA
SELECT ORDER_ID,COUNT(*) FROM superstore_retail_data
GROUP BY ORDER_ID
HAVING COUNT(*)>1;



-----------------------CHANGE DATE FORMAT
UPDATE superstore_retail_data
SET ORDER_DATE=TO_DATE(ORDER_DATE,'DD-MM-YYYY');




------------------------DATE FORMAT
SELECT ORDER_DATE FROM superstore_retail_data;




---------------------EXTRA SPACE REMOVE
UPDATE superstore_retail_data
SET CUSTOMER_NAME=TRIM(CUSTOMER_NAME),
    CITY=TRIM(CITY),
    CATEGORY=TRIM(CATEGORY),
    sub_category=TRIM(sub_category);
    
    
    

-------------------DELECT NEGATIVE VALUES
DELETE FROM superstore_retail_data
WHERE SALES <0;



    
-------------------NEGATIVE/WRONG VALUE CHECK
SELECT *FROM superstore_retail_data
WHERE SALES <0 OR PROFIT <0;




------------------------OUTLIERS CHECK
SELECT MAX(SALES),MIN(SALES),
MAX(PROFIT), MIN(PROFIT)
FROM superstore_retail_data;




-----------------------DATA TYPE CHECK
DESC superstore_retail_data;



----------------------MONTH AUR YEAR COLUMN CHECK KARNA
SELECT ORDER_DATE,EXTRACT(MONTH FROM ORDER_DATE) AS MONTH,
EXTRACT(YEAR FROM ORDER_DATE) AS YEAR
FROM superstore_retail_data;


----------------NEW COLUMN ADD KARNA YA UPADTE KARNA
ALTER TABLE superstore_retail_data
ADD(MONTH NUMBER,YEAR NUMBER);


UPDATE superstore_retail_data
SET MONTH = EXTRACT(MONTH FROM ORDER_DATE),
    YEAR = EXTRACT(YEAR FROM ORDER_DATE);
    


------------------COLUMN NAME CLEAN 
ALTER TABLE SUPERSTORE_RETAIL_DATASET RENAME COLUMN "Order ID" TO ORDER_ID;
ALTER TABLE SUPERSTORE_RETAIL_DATASET RENAME COLUMN "Order Date" TO ORDER_DATE;
ALTER TABLE SUPERSTORE_RETAIL_DATASET RENAME COLUMN "Customer Name" TO CUSTOMER_NAME;
ALTER TABLE SUPERSTORE_RETAIL_DATASET RENAME COLUMN "Sub-Category" TO SUB_CATEGORY;



------------------CLEAN DATA SAVE
CREATE TABLE SUPERSTORE_RETAIL_DATASET 
AS SELECT *FROM SUPERSTORE_RETAIL_DATASET;





