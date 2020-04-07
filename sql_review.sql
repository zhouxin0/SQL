#001 175 
CREATE DATABASE zhou;
use zhou;
CREATE TABLE IF NOT EXISTS Person (
    PersonId INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);
CREATE TABLE Address (
    AddressId INT,
    PersonId INT,
    City VARCHAR(255),
    State VARCHAR(255)
);
Truncate table Person;
insert into Person (PersonId, LastName,FirstName) values ('1', 'Wang', 'Allen');
Truncate table Address;
insert into Address (AddressId, PersonId,City, State) values ('1', '2', 'New York City', 'New York');
SELECT 
    *
FROM
    Person;
SELECT 
    *
FROM
    Address;
describe person;
SELECT 
    p.PersonId,
    p.LastName,
    p.FirstName,
    a.AddressId,
    a.City,
    a.State
FROM
    person p,
    address a
        LEFT JOIN
    Address a ON p.PersonId = a.PersonId;

SELECT 
    P.FirstName, P.Lastname, A.City, A.State
FROM
    Person P
        LEFT JOIN
    Address A ON P.PersonId = A.PersonId;

CREATE TABLE IF NOT EXISTS Employee (
    Id INT,
    Salary INT
);
Truncate table Employee;
insert into Employee (Id, Salary) values('1', '100');
insert into Employee (Id, Salary) values('2', '200');
insert into Employee (Id, Salary) values('3', '300');
SELECT 
    *
FROM
    employee;
SELECT 
    MAX(salary)
FROM
    employee;

SELECT 
    MAX(salary) AS '2nd'
FROM
    employee
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employee);SELECT 
    MAX(salary)
FROM
    employee;
#

#sql functions
create database hr;
use hr;
 
CREATE TABLE employees (
    employee_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    employee_sex VARCHAR(10) DEFAULT '男',
    hire_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    employee_mgr INT(11),
    employee_salary FLOAT DEFAULT 3000,
    department_id INT(11)
);
 
 
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('David Tian','男',10,7500,1);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Black Xie','男',10,6600,1);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Moses Wang','男',10,4300,1);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Rena Ruan','女',10,5300,1);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Sunshine Ma','女',10,6500,2);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Scott Gao','男',10,9500,2);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Warren Si','男',10,7800,2);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Kaishen Yang','男',10,9500,3);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Simon Song','男',10,5500,3);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Brown Guan','男',10,5000,3);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Eleven Chen','女',10,3500,2);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Cherry Zhou','女',10,5500,4);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Klause He','男',10,4500,5);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Maven Ma','男',10,4500,6);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Stephani Wang','女',10,5500,7);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Jerry Guo','男',10,8500,1);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Gerardo Garza','男',10,25000,8);
insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Derek Wu','男',10,5500,5);
SELECT 
    *
FROM
    employees;
desc employees;
describe employees;
#you are using safe update mode 
SET SQL_SAFE_UPDATES = 0;
UPDATE employees 
SET 
    employee_name = REPLACE(employee_name,
        'Zhou',
        'hahahaahahah');
SELECT 
    *
FROM
    employees;
SELECT 
    employee_name
FROM
    employees
WHERE
    employee_id = 12;

SELECT 
    CONCAT(employee_sex, hire_date)
FROM
    employees;

SELECT 
    SUBSTR(employee_name, 1, 3)
FROM
    employees
WHERE
    employee_id > 5 AND employee_id < 12;

SELECT 
    MAX(LENGTH(employee_name))
FROM
    employees;
SELECT 
    *
FROM
    employees
WHERE
    LENGTH(employee_name) = 19;
SELECT 
    INSTR(employee_name, 'c')
FROM
    employees;

SELECT 
    LPAD(employee_salary, 11, 'zx')
FROM
    employees;
SELECT 
    TRIM('M' FROM employee_name)
FROM
    employees;
SELECT 
    *
FROM
    employees;
SELECT 
    REPLACE(employee_sex, '男', 'kkk')
FROM
    employees;

SELECT 
    ROUND(employee_salary, - 3)
FROM
    employees;

SELECT 
    TRUNCATE(employee_salary, - 3)
FROM
    employees;

SELECT 
    MOD(employee_salary, 200)
FROM
    employees;
SELECT NOW();
SELECT 
    *
FROM
    employees
WHERE
    DATE_FORMAT(hire_date, '%Y-%m-%d') = '2020-04-02';
SELECT 
    STR_TO_DATE(hire_date, '%m-%d')
FROM
    employees;
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2020-04-02 17:06:00'
        AND hire_date < '2020-04-02 17:07:00';

SELECT 
    *
FROM
    employees
WHERE
    UNIX_TIMESTAMP(hire_date) BETWEEN UNIX_TIMESTAMP('2020-04-02 17:06:00') AND UNIX_TIMESTAMP('2020-04-02 17:07:00');
describe employees;
SELECT 
    *
FROM
    employees;
SELECT 
    *,
    CASE department_id
        WHEN department_id = 1 THEN 100 * employee_salary
        WHEN department_id = 2 THEN 1.1 * employee_salary
        ELSE employee_salary
    END 'new salary'
FROM
    employees;
            
SELECT 
    employee_name AS 'name',
    employee_salary * 12 AS 'salary_annual'
FROM
    employees
WHERE
    employee_salary * 12 > 110000;
