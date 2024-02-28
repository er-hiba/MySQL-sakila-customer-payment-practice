mysql> use sakila;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_copy                 |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
24 rows in set (0.01 sec)

mysql> desc customer;
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| Field       | Type              | Null | Key | Default           | Extra                                         |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| customer_id | smallint unsigned | NO   | PRI | NULL              | auto_increment                                |
| store_id    | tinyint unsigned  | NO   | MUL | NULL              |                                               |
| first_name  | varchar(45)       | NO   |     | NULL              |                                               |
| last_name   | varchar(45)       | NO   | MUL | NULL              |                                               |
| email       | varchar(50)       | YES  |     | NULL              |                                               |
| address_id  | smallint unsigned | NO   | MUL | NULL              |                                               |
| active      | tinyint(1)        | NO   |     | 1                 |                                               |
| create_date | datetime          | NO   |     | NULL              |                                               |
| last_update | timestamp         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
9 rows in set (0.00 sec)

mysql> -- Customers whose first name is Terry --
mysql> select customer_id, first_name, last_name from customer
    -> where first_name = 'Terry' ;
+-------------+------------+-----------+
| customer_id | first_name | last_name |
+-------------+------------+-----------+
|         253 | TERRY      | CARLSON   |
|         355 | TERRY      | GRISSOM   |
+-------------+------------+-----------+
2 rows in set (0.00 sec)

mysql> -- Customers whose first name is Jessie or the last name is Torres --
mysql> select customer_id, first_name, last_name from customer
    -> where first_name = 'Jessie' or last_name = 'Torres' ;
+-------------+------------+-----------+
| customer_id | first_name | last_name |
+-------------+------------+-----------+
|          67 | KELLY      | TORRES    |
|         215 | JESSIE     | BANKS     |
|         533 | JESSIE     | MILAM     |
+-------------+------------+-----------+
3 rows in set (0.00 sec)

mysql> desc payment ;
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| Field        | Type              | Null | Key | Default           | Extra                                         |
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| payment_id   | smallint unsigned | NO   | PRI | NULL              | auto_increment                                |
| customer_id  | smallint unsigned | NO   | MUL | NULL              |                                               |
| staff_id     | tinyint unsigned  | NO   | MUL | NULL              |                                               |
| rental_id    | int               | YES  | MUL | NULL              |                                               |
| amount       | decimal(5,2)      | NO   |     | NULL              |                                               |
| payment_date | datetime          | NO   |     | NULL              |                                               |
| last_update  | timestamp         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.00 sec)

mysql> desc staff ;
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| Field       | Type              | Null | Key | Default           | Extra                                         |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| staff_id    | tinyint unsigned  | NO   | PRI | NULL              | auto_increment                                |
| first_name  | varchar(45)       | NO   |     | NULL              |                                               |
| last_name   | varchar(45)       | NO   |     | NULL              |                                               |
| address_id  | smallint unsigned | NO   | MUL | NULL              |                                               |
| picture     | blob              | YES  |     | NULL              |                                               |
| email       | varchar(50)       | YES  |     | NULL              |                                               |
| store_id    | tinyint unsigned  | NO   | MUL | NULL              |                                               |
| active      | tinyint(1)        | NO   |     | 1                 |                                               |
| username    | varchar(16)       | NO   |     | NULL              |                                               |
| password    | varchar(40)       | YES  |     | NULL              |                                               |
| last_update | timestamp         | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
11 rows in set (0.00 sec)

mysql> desc customer;
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| Field       | Type              | Null | Key | Default           | Extra                                         |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| customer_id | smallint unsigned | NO   | PRI | NULL              | auto_increment                                |
| store_id    | tinyint unsigned  | NO   | MUL | NULL              |                                               |
| first_name  | varchar(45)       | NO   |     | NULL              |                                               |
| last_name   | varchar(45)       | NO   | MUL | NULL              |                                               |
| email       | varchar(50)       | YES  |     | NULL              |                                               |
| address_id  | smallint unsigned | NO   | MUL | NULL              |                                               |
| active      | tinyint(1)        | NO   |     | 1                 |                                               |
| create_date | datetime          | NO   |     | NULL              |                                               |
| last_update | timestamp         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+-------------+-------------------+------+-----+-------------------+-----------------------------------------------+
9 rows in set (0.00 sec)

mysql> select staff_id, first_name from staff
    -> where first_name = 'mike' ;
+----------+------------+
| staff_id | first_name |
+----------+------------+
|        1 | Mike       |
+----------+------------+
1 row in set (0.01 sec)

mysql> select customer_id , first_name, last_name from customer
    -> where first_name = 'Sue' and last_name = 'Peters' ;
+-------------+------------+-----------+
| customer_id | first_name | last_name |
+-------------+------------+-----------+
|         197 | SUE        | PETERS    |
+-------------+------------+-----------+
1 row in set (0.01 sec)

mysql> -- Payments made by customer Sue Peters in excess of 1$ at employee Mike --
mysql> select payment_id, customer_id, amount, staff_id from payment
    -> where customer_id = 197 and amount > 1 and staff_id = 1 ;
+------------+-------------+--------+----------+
| payment_id | customer_id | amount | staff_id |
+------------+-------------+--------+----------+
|       5318 |         197 |   2.99 |        1 |
|       5320 |         197 |   2.99 |        1 |
|       5322 |         197 |   3.99 |        1 |
|       5326 |         197 |   2.99 |        1 |
|       5329 |         197 |   2.99 |        1 |
|       5330 |         197 |   4.99 |        1 |
|       5332 |         197 |   8.99 |        1 |
|       5336 |         197 |   2.99 |        1 |
|       5343 |         197 |   2.99 |        1 |
|       5344 |         197 |   4.99 |        1 |
|       5345 |         197 |   4.99 |        1 |
|       5346 |         197 |   4.99 |        1 |
|       5347 |         197 |   2.99 |        1 |
|       5348 |         197 |   1.99 |        1 |
|       5351 |         197 |   9.99 |        1 |
|       5353 |         197 |   2.99 |        1 |
|       5355 |         197 |   8.99 |        1 |
+------------+-------------+--------+----------+
17 rows in set (0.02 sec)

mysql> -- Payments made by customer Sue Peters in excess of 1$ at employee Mike and made before August 2005--
mysql> select payment_id, customer_id, amount, staff_id, payment_date from payment
    -> where customer_id = 197 and amount > 1 and staff_id = 1 and payment_date < '2005-08-01';
+------------+-------------+--------+----------+---------------------+
| payment_id | customer_id | amount | staff_id | payment_date        |
+------------+-------------+--------+----------+---------------------+
|       5318 |         197 |   2.99 |        1 | 2005-05-27 11:03:55 |
|       5320 |         197 |   2.99 |        1 | 2005-05-29 00:09:48 |
|       5322 |         197 |   3.99 |        1 | 2005-05-30 10:11:29 |
|       5326 |         197 |   2.99 |        1 | 2005-06-15 22:07:09 |
|       5329 |         197 |   2.99 |        1 | 2005-06-17 18:06:14 |
|       5330 |         197 |   4.99 |        1 | 2005-06-19 16:37:24 |
|       5332 |         197 |   8.99 |        1 | 2005-07-08 01:09:09 |
|       5336 |         197 |   2.99 |        1 | 2005-07-28 21:23:06 |
+------------+-------------+--------+----------+---------------------+
8 rows in set (0.01 sec)

mysql>
