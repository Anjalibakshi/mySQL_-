create database Basent;
show databases;

use Besant;
create table employees(
emp_id int auto_increment NOT NULL,
first_name varchar(20),
last_name varchar(20),
email varchar(25),
phone_no varchar(20),
hire_date date,
job_id varchar(10),
salary int,
commission_pct int,
manager_id int,
department_id int,
grade_level varchar(2),
PRIMARY KEY(emp_id));

select * from employees;



INSERT INTO employees values(1,'Arti','Mehta','hsmath@gmail.com', 987650988,'2020-12-15',NULL,45000,5000,2,NULL,NULL);
INSERT INTO employees values(2,'Ajay','Gaba','hseng@gmail.com', 987656788,'2020-10-05',NULL,65000,7000,6,NULL,NULL);
INSERT INTO employees values(3,'Mitali','Mishra','hshindi@gmail.com', 987623344,'2021-02-15',NULL,35000,10000,7,NULL,NULL);
INSERT INTO employees values(4,'Preeti','Kakkar','hspunj@gmail.com', 987097840,'2020-11-25',NULL,40000,3000,6,NULL,NULL);
INSERT INTO employees values(5,'Arun','Sharma','hssos@gmail.com', 827990988,'2020-10-10',NULL,65000,4000,2,NULL,NULL);
INSERT INTO employees values(6,'Prem','Sher','hssci@gmail.com', 789550983,'2021-02-15',NULL,55000,5000,7,NULL,NULL);
INSERT INTO employees values(7,'Ria','Gil','hstamil@gmail.com', 889750986,'2021-10-11',NULL,43000,6000,6,NULL,NULL);
INSERT INTO employees values(8,'Varun','Singh','hsche@gmail.com', 982367733,'2021-01-11',NULL,40000,1000,7,NULL,NULL);
select * from employees;

ALTER TABLE employees ADD Foreign key (department_id) References departments(department_id);
ALTER TABLE employees ADD Foreign key (job_id) References jobs(job_id);
ALTER TABLE employees ADD Foreign key (grade_level) References grades(grade_level);

UPDATE employees SET manager_id=2 where emp_id=8;
UPDATE employees SET grade_level='D' where emp_id=3;
UPDATE employees SET job_id=44 where grade_level='D';
UPDATE employees SET department_id=90 where manager_id=2;


create table departments(
department_id int NOT NULL,
department_name varchar(30),
manager_id int,
loc_id int,
PRIMARY KEY (department_id),
FOREIGN KEY (loc_id) REFERENCES locations (loc_id) ON DELETE SET NULL);
Desc departments;


INSERT INTO departments Values(90,'Math',2,129);
INSERT INTO departments Values(80,'Sci',6,150);
INSERT INTO departments Values(70,'Space',7,139);
INSERT INTO departments Values(60,'Water',6,125);
Delete from departments where  department_id>=40;
select * from departments;
Update departments set manager_id=2 where department_id=90;

create table locations(
loc_id int NOT NULL,
street_add varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2),
PRIMARY KEY (loc_id),
FOREIGN KEY (country_id) references countries(country_id) ON DELETE SET NULL);


INSERT INTO locations values(120,'wagh street', 134203, 'Jair', 'UP',01);
INSERT INTO locations  values(125,'kirat gali', 123000, 'Dill', 'Shinghai',03);
INSERT INTO locations  values(133,'Kaya street', 003445, 'Rewari', 'MP',04);
INSERT INTO locations  values(150,'Nigha Nahar', 120445, 'Noida', 'UP',02);
INSERT INTO locations  values(171,'Vaigai Gali ', 126445, 'Wagint', 'MP',04);
INSERT INTO locations  values(129,'Pnjalasa Pind', 523445, 'Paris', 'PUNJAB',02);
INSERT INTO locations  values(139,'Majra', 012335, 'Nagpur', 'Jammu',03);

select * from locations;

create table countries(
country_id char(2) NOT NULL,
country_name varchar(40),
region_id int,
PRIMARY KEY (country_id),
FOREIGN KEY (region_id) references regions(region_id) ON DELETE SET NULL);

INSERT INTO countries(country_id,country_name,region_id) values(01,'India',91);
INSERT INTO countries values(02,'Nepal',61);
INSERT INTO countries  values(03,'France',81);
INSERT INTO countries values(04,'Wadiya',71);


Select * from countries;



create table regions(
region_id int NOT NULL,
region_name varchar(25),
PRIMARY KEY (region_id));

INSERT INTO regions values(91,'North');
INSERT INTO regions values(81,'East');
INSERT INTO regions values(71,'South');
INSERT INTO regions values(61,'West');
select * from regions;



create table job_history(
emp_id  int NOT NULL,
start_date date NOT NULL,
end_date date,
job_id varchar(10),
department_id int,
PRIMARY KEY (emp_id, start_date),
FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)ON DELETE CASCADE,
FOREIGN KEY (job_id) references jobs(job_id) ON DELETE SET NULL);


INSERT INTO job_history values(1,'2020-12-15','2022-12-12',11,90);
INSERT INTO job_history  values(2,'2021-10-12','2022-09-12',22,60);  
INSERT INTO job_history values(3,'2020-02-05','2022-01-10',33,70); 
INSERT INTO job_history values(4,'2020-06-10','2021-03-29',44,80); 
INSERT INTO job_history values(5,'2021-01-12','2022-10-17',11,60); 
INSERT INTO job_history  values(6,'2021-11-05','2022-07-19',22,70); 
INSERT INTO job_history  values(7,'2021-07-25','2022-11-12',22,90); 
INSERT INTO job_history values(8,'2020-07-12','2021-12-10',33,80); 
UPDATE job_history set job_id=33 where department_id=90;
select * from job_history;



create table jobs(
job_id varchar(10) NOT NULL,
job_title varchar(35),
min_salary int,
max_salary int,
PRIMARY KEY (job_id));
INSERT INTO jobs values(11, 'Sys_Engg', 40000,80000);
INSERT INTO jobs values(22, 'Sys_mgr', 70000,170000);
INSERT INTO jobs values(33, 'proj_Engg', 35000,70000);
INSERT INTO jobs values(44, 'op_Engg', 25000,50000);
select * from jobs;





create table job_grades(
grade_level varchar(2)NOT NULL,
lowest_sal int,
highest_sal int,
PRIMARY KEY(grade_level));

INSERT INTO job_grades values('A',70000,170000);
INSERT INTO job_grades values('B',40000,80000);
INSERT INTO job_grades values('C',35000,70000);
INSERT INTO job_grades values('D',25000,50000);
select * from job_grades;