SELECT 
    *
FROM
    employees
WHERE
    department_id IN (1 , 2, 3)
ORDER BY employee_salary DESC;
SELECT 
    *
FROM
    employees
WHERE
    employee_name LIKE '%haha%';

SELECT 
    *
FROM
    employees
WHERE
    department_id IS NOT NULL;
SELECT 
    *
FROM
    employees
WHERE
    department_id NOT IN (1 , 2, 3)
ORDER BY employee_salary DESC;
SELECT 
    employee_name AS 'name',
    employee_salary * 12 AS 'salary_annual'
FROM
    employees
WHERE
    employee_salary * 12 > 110000
ORDER BY salary_annual DESC;
SELECT 
    department_id,
    employee_name AS 'name',
    employee_salary * 12 AS 'salary_annual'
FROM
    employees
WHERE
    employee_salary * 12 > 80000
ORDER BY department_id DESC , salary_annual DESC;
SELECT 
    AVG(employee_salary),
    MAX(employee_salary),
    MIN(employee_salary),
    SUM(employee_salary)
FROM
    employees
WHERE
    department_id = 1;
SELECT 
    AVG(employee_salary),
    MAX(employee_salary),
    MIN(employee_salary),
    SUM(employee_salary)
FROM
    employees
WHERE
    department_id = 2;
describe employees;
SELECT MIN(hire_date), MAX(hire_date);


#
create database abc;
use abc;
set names utf8;
describe employees;

use test;
describe employees;
SELECT 
    *
FROM
    employees;

USE sakila;
use employees;
SELECT 
    *
FROM
    employees;
use hr;
SELECT 
    *
FROM
    employees;

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    department_id = 3;
USE `myemployees`;
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    employees;
SELECT VERSION();
SELECT 100 % 98 AS result;
SELECT 
    last_name AS xing
FROM
    employees;
SELECT 
    salary AS 'out put'
FROM
    employees;
SELECT 
    COUNT(DISTINCT department_id)
FROM
    employees;
SELECT NULL + 10;
SELECT '123' + 90;
SELECT 'zhou' + 90;
SELECT 
    CONCAT(last_name, first_name) AS new_name
FROM
    employees;

SELECT 
    CONCAT(employee_id, ',', first_name) AS out_put
FROM
    employees;
SELECT 
    commission_pct
FROM
    employees;
SELECT 
    *, ROUND(IFNULL(commission_pct, 0), 2) AS result
FROM
    employees;

SELECT 
    *
FROM
    employees
WHERE
    salary >= 10000 AND salary <= 20000;
SELECT 
    *
FROM
    employees
WHERE
    NOT (department_id BETWEEN 90 AND 110)
        OR salary > 15000;
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%a%';
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '__e_%';
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '_#_%' ESCAPE '#';

SELECT 
    *
FROM
    employees
WHERE
    job_id IN ('it_prog' , 'ad_vp');

SELECT 
    last_name, commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT 
    last_name, commission_pct
FROM
    employees
WHERE
    commission_pct <=> NULL;
SELECT 
    last_name,
    salary * 12 * (1 + IFNULL(commission_pct, 0)),
    department_id
FROM
    employees
WHERE
    employee_id BETWEEN 100 AND 190;
SELECT 
    last_name, salary
FROM
    employees
WHERE
    commission_pct IS NULL
        AND salary < 18000;

SELECT 
    *
FROM
    employees
WHERE
    job_id = 'it_prog' OR salary = 12000;
SELECT 
    *
FROM
    employees
ORDER BY salary DESC;

SELECT 
    *
FROM
    employees
WHERE
    department_id >= 90
ORDER BY hiredate ASC;
SELECT 
    *,
    salary * 12 * (1 + IFNULL(commission_pct, 0)) AS annual_salary
FROM
    employees
ORDER BY annual_salary DESC;

SELECT 
    last_name,
    salary * 12 * (1 + IFNULL(commission_pct, 0)) AS annual_salary,
    department_id
FROM
    employees
ORDER BY annual_salary DESC , last_name ASC;
SELECT 
    last_name, salary
FROM
    employees
WHERE
    salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC;

SELECT 
    *, LENGTH(email) AS length_of_email
FROM
    employees
WHERE
    last_name LIKE '%e%'
ORDER BY LENGTH(email) DESC , department_id ASC;

SELECT 
    *,
    CONCAT(UPPER(SUBSTR(last_name, 1, 1)),
            LOWER(SUBSTR(last_name, 2)),
            '_',
            LOWER((first_name))) AS new_name
FROM
    employees;

SELECT INSTR('zxzx123', 'x') AS output;
SELECT LENGTH(TRIM('zx' FROM 'zxzxzxzxzx865sd43a52d18wqad9786as1d')) AS output;
SELECT LPAD('zhouxin', 10, 'nb') AS output;
SELECT RPAD('zhouxin', 10, 'nb') AS output;
SELECT 
    REPLACE('zhou xin love meng han tong',
        'tong',
        'tongtong') AS output;
SELECT CEIL(1.02);
SELECT FLOOR(9.99);
SELECT FLOOR(- 9.99);
SELECT TRUNCATE(1.69999, 2);
SELECT MOD(10, 3);
SELECT 10 % 3;
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT YEAR(NOW()) AS cur_year;
SELECT YEAR('1997-08-01') AS output;
SELECT MONTH('1997-08-01') AS output;
SELECT 
    YEAR(hiredate) AS output
