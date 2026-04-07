create database healthcare_mental_health;
use healthcare_mental_health;
 create table workforce (
 Employee_ID varchar(20) primary key ,
 Employee_Type varchar(50),
 Department varchar(50),
 Workplace_factor varchar(50),
 Stress_level int,
 Burnout_frequency varchar(20),
 Job_satisfaction int,
 Acess_to_EAPs varchar(10),
 Mental_health_Absences INT,
 Turnover_Intention varchar(10)
 )
 show tables;
 describe workforce;
 select count(*) from workforce;
 select* from workforce limit 5;