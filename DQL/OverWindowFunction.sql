use leetcodesql;

#Create A Table Stores
Create table If Not Exists stores (id int,store_name varchar(30));
	Truncate table stores;
	insert into stores (id, store_name) values ('1','Zaandam');
    insert into stores  (id, store_name) values ('2','Amsterdam');
    insert into stores  (id, store_name) values ('3','Rotterdam');
    insert into stores  (id, store_name) values ('4','Utrecht');
# Create a Table Products
Create table If Not Exists products (id int,product_brand varchar(30), product_name varchar(30));
	Truncate table products;
	insert into products (id, product_brand,product_name) values (1,'Mr. Wellington	Earl', 'Grey');
	insert into products (id, product_brand,product_name) values (2,'Karnataka Tea Company', 'Kashmir Tchai');
    insert into products (id, product_brand,product_name) values (3,'Fukuyama & Co.', '	Matcha');
    insert into products (id, product_brand,product_name) values (4,'Fukuyama & Co.', 'Sencha');
# Create a Table Inventory
Create table If Not Exists inventory (id int,inventory_date date,opening_quantity int,closing_quantity int,product_id int ,store_id int);
Truncate table inventory;
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (1,'2021-12-06','13',8,1,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (2,'2021-12-07','8',1,1,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (3,'2021-12-08','52',50,1,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (4,'2021-12-09','50',44,1,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (5,'2021-12-10','44',32,1,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (6,'2021-12-06',0,0,2,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (7,'2021-12-07',0,0,2,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (8,'2021-12-08','28',20,2,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (9,'2021-12-09','20',17,2,1);
insert into inventory (id,inventory_date,opening_quantity,closing_quantity,product_id,store_id) values (10,'2021-12-10','17',17,2,1);
/* Understanding of Table inventory
There are NULL values. That means tea was not available when the store opened or closed. 
In the above, product_id = 2 in store_id = 1 wasn’t available for two days: 2021-12-06 and 2021-12-07.
Generally, the closing_quantity of a given day is the opening_quantity of the following day. 
If it’s not, then it means a new order was delivered and accounted for before the store opened.*/

/*Task : to show the inventory date, the quantity at store open, and the quantity at store close. 
We also want the highest quantity at store close for each day regardless of the store or the product.*/
# With PARTITION BY but Without ORDER BY
SELECT  inventory_date,
        opening_quantity,
        closing_quantity,
        MAX(closing_quantity) OVER (PARTITION BY inventory_date) AS daily_max
FROM inventory;
#With PARTITION BY and ORDER BY
/*query that displays the product brand, the product name, and the inventory date. 
I also want to show the daily quantity sold. 
In addition, I want to see the daily cumulative quantity sold per brand across all stores.*/
SELECT  product_brand,
        product_name,
        inventory_date,
        opening_quantity - closing_quantity AS daily_sales,
        SUM(opening_quantity - closing_quantity) OVER (PARTITION BY product_brand ORDER BY inventory_date) AS cumulative_sales_per_brand
FROM products p
JOIN inventory i
ON p.id = i.product_id;
/* Now, say you want to show the store name, the inventory date, the brand, and the products.
 Again, we will show the daily quantity sold, but we will also show the average daily quantity sold by each store. 
This is a cumulative average that changes with every passing day and from the lowest to the highest daily quantity sold.*/

SELECT  store_name,
        inventory_date,
        product_brand,
        product_name,
        opening_quantity - closing_quantity AS daily_sales,
        AVG(opening_quantity - closing_quantity) OVER (
PARTITION BY store_name
ORDER BY inventory_date, opening_quantity - closing_quantity
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS cumulative_avg_sales
FROM stores s
JOIN inventory i
ON s.id = i.store_id
JOIN products p
ON p.id = i.product_id;
/* If order by in over() is omitted. then, we use ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING. 
This means the window frame is all rows (all rows before the current row, the current row, and all rows after the current row).*/

/* If order by in over() is omitted. then, the default window frame is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW. 
This means all values (not rows!) before the current row and the current row itself. */

#Without PARTITION BY but With ORDER BY DESC
/* I want to rank the data by quantity at store open in descending order. In addition to the rank, 
I want the result to show the following columns: inventory_date, product_brand, product_name, and opening_quantity.  */

SELECT  inventory_date,
        product_brand,
        product_name,
        opening_quantity,
        DENSE_RANK() OVER (ORDER BY opening_quantity DESC)
FROM inventory i
JOIN products p
ON i.product_id = p.id;
/*ROW_NUMBER(). Returns the sequence number of the row in the result set.

RANK() - Similar to ROW_NUMBER(), but can take a column as an argument. The rank order is determined over the value of this column. 
If two or more rows have the same value in this column, these rows all get the same rank. 
The next rank will continue from the equivalent number of rows up; 
for example, if two rows share a rank of 10, the next rank will be 12.

DENSE_RANK() - Very similar to RANK(), except it doesn’t have “gaps.” 
In the previous example, if two rows share a rank of 10, the next rank will be 11.

NTILE - Used to calculate quartiles, deciles, or any other percentiles.
LAG & LEAD - Used to pull values from the previous (LAG) or the following (LEAD) row.*/