FROM
    employees;
SELECT 
    *
FROM
    employees
WHERE
    hiredate = STR_TO_DATE('4-3 1992', '%c-%d %Y');
SELECT 
    *,
    last_name,
    DATE_FORMAT(hiredate,
            '%y年%m月%d日-%H时%m分%s秒') AS new_date
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
SELECT NOW();
SELECT DATABASE();
SELECT USER();
SELECT VERSION();

SELECT 
    last_name,
    commission_pct,
    IF(commission_pct IS NULL,
        '没奖金，垃圾',
        '有奖金，🐂🍺')
FROM
    employees;


SELECT 
    salary,
    department_id,
    CASE department_id
        WHEN 30 THEN salary * 1.1
        WHEN 40 THEN salary * 1.2
        WHEN 50 THEN salary * 1.3
        ELSE salary
    END AS new_salary
FROM
    employees;

SELECT 
    last_name,
    salary,
    CASE
        WHEN salary > 20000 THEN 'a'
        WHEN salary > 15000 THEN 'b'
        WHEN salary > 10000 THEN 'c'
        ELSE 'd'
    END AS ranking
FROM
    employees;
SELECT NOW();

SELECT CURRENT_DATE(), CURRENT_TIME();
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%Y-%m-%d_%H:%i:%s');

SELECT 
    *, DATE_FORMAT(hiredate, '%m-%d_%H:%i:%s %Y') AS new_date
FROM
    employees
WHERE
    DATE_FORMAT(hiredate, '%Y-%m-%d_%H:%i:%s') BETWEEN '2000-09-10_23:29:29' AND '2007-08-01_23:29:29';

SELECT 
    *, DATE_FORMAT(hiredate, '%m-%d_%H:%i:%s %Y') 'new_date'
FROM
    employees
WHERE
    'new_date' > '02-06_00:00:00 2004';




SELECT 
    *
FROM
    employees
WHERE
    hiredate BETWEEN '1999-08-01_23:29:29' AND '2010-08-01_23:29:29';
SELECT 
    employee_id, last_name, salary, salary * 1.2 AS new_salary
FROM
    employees;
SELECT 
    last_name,
    LENGTH(last_name) AS length_of_name,
    SUBSTR(last_name, 1, 1) AS first_dight_name
FROM
    employees
ORDER BY SUBSTR(last_name, 1, 1);
SELECT 
    CONCAT(last_name,
            ' ',
            'earns',
            ' ',
            salary,
            ' ',
            'monthly , but wants ',
            salary * 3)
FROM
    employees
WHERE
    last_name LIKE '%a%';


SELECT 
    salary,
    last_name,
    CASE
        WHEN job_id = 'AD_PRES' THEN 'A'
        WHEN job_id = 'ST_MAN' THEN 'B'
        WHEN job_id = 'IT_PROG' THEN 'C'
        ELSE 'D'
    END AS GRADE
FROM
    EMPLOYEES;

SELECT 
    MAX(salary), MIN(salary), COUNT(salary), AVG(salary)
FROM
    employees;

SELECT 
    MAX(hiredate),
    MIN(hiredate),
    DATEDIFF(MAX(hiredate), MIN(hiredate))
FROM
    employees;
SELECT 
    *
FROM
    employees;
SELECT 
    COUNT(employee_id)
FROM
    employees
WHERE
    department_id = 90;
SELECT DATEDIFF(NOW(), '1997-08-01');

SELECT 
    MAX(salary), job_id
FROM
    employees
GROUP BY job_id
ORDER BY MAX(salary);
SELECT 
    COUNT(department_id), location_id
FROM
    departments
GROUP BY location_id;

SELECT 
    AVG(salary), department_id
FROM
    employees
WHERE
    email LIKE '%a%'
GROUP BY department_id;
SELECT 
    MAX(salary), manager_id
FROM
    employees
WHERE
    commission_pct IS NOT NULL
GROUP BY manager_id;
SELECT 
    MAX(salary), job_id
FROM
    employees
WHERE
    commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 12000;

SELECT 
    MIN(salary), manager_id
FROM
    employees
WHERE
    manager_id > 102
GROUP BY manager_id
HAVING MIN(salary) > 5000;


SELECT 
    COUNT(*) AS c, LENGTH(last_name) AS len_name
FROM
    employees
GROUP BY len_name
HAVING c > 5;

SELECT 
    ROUND(AVG(salary), 1) AS avg_salary, department_id, job_id
FROM
    employees
WHERE
    department_id IS NOT NULL
GROUP BY department_id , job_id
HAVING avg_salary > 10000
ORDER BY avg_salary DESC;

SELECT 
    MAX(salary), MIN(salary), AVG(salary), SUM(salary), job_id
FROM
    employees
GROUP BY job_id
ORDER BY job_id ASC;
SELECT 
    MAX(salary) - MIN(salary) difference
FROM
    employees;
 
SELECT 
    MIN(salary), manager_id
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY MIN(salary) DESC;
SELECT 
    department_id, COUNT(*), AVG(salary)
FROM
    employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;
 #q5
 use myemployees;
SELECT 
    COUNT(*), job_id
FROM
    employees
GROUP BY job_id;
 use girls;
SELECT 
    *
