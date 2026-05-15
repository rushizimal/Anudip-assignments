mysql> CREATE DATABASE Aggregation;
Query OK, 1 row affected (0.01 sec)

mysql> use aggregation;
Database changed

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(10) | NO   | PRI | NULL    |       |
| product_name   | varchar(10) | NO   |     | NULL    |       |
| category       | varchar(10) | NO   |     | NULL    |       |
| sub_category   | varchar(10) | NO   |     | NULL    |       |
| original_price | varchar(10) | NO   |     | NULL    |       |
| selling_price  | varchar(10) | NO   |     | NULL    |       |
| stock          | varchar(10) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select * from product;
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| product_id | product_name | category  | sub_category | original_price | selling_price | stock |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| P101       | chair        | furniture | home         | 6000           | 5000          | 12    |
| P102       | Table        | Furniture | home         | 8000           | 7500          | 14    |
| P103       | Mobile       | Electric  | home         | 20000          | 17000         | 20    |
| P104       | Jeans        | Clothing  | home         | 2000           | 1500          | 14    |
| P105       | Webcam       | Electric  | home         | 6000           | 5500          | 13    |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by stock desc;
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| product_id | product_name | category  | sub_category | original_price | selling_price | stock |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| P103       | Mobile       | Electric  | home         | 20000          | 17000         | 20    |
| P102       | Table        | Furniture | home         | 8000           | 7500          | 14    |
| P104       | Jeans        | Clothing  | home         | 2000           | 1500          | 14    |
| P105       | Webcam       | Electric  | home         | 6000           | 5500          | 13    |
| P101       | chair        | furniture | home         | 6000           | 5000          | 12    |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by stock desc limit 3;
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| product_id | product_name | category  | sub_category | original_price | selling_price | stock |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
| P103       | Mobile       | Electric  | home         | 20000          | 17000         | 20    |
| P102       | Table        | Furniture | home         | 8000           | 7500          | 14    |
| P104       | Jeans        | Clothing  | home         | 2000           | 1500          | 14    |
+------------+--------------+-----------+--------------+----------------+---------------+-------+
3 rows in set (0.00 sec)

mysql> select * from emmployee;
+-------------+----------+------------+--------+
| employee_id | name     | department | salary |
+-------------+----------+------------+--------+
| E101        | RUSHI    | hr         |  40000 |
| E102        | samadhan | it         |   4000 |
| E103        | vinit    | it         |   5000 |
+-------------+----------+------------+--------+
3 rows in set (0.00 sec)

mysql> insert into employee values('E104','rohit','finance',50000);
ERROR 1146 (42S02): Table 'aggregation.employee' doesn't exist
mysql> insert into emmployee values('E104','rohit','finance',50000);
Query OK, 1 row affected (0.02 sec)

mysql> select * from emmployee;
+-------------+----------+------------+--------+
| employee_id | name     | department | salary |
+-------------+----------+------------+--------+
| E101        | RUSHI    | hr         |  40000 |
| E102        | samadhan | it         |   4000 |
| E103        | vinit    | it         |   5000 |
| E104        | rohit    | finance    |  50000 |
+-------------+----------+------------+--------+
4 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee group by department;
ERROR 1146 (42S02): Table 'aggregation.employee' doesn't exist
mysql> select department, count(*) as total_employee from emmployee group by department;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| hr         |              1 |
| it         |              2 |
| finance    |              1 |
+------------+----------------+
3 rows in set (0.01 sec)

mysql> alter table emmployee rename to employee;
Query OK, 0 rows affected (0.04 sec)

mysql> select department, sum(salary) as total_salary from employee group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| hr         |        40000 |
| it         |         9000 |
| finance    |        50000 |
+------------+--------------+
3 rows in set (0.01 sec)

mysql> select department, avg(salary) as total_salary from employee group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| hr         |   40000.0000 |
| it         |    4500.0000 |
| finance    |   50000.0000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as average_salary from employee group by department;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| hr         |     40000.0000 |
| it         |      4500.0000 |
| finance    |     50000.0000 |
+------------+----------------+
3 rows in set (0.01 sec)

mysql> select department, salary, count(*) from employee group by department, salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| hr         |  40000 |        1 |
| it         |   4000 |        1 |
| it         |   5000 |        1 |
| finance    |  50000 |        1 |
+------------+--------+----------+
4 rows in set (0.01 sec)

mysql> select * from emmployee;
ERROR 1146 (42S02): Table 'aggregation.emmployee' doesn't exist
mysql> select * from employee;
+-------------+----------+------------+--------+
| employee_id | name     | department | salary |
+-------------+----------+------------+--------+
| E101        | RUSHI    | hr         |  40000 |
| E102        | samadhan | it         |   4000 |
| E103        | vinit    | it         |   5000 |
| E104        | rohit    | finance    |  50000 |
+-------------+----------+------------+--------+
4 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee group by department having count(*) > 1;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| it         |              2 |
+------------+----------------+
1 row in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 8000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| hr         |        40000 |
| it         |         9000 |
| finance    |        50000 |
+------------+--------------+
3 rows in set (0.01 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 2000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| hr         |        40000 |
| it         |         9000 |
| finance    |        50000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as average_salary from employee group by department having avg(salary) > 5000;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| hr         |     40000.0000 |
| finance    |     50000.0000 |
+------------+----------------+
2 rows in set (0.00 sec)

mysql> select * from employee;
+-------------+----------+------------+--------+
| employee_id | name     | department | salary |
+-------------+----------+------------+--------+
| E101        | RUSHI    | hr         |  40000 |
| E102        | samadhan | it         |   4000 |
| E103        | vinit    | it         |   5000 |
| E104        | rohit    | finance    |  50000 |
+-------------+----------+------------+--------+
4 rows in set (0.00 sec)
