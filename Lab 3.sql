mysql> create database if not exists studentmanagementsystem;
Query OK, 1 row affected (0.15 sec)

mysql> use studentmanagementsystem;
Database changed

mysql> create table Student(Studentid int primary key, FirstName varchar(10), LastName varchar(10));
Query OK, 0 rows affected (0.20 sec)

mysql> create table Course(Courseid int primary key, CourseName varchar(10));
Query OK, 0 rows affected (0.12 sec)

mysql> create table Enrollment(Enrollmentid int primary key, Studentid int, Foreign Key (Studentid) References Student(Studentid), Courseid int, Foreign Key (Courseid) References Course(Courseid));
Query OK, 0 rows affected (0.15 sec)

mysql> desc Student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Studentid | int         | NO   | PRI | NULL    |       |
| FirstName | varchar(10) | YES  |     | NULL    |       |
| LastName  | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.09 sec)

mysql> desc Course;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Courseid   | int         | NO   | PRI | NULL    |       |
| CourseName | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc Enrollment;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| Enrollmentid | int  | NO   | PRI | NULL    |       |
| Studentid    | int  | YES  | MUL | NULL    |       |
| Courseid     | int  | YES  | MUL | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into Student values (1, 'Rohit', 'Morbale'), (2, 'Vinit', 'Salunkhe'), (3, 'Rushi', 'Zimal');
Query OK, 3 rows affected (0.07 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Course values (1, 'IT'), (2, 'CS'), (3, 'CIVIL');
Query OK, 3 rows affected (0.06 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Enrollment values (1, 1, 1), (2, 2, 2), (3, 3, 3);
Query OK, 3 rows affected (0.06 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> Select * From Student;
+-----------+-----------+----------+
| Studentid | FirstName | LastName |
+-----------+-----------+----------+
|         1 | Rohit     | Morbale  |
|         2 | Vinit     | Salunkhe |
|         3 | Rushi     | Zimal    |
+-----------+-----------+----------+
3 rows in set (0.00 sec)

mysql> Select * From Course;
+----------+------------+
| Courseid | CourseName |
+----------+------------+
|        1 | IT         |
|        2 | CS         |
|        3 | CIVIL      |
+----------+------------+
3 rows in set (0.00 sec)

mysql> Select * From Enrollment;
+--------------+-----------+----------+
| Enrollmentid | Studentid | Courseid |
+--------------+-----------+----------+
|            1 |         1 |        1 |
|            2 |         2 |        2 |
|            3 |         3 |        3 |
+--------------+-----------+----------+
3 rows in set (0.00 sec)

mysql> select FirstName, CourseName from Enrollment inner join Student on Enrollment.Studentid = Student.Studentid inner join Course on Enrollment.Courseid = Course.Courseid;
+-----------+------------+
| FirstName | CourseName |
+-----------+------------+
| Rohit    | IT         |
| Vinit    | CS         |
| Rushi    | CIVIL      |
+-----------+------------+
3 rows in set (0.00 sec)

mysql>