FROM
    beauty;
SELECT 
    *
FROM
    boys;
SELECT 
    name, boyName, boys.id
FROM
    boys,
    beauty
WHERE
    boys.id = beauty.boyfriend_id;


SELECT 
    name, boyname
FROM
    beauty,
    boys;
use myemployees;
SELECT 
    department_name, last_name
FROM
    departments,
    employees
WHERE
    departments.department_id = employees.department_id;

SELECT 
    *
FROM
    jobs;
SELECT 
    e.job_id, e.last_name, j.job_title
FROM
    employees e,
    jobs j
WHERE
    e.job_id = j.job_id;

SELECT 
    last_name, department_name, commission_pct
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id
        AND employees.commission_pct IS NOT NULL;

SELECT 
    *
FROM
    locations;

SELECT 
    city, department_name
FROM
    locations,
    departments
WHERE
    locations.location_id = departments.location_id
        AND city LIKE '_o%';

SELECT 
    COUNT(*), city
FROM
    departments,
    locations
WHERE
    departments.location_id = locations.location_id
GROUP BY city;

SELECT 
    COUNT(*), city
FROM
    departments,
    locations
GROUP BY city;


SELECT 
    MIN(employees.salary),
    departments.department_name,
    departments.manager_id
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id
        AND commission_pct IS NOT NULL
GROUP BY departments.department_name , manager_id;

SELECT 
    *
FROM
    jobs;
SELECT 
    COUNT(*), j.job_id, j.job_title
FROM
    jobs j,
    employees e
WHERE
    j.job_id = e.job_id
GROUP BY job_title
ORDER BY COUNT(*) DESC;

SELECT 
    last_name, department_name, city
FROM
    employees e,
    departments d,
    locations l
WHERE
    e.department_id = d.department_id
        AND d.location_id = l.location_id
        AND city LIKE '%s%'
ORDER BY department_name DESC;

CREATE TABLE job_grades (
    grade_level VARCHAR(3),
    lowest_sal INT,
    highest_sal INT
);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

SELECT 
    *
FROM
    job_grades;

SELECT 
    salary, grade_level
FROM
    employees e,
    job_grades j
WHERE
    salary BETWEEN j.lowest_sal AND j.highest_sal
        AND grade_level IN ('A' , 'B', 'C')
ORDER BY grade_level;
SELECT 
    e.last_name, e.employee_id, m.last_name, m.employee_id
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id;

SELECT 
    MAX(salary) max, ROUND(AVG(salary), 1) avg
FROM
    employees;
SELECT 
    employee_id, job_id, last_name
FROM
    employees
ORDER BY department_id DESC , salary ASC;


SELECT 
    *
FROM
    jobs;
SELECT 
    job_id
FROM
    employees
WHERE
    job_id LIKE '%a%e%';
#q4
select s.'name',g.'name',r.score
from student s,  grade g,  result r
where s.gradeid = g.id and s.id = r.studentno;

SELECT NOW();
SELECT TRIM('a' FROM 'aaazhou aaa');
SELECT SUBSTR('zhouxin', 2);
SELECT SUBSTR('zhouxin', 2, 100);

SELECT 
    e.last_name, e.department_id, d.department_name
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id;
SELECT 
    e.job_id, d.location_id
FROM
    departments d,
    employees e
WHERE
    d.department_id = e.department_id
        AND d.department_id = 90;
SELECT 
    last_name,
    job_id,
    e.department_id,
    department_name,
    l.location_id,
    city
FROM
    employees e,
    departments d,
    locations l
WHERE
    e.department_id = d.department_id
        AND l.location_id = d.location_id
        AND e.commission_pct IS NOT NULL;

SELECT 
    last_name, job_id, e.department_id, department_name, l.city
FROM
    employees e,
    departments d,
    locations l
WHERE
    e.department_id = d.department_id
        AND l.location_id = d.location_id
        AND city = 'Toronto';


SELECT 
    department_name, job_title, MIN(salary)
FROM
    employees e,
    departments d,
    jobs j
WHERE
    e.department_id = d.department_id
        AND e.job_id = j.job_id
GROUP BY department_name , job_title;

SELECT 
    country_id, COUNT(*), department_id
FROM
    locations l,
    departments d
WHERE
    l.location_id = d.location_id
GROUP BY country_id
HAVING COUNT(*) > 2;
SELECT 
    e.last_name employee,
    e.employee_id,
    m.last_name manager_last_name,
    m.employee_id manager_id
FROM
    employees e,
    employees m
WHERE
    m.employee_id = e.manager_id
        AND e.last_name = 'kochhar';


SELECT 
    e.last_name employees,
    e.employee_id 'Emp#',
    m.last_name manager,
    m.employee_id 'Mgr#'
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id
        AND e.last_name = 'kochhar';

SELECT 
    last_name, department_name
FROM
    employees e
        INNER JOIN
    departments d ON e.department_id = d.department_id;

SELECT 
    last_name, job_title
FROM
    employees e
        INNER JOIN
    jobs j ON e.job_id = j.job_id
WHERE
    e.last_name LIKE '%e%';


SELECT 
    city, COUNT(*)
FROM
    departments d
        INNER JOIN
    locations l ON d.location_id = l.location_id
GROUP BY city
HAVING COUNT(*) > 3;

SELECT 
    department_name, COUNT(*)
