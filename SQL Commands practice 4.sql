mysql> create database joints;
Query OK, 1 row affected (0.11 sec)

mysql> use joints;
Database changed
mysql> create table department(dept_id int primary key not null,dept_name varchar(30) not null);
Query OK, 0 rows affected (0.08 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.08 sec)

mysql> insert into department values(1,'HR'),(2,'IT'),(3,'FINANCE'),(4,'MARKETING');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.00 sec)


mysql> CREATE TABLE EMPLOYEE(EMP_ID INT PRIMARY KEY NOT NULL,EMP_NAME VARCHAR(20) NOT NULL, dept_id int, foreign key (dept_id) references department (dept_id));
Query OK, 0 rows affected (0.09 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| EMP_ID   | int         | NO   | PRI | NULL    |       |
| EMP_NAME | varchar(20) | NO   |     | NULL    |       |
| dept_id  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> INSERT INTO EMPLOYEE VALUES (1,'RUSHI',1),(2,'ROHIT',2),(3,'VINIT',3),(4,'OM',NULL),(5,'RAM',4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+--------+----------+---------+
| EMP_ID | EMP_NAME | dept_id |
+--------+----------+---------+
|      1 | RUSHI    |       1 |
|      2 | ROHIT    |       2 |
|      3 | VINIT    |       3 |
|      4 | OM       |    NULL |
|      5 | RAM      |       4 |
+--------+----------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPARTMENT;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.00 sec)


mysql> SELECT EMP_NAME,DEPT_NAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID=DEPARTMENT.DEPT_ID;
+----------+-----------+
| EMP_NAME | DEPT_NAME |
+----------+-----------+
| RUSHI    | HR        |
| ROHIT    | IT        |
| VINIT    | FINANCE   |
| RAM      | MARKETING |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT EMP_NAME,DEPT_NAME FROM EMPLOYEE LEFT JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID=DEPARTMENT.DEPT_ID;
+----------+-----------+
| EMP_NAME | DEPT_NAME |
+----------+-----------+
| RUSHI    | HR        |
| ROHIT    | IT        |
| VINIT    | FINANCE   |
| OM       | NULL      |
| RAM      | MARKETING |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT EMP_NAME,DEPT_NAME FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID=DEPARTMENT.DEPT_ID;
+----------+-----------+
| EMP_NAME | DEPT_NAME |
+----------+-----------+
| RUSHI    | HR        |
| ROHIT    | IT        |
| VINIT    | FINANCE   |
| RAM      | MARKETING |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT EMP_NAME,DEPT_NAME FROM EMPLOYEE FULL JOIN DEPARTMENT;
+----------+-----------+
| EMP_NAME | DEPT_NAME |
+----------+-----------+
| RUSHI    | MARKETING |
| RUSHI    | FINANCE   |
| RUSHI    | IT        |
| RUSHI    | HR        |
| ROHIT    | MARKETING |
| ROHIT    | FINANCE   |
| ROHIT    | IT        |
| ROHIT    | HR        |
| VINIT    | MARKETING |
| VINIT    | FINANCE   |
| VINIT    | IT        |
| VINIT    | HR        |
| OM       | MARKETING |
| OM       | FINANCE   |
| OM       | IT        |
| OM       | HR        |
| RAM      | MARKETING |
| RAM      | FINANCE   |
| RAM      | IT        |
| RAM      | HR        |
+----------+-----------+
20 rows in set, 1 warning (0.01 sec)

mysql> SELECT EMP_NAME,DEPT_NAME FROM EMPLOYEE CROSS JOIN DEPARTMENT;
+----------+-----------+
| EMP_NAME | DEPT_NAME |
+----------+-----------+
| RUSHI    | MARKETING |
| RUSHI    | FINANCE   |
| RUSHI    | IT        |
| RUSHI    | HR        |
| ROHIT    | MARKETING |
| ROHIT    | FINANCE   |
| ROHIT    | IT        |
| ROHIT    | HR        |
| VINIT    | MARKETING |
| VINIT    | FINANCE   |
| VINIT    | IT        |
| VINIT    | HR        |
| OM       | MARKETING |
| OM       | FINANCE   |
| OM       | IT        |
| OM       | HR        |
| RAM      | MARKETING |
| RAM      | FINANCE   |
| RAM      | IT        |
| RAM      | HR        |
+----------+-----------+
20 rows in set (0.00 sec)

mysql>


mysql> use store_procedure_example;
Database changed
mysql> select * from employee;
+----+-------+------+--------+
| ID | name  | dept | salary |
+----+-------+------+--------+
|  1 | rushi | HR   |  10000 |
+----+-------+------+--------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    -> SELECT * FROM Employee;
    -> END //

PROCEDURE GetEmployees already exists
mysql> DELIMITER ;

mysql> call GetEmployees();
+----+-------+------+--------+
| ID | name  | dept | salary |
+----+-------+------+--------+
|  1 | rushi | HR   |  10000 |
+----+-------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call GetEmployees;
+----+-------+------+--------+
| ID | name  | dept | salary |
+----+-------+------+--------+
|  1 | rushi | HR   |  10000 |
+----+-------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    -> SELECT * FROM Employees
    -> WHERE DEPARTMENT = dept_name;
    -> END //

PROCEDURE GetEmployeeByDept already exists

mysql> DELIMITER ;


mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept1(IN dept_name VARCHAR(50))
    -> BEGIN
    -> SELECT * FROM Employee
    -> WHERE department = dept_name;
    -> END //
Query OK, 0 rows affected (0.01 sec)


mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept2(IN dept VARCHAR(50))
    -> BEGIN
    -> SELECT * FROM Employee
    -> WHERE Department = dept;
    -> END //

PROCEDURE GetEmployeeByDept2 already exists

mysql> DELIMITER ;
mysql>
mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept3(IN dept VARCHAR(50))
    -> BEGIN
    -> SELECT * FROM Emplloyee
    -> WHERE dept = name;
    -> END //
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeByDept4(IN name VARCHAR(50))
    -> BEGIN
    -> SELECT * FROM Employee
    -> WHERE dept = name;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;

mysql> call GetEmployeeByDept4('HR');
+----+-------+------+--------+
| ID | name  | dept | salary |
+----+-------+------+--------+
|  1 | rushi | HR   |  10000 |
+----+-------+------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call GetEmployeeByDept4('IT');
Empty set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE AddEmployee(
    -> IN  id INT,
    -> IN name VARCHAR(50),
    -> IN dept VARCHAR(50),
    -> IN salary INT
    -> )
    -> BEGIN
    -> INSERT INTO Employee(id, name, dept, salary)
    -> VALUES(id, name, dept, salary);
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> call AddEmployee(2,'ZIMAL','IT',12000);
Query OK, 1 row affected (0.01 sec)

mysql> Select * from employee;
+----+-------+------+--------+
| ID | name  | dept | salary |
+----+-------+------+--------+
|  1 | rushi | HR   |  10000 |
|  2 | ZIMAL | IT   |  12000 |
+----+-------+------+--------+
2 rows in set (0.00 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE GetEmployeeCount(OUT total INT)
    -> BEGIN
    -> SELECT COUNT(*) INTO total
    -> FROM Employee;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql>
mysql> CALL GetEmployeeCount(@total);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT @total;
+--------+
| @total |
+--------+
|      2 |
+--------+
1 row in set (0.00 sec)

mysql>
