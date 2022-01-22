
create database if not exists `hibernate_mapping`;
select database();
use `hibernate_mapping`;
show tables;

desc `student_info`;
desc `teacher_info`;
desc `student_course_info`;
desc `course_info`;
desc `book_info`;
desc `guardian_info`;

select * from `student_info`;
select * from `teacher_info`;
select * from `course_info`;
select * from `book_info`;
select * from `student_course_info`;
select * from `guardian_info`;