FROM
    departments d
        INNER JOIN
    employees e ON d.department_id = e.department_id
GROUP BY department_name
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;

SELECT 
    last_name, department_name, job_title
FROM
    departments d
        INNER JOIN
    employees e ON d.department_id = e.department_id
        INNER JOIN
    jobs j ON e.job_id = j.job_id
ORDER BY d.department_name DESC;

SELECT 
    salary, grade_level
FROM
    employees e
        INNER JOIN
    job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

SELECT 
    COUNT(grade_level), grade_level
FROM
    employees e
        INNER JOIN
    job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
GROUP BY grade_level
HAVING COUNT(grade_level) > 20
ORDER BY COUNT(grade_level);

SELECT 
    e.last_name AS employee_name,
    m.last_name,
    e.employee_id,
    m.employee_id
FROM
    employees e
        INNER JOIN
    employees m ON m.employee_id = e.manager_id
WHERE
    e.last_name LIKE '%K%';
use girls;
SELECT 
    *
FROM
    beauty;
SELECT 
    *
FROM
    boys;

SELECT 
    name, bo.*
FROM
    beauty b
        LEFT OUTER JOIN
    boys bo ON b.boyfriend_id = bo.id
WHERE
    bo.id IS NULL;
use myemployees;

SELECT 
    d.*, employee_id
FROM
    departments d
        LEFT OUTER JOIN
    employees e ON d.department_id = e.department_id
WHERE
    e.employee_id IS NULL;

SELECT 
    *
FROM
    employees;

SELECT 
    name, b.id, bo.*
FROM
    beauty b
        LEFT OUTER JOIN
    boys bo ON b.boyfriend_id = bo.id
WHERE
    b.id > 3;

SELECT 
    city, department_id
FROM
    locations l
        LEFT OUTER JOIN
    departments d ON l.location_id = d.location_id
WHERE
    d.department_id IS NULL;


SELECT 
    e.*, department_name
FROM
    departments d
        LEFT OUTER JOIN
    employees e ON e.department_id = d.department_id
WHERE
    department_name IN ('sal' , 'it');
SELECT 
    *
FROM
    employees
WHERE
    salary > (SELECT 
            salary
        FROM
            employees
        WHERE
            last_name = 'abel');

SELECT 
    last_name, job_id, salary
FROM
    employees
WHERE
    job_id = (SELECT 
            job_id
        FROM
            employees
        WHERE
            employee_id = 141)
        AND salary > (SELECT 
            salary
        FROM
            employees
        WHERE
            employee_id = 143);

SELECT 
    last_name, job_id, salary
FROM
    employees
WHERE
    salary = (SELECT 
            MIN(salary)
        FROM
            employees);
SELECT 
    MIN(salary)
FROM
    employees
WHERE
    department_id = 50;
SELECT 
    department_id, MIN(salary)
FROM
    employees;
SELECT 
    department_id, MIN(salary)
FROM
    employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT 
        MIN(salary)
    FROM
        employees
    WHERE
        department_id = 50);
SELECT 
    last_name
FROM
    employees
WHERE
    department_id IN (SELECT DISTINCT
            department_id
        FROM
            departments
        WHERE
            location_id IN (1400 , 1700));
SELECT 
    employee_id, job_id, last_name, salary
FROM
    employees
WHERE
    salary < ANY (SELECT DISTINCT
            salary
        FROM
            employees
        WHERE
            job_id = 'it_prog')
        AND job_id <> 'it_prog';
use myemployees;
SELECT 
    d.*,
    (SELECT 
            COUNT(*)
        FROM
            employees
        WHERE
            d.department_id = employees.department_id
        GROUP BY department_id) number_
FROM
    departments d;
SELECT 
    department_name
FROM
    departments
WHERE
    department_id = (SELECT 
            department_id
        FROM
            employees
        WHERE
            employee_id = 102);

SELECT 
    department_name
FROM
    departments d
        INNER JOIN
    employees e ON d.department_id = e.department_id
WHERE
    e.employee_id = 102;
SELECT 
    grade_level
FROM
    (SELECT 
        AVG(salary) avg_salary, department_id
    FROM
        departments
    GROUP BY department_id)
WHERE
    salary BETWEEN lowest_sal AND highest_sal;

SELECT 
    AVG(salary) avg_salary, department_id
FROM
    employees
GROUP BY department_id;

SELECT 
    ag_dep.*, g.grade_level
FROM
    (SELECT 
        AVG(salary) avg_salary, department_id
    FROM
        employees
    GROUP BY department_id) ag_dep
        INNER JOIN
    job_grades g ON ag_dep.avg_salary BETWEEN lowest_sal AND highest_sal;
SELECT 
    ag_dep.*, g.`grade_level`
FROM
    (SELECT 
        AVG(salary) ag, department_id
    FROM
        employees
    GROUP BY department_id) ag_dep
        INNER JOIN
    job_grades g ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;
SELECT 
    EXISTS( SELECT 
            employee_id
        FROM
            employees
        WHERE
            salary = 32900);
SELECT 
    employee_id
FROM
    employees;

SELECT 
    last_name
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            departments);
SELECT 
    department_name
FROM
    departments d
WHERE
    EXISTS( SELECT 
            *
        FROM
            employees e
        WHERE
            d.department_id = e.department_id);

SELECT 
    *
FROM
    employees e,
    departments d
WHERE
    d.department_id = e.department_id;
SELECT 
    department_name
FROM
    departments
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            employees);
		use girls;
SELECT 
    b.*
FROM
    boys b
WHERE
    b.id NOT IN (SELECT 
            boyfriend_id
        FROM
            beauty);
SELECT 
    b.*
FROM
    boys b
WHERE
    NOT EXISTS( SELECT 
            boyfriend_id
        FROM
            beauty bo
        WHERE
            bo.boyfriend_id = b.id);

SELECT 
    boyfriend_id, boys.*
FROM
    beauty,
    boys
WHERE
    beauty.boyfriend_id = boys.id;
#1.查询员工姓名和工资 2.和这个人同部门 'zlotkey'
use myemployees;
SELECT 
    last_name, salary
FROM
    employees
WHERE
    department_id = (SELECT 
            department_id
        FROM
            employees
        WHERE
            last_name = 'zlotkey');
SELECT 
    last_name, employee_id, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);
            
            
SELECT 
    AVG(salary)
FROM
    employees;
SELECT 
    last_name, employee_id, salary
FROM
    employees e
        INNER JOIN
    (SELECT 
        AVG(salary) avg_salary, department_id
    FROM
        employees
    GROUP BY department_id) c
WHERE
    c.avg_salary < e.salary
        AND c.department_id = e.department_id;

SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id;

SELECT 
    last_name, employee_id, salary, e.department_id
FROM
    employees e
        INNER JOIN
    (SELECT 
        AVG(salary) avg_salary, department_id
    FROM
        employees
    GROUP BY department_id) ag_dep ON e.department_id = ag_dep.department_id
WHERE
    salary > ag_dep.avg_salary;

SELECT 
    employee_id, last_name
FROM
    employees
WHERE
    department_id IN (SELECT DISTINCT
            department_id
        FROM
            employees
        WHERE
            last_name LIKE '%u%');
            
SELECT 
    employee_id
FROM
    employees
WHERE
    department_id = ANY (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700);
SELECT 
    last_name, salary, manager_id
FROM
    employees
WHERE
    manager_id IN (SELECT 
            employee_id
        FROM
            employees
        WHERE
            last_name = 'K_ing');
SELECT 
    CONCAT(last_name, ' ', first_name)
FROM
    employees
WHERE
    salary >= ALL (SELECT 
            MAX(salary)
        FROM
            employees);
SELECT 
    *
FROM
    employees
LIMIT 10 , 15;

SELECT 
    *
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY salary DESC
LIMIT 0 , 10;


SELECT 
    last_name, salary
FROM
    employees
WHERE
    salary = (SELECT 
            MIN(salary)
        FROM
            employees);
SELECT 
    *
FROM
    departments
WHERE
    department_id = (SELECT 
            department_id
        FROM
            employees
        GROUP BY department_id
        ORDER BY AVG(salary)
        LIMIT 0 , 1);
SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT 
        MIN(ag)
    FROM
        (SELECT 
            AVG(salary) ag, department_id
        FROM
            employees
        GROUP BY department_id) ag_dep);

SELECT 
    d.*
FROM
    departments d
WHERE
    d.department_id = (SELECT 
            department_id
        FROM
            employees
        GROUP BY department_id
        HAVING AVG(salary) = (SELECT 
                MIN(ag)
            FROM
                (SELECT 
                    AVG(salary) ag, department_id
                FROM
                    employees
                GROUP BY department_id) ag_dep));






SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id;
SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id
ORDER BY AVG(salary) ASC
LIMIT 1;
SELECT 
    d.*, ag_dep.ag
FROM
    departments d
        INNER JOIN
    (SELECT 
        AVG(salary) ag, department_id
    FROM
        employees
    GROUP BY department_id) ag_dep ON ag_dep.department_id = d.department_id
ORDER BY ag
LIMIT 1;
SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id
ORDER BY AVG(salary) ASC
LIMIT 1;




SELECT 
    *
FROM
    jobs j
        INNER JOIN
    employees e ON j.job_id = e.job_id
WHERE
    e.salary = (SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY job_id
        ORDER BY AVG(salary) DESC
        LIMIT 1);


SELECT 
    AVG(salary)
FROM
    employees;

SELECT DISTINCT
    d.department_id, d.department_name
FROM
    departments d
        INNER JOIN
    employees e ON e.department_id = d.department_id
WHERE
    e.salary > (SELECT 
            AVG(salary)
        FROM
            employees);
SELECT 
    AVG(salary)
FROM
    employees;
SELECT 
    department_id, AVG(salary)
FROM
    employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT 
        AVG(salary)
    FROM
        employees);



SELECT 
    *
FROM
    employees
WHERE
    employee_id IN (SELECT DISTINCT
            d.manager_id
        FROM
            departments d
                INNER JOIN
            employees e ON d.department_id = e.department_id);
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    employees
WHERE
    employee_id IN (SELECT DISTINCT
            manager_id
        FROM
            employees);
SELECT 
    MIN(salary)
FROM
    employees
WHERE
    department_id = (SELECT 
            department_id
        FROM
            employees
        GROUP BY department_id
        ORDER BY MAX(salary) ASC
        LIMIT 1);
        
SELECT 
    last_name, department_id, email, salary
FROM
    employees
WHERE
    employee_id = (SELECT 
            manager_id
        FROM
            departments
        WHERE
            department_id = (SELECT 
                    department_id
                FROM
                    employees
                GROUP BY department_id
                ORDER BY AVG(salary) DESC
                LIMIT 0 , 1));
SELECT 
    department_id
FROM
    employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

SELECT 
    last_name, e.department_id, email, salary
FROM
    employees e
        INNER JOIN
    (SELECT 
        department_id
    FROM
        employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1) newb ON newb.department_id = e.department_id
WHERE
    e.employee_id = (SELECT 
            manager_id
        FROM
            departments
        WHERE
            department_id = (SELECT 
                    department_id
                FROM
                    employees
                GROUP BY department_id
                ORDER BY AVG(salary) DESC
                LIMIT 1));


SELECT 
    manager_id
FROM
    departments
WHERE
    department_id = (SELECT 
            department_id
        FROM
            employees
        GROUP BY department_id
        ORDER BY AVG(salary) DESC
        LIMIT 1);

#
use girls;
SET SQL_SAFE_UPDATES = 0;

UPDATE boys bo
        INNER JOIN
    beauty b ON b.boyfriend_id = bo.id 
SET 
    b.phone = '114'
WHERE
    bo.boyname = '张无忌';

SELECT 
    *
FROM
    beauty;

UPDATE boys bo
        RIGHT JOIN
    beauty b ON b.boyfriend_id = bo.id 
SET 
    b.boyfriend_id = 2
WHERE
    b.id IS NULL;
SELECT 
    *
FROM
    boys bo
        RIGHT JOIN
    beauty b ON b.boyfriend_id = bo.id;

DELETE FROM beauty 
WHERE
    phone LIKE '%9';
SELECT 
    *
FROM
    boysid;
DELETE b FROM beauty b
        INNER JOIN
    boys bo ON b.boyfriend_id = bo.id 
WHERE
    bo.boyname = '张无忌';


SELECT 
    *
FROM
    beauty b
        LEFT JOIN
    boys bo ON b.boyfriend_id = bo.id
WHERE
    boyname = '张无忌';

DELETE FROM boys;
SELECT 
    *
FROM
    boys;
truncate table boys;
insert into boys(boyname,usercp)
values('张飞',100),('刘备',200),('关羽',300);

use myemployees;
CREATE TABLE my_employees (
    id INT(10),
    First_name VARCHAR(10),
    Last_name VARCHAR(10),
    Userid VARCHAR(10),
    Salary DOUBLE(10 , 2 )
);

CREATE TABLE user (
    id INT,
    userid VARCHAR(10),
    department_id INT
);

describe my_employees;
insert into my_employees(id,First_name,Last_name,Userid,Salary)
values(1,'patel','ralph','rpatel','895'),(2,'dancs','betty','bdancs','860'),(3,'biri','ben','bbiri','1100'),
(4,'newman','chad','cnewman','750'),(5,'ropeburn','audrey','aropebur','1550');SELECT 
    *
FROM
    my_employees;

insert into user(id,userid,department_id)
values(1,'rpatel',10),(2,'bdance',10),(3,'bbiri',20),(4,'cnewman',30),(5,'aropebur',40);
SELECT 
    *
FROM
    user;

UPDATE my_employees 
SET 
    Last_name = 'drelxer'
WHERE
    my_employees.id = 3;
# 
truncate table my_employees;
insert into my_employees 
select 1,'patel','ralph','rpatel',895 union
select 2,'dancs','betty','bdancs',860 union
select 3,'biri','ben','bbiri',1100 union
select 4,'newman','chad','cnewman',750 union
select 5,'ropeburn','audrey','aropebur',1550;

UPDATE my_employees 
SET 
    Salary = 1000
WHERE
    Salary < 900;
DELETE u , e FROM user u
        INNER JOIN
    my_employees e ON u.userid = e.Userid 
WHERE
    u.Userid = 'bbiri';
create database if not exists books;
use books;
CREATE TABLE book (
    id INT,
    bname VARCHAR(20),
    price DOUBLE,
    authorid INT,
    publishdate DATETIME
);
desc book;CREATE TABLE author (
    id INT,
    au_name VARCHAR(20),
    nation VARCHAR(20)
);
 
 desc author;
 # 2 表的修改
 #01 修改列名称
 alter table book change column publishdate pubdate datetime;
SELECT 
    *
FROM
    book;
 #02修改列的类型或约束
 alter table book modify column pubdate timestamp;
 desc book;
 #03 添加新列alter
 alter table author add column annual double;
 desc author;
 #04 删除列
 alter table author drop column annual;
 #05 修改表名alter
 alter table author rename to book_author;
 desc author;
 desc book_author;
 # 表的删除
 drop table author;
 show tables;
 drop table if exists author;
 #not suitable in column  exists
 #create table if not exists
 drop database if exists old_database;
 create database old_database;
drop table if exists old_table;
CREATE TABLE old_table;
 #4 表的复制
 alter table book_author rename to author;
insert into author values(1,'村上春树','日本'),(2,'莫言','中国'),(3,'冯唐','中国'),(4,'金庸','中国');
 desc author;
SELECT 
    *
FROM
    author;
CREATE TABLE copy LIKE author;
desc copy;
show tables;
CREATE TABLE copy2 SELECT * FROM
    author;
SELECT 
    *
FROM
    copy3;
drop table if exists copy2;
CREATE TABLE copy3 SELECT * FROM
    author
WHERE
    nation = '中国';

CREATE TABLE copy4 SELECT id, au_name FROM
    author
WHERE
    0;
drop database if exists test;
create database test;
use test;

CREATE TABLE dept1 (
    id INT(7),
    name VARCHAR(25)
);
desc dept1;
use myemployees;

CREATE TABLE detp2 SELECT department_id, department_name FROM
    myemployees.departments;
desc detp2;
SELECT 
    *
FROM
    detp2;
alter table detp2 rename to dept2;
show tables;
CREATE TABLE emp5 (
    id INT(7),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    dept_id INT(7)
);
desc emp5;
alter table emp5 modify column last_name varchar(50);
CREATE TABLE employee2 LIKE myemployees.employees;
desc employee2;
SELECT 
    *
FROM
    employee2;

#q6
drop table if exists emp5;
alter table employee2  rename to emp5;
alter table emp5 add column test_column int;
alter table dept1 add column test_colunm int;
show tables;
SELECT 
    *
FROM
    emp5;

alter table emp5 drop column test_column;

drop table if exists tab_int;
CREATE TABLE tab_int (
    t1 INT ZEROFILL,
    t2 INT UNSIGNED
);
desc tab_int;
insert into tab_int values(222372,12);
SELECT 
    *
FROM
    tab_float;
CREATE TABLE tab_float (
    f1 FLOAT(5 , 2 ),
    f2 DOUBLE(5 , 2 ),
    f3 DEC(5 , 2 )
);
insert into tab_float values(123.456,123.45,1234.4589);

CREATE TABLE tab_enum (
    t1 ENUM('a', 'b', 'c')
);
insert into tab_enum values ('a');
insert into tab_enum values ('A');
SELECT 
    *
FROM
    tab_enum;

CREATE TABLE tab_set (
    t1 SET('1', '2', '3', '4')
);
SELECT 
    *
FROM
    tab_set;
insert into tab_set values('1,2,4');

CREATE TABLE tab_date (
    t1 DATETIME,
    t2 TIMESTAMP
);
insert into tab_date values(now(),now());
SELECT 
    *
FROM
    tab_date;
show variables like 'time_zone';
set time_zone = '+9:00';

create database students;
use students;
CREATE TABLE stuinfo (
    id INT PRIMARY KEY,
    stuname VARCHAR(20) NOT NULL,
    gender VARCHAR(1),
    sear INT UNIQUE,
    age INT DEFAULT 0,
    majorid INT REFERENCES major (id)
);
CREATE TABLE major (
    id INT PRIMARY KEY,
    majorname VARCHAR(20)
);
show index from stuinfo;
drop table if exists stuinfo;
CREATE TABLE stuinfo (
    id INT,
    stuname VARCHAR(20),
    gender CHAR(1),
    seat INT,
    age INT,
    majorid INT,
    PRIMARY KEY (id),
    UNIQUE (seat),
    CHECK (gender = '男' OR gender = '女'),
    FOREIGN KEY (majorid)
        REFERENCES major (id)
);
desc stuinfo;
show index from stuinfo;

insert into major values(1,'java'),(2,'h5');
SELECT 
    *
FROM
    stuinfo;
insert into stuinfo values(1,'john','男',null,19,1);
insert into stuinfo values(2,'lily','男',null,19,2);

drop table if exists stuinfo;
CREATE TABLE stuinfo (
    id INT,
    stuname VARCHAR(20),
    gender CHAR(1),
    seat INT,
    age INT,
    majorid INT
);
alter table stuinfo modify column stuname varchar(20);
desc stuinfo;
alter table stuinfo modify column age int default 18;
alter table stuinfo modify column id int primary key;
alter table stuinfo add primary key(id);
alter table stuinfo modify column seat int  unique;
alter table stuinfo add unique(seat);

#添加外键
alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid)  references major(id);

#删除唯一
show index from stuinfo;
alter table stuinfo modify column seat int unique;
alter table stuinfo drop index fk_stuinfo_major; #一会看一下练习
alter table stuinfo drop foreign key fk_stuinfo_major;
use test;
show tables;
drop table emp5;
SELECT 
    *
FROM
    emp5;
CREATE TABLE emp5 SELECT * FROM
    myemployees.employees;
show index from emp5;
alter table emp5 add constraint my_dep_id_pk primary key(employee_id);
SELECT 
    *
FROM
    emp5;
alter table emp5 add column dept_id int;
alter table dept2 drop column dept_id;
SELECT 
    *
FROM
    dept2;
alter table emp5 add constraint fk_emp2_dept2 foreign key(dept_id) references dept2(department_id);
ALTER TABLE emp5 ADD CONSTRAINT fk_emp2_dept2 FOREIGN KEY(dept_id) REFERENCES dept2(department_id);SELECT 
    *
FROM
    emp5;
drop table if exists tab_identity;
CREATE TABLE tab_identity (
    id INT ,
    name VARCHAR(20)
);
insert into tab_identity (name) values ('zhou');
SELECT 
    *
FROM
    tab_identity;
truncate table tab_identity;
show variables like '%auto_increment%';
set auto_increment_increment = 1;
desc tab_identity;
#修改表时候设置标识列
alter table tab_identity modify column id int;

