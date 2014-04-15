alter table courses drop constraint FK391923B89065D58;
alter table exam_marks drop constraint FK6BB11B264509265C;
alter table exam_marks drop constraint FK6BB11B26346DDBBC;
alter table exam_marks drop constraint FK6BB11B263E41B987;
alter table registered_student drop constraint FK41DBA57E5257F7CA;
alter table registered_student drop constraint FK41DBA57E69784D99;
alter table registered_student drop constraint FK41DBA57E7270D359;
alter table student_grades drop constraint FKB797CE00A241C458;
alter table student_grades drop constraint FKB797CE002782DBE8;
alter table student_grades drop constraint FKB797CE00346DDBBC;
alter table student_parents drop constraint FKFB67CB05B0D951C3;
alter table student_parents drop constraint FKFB67CB05A42740FC;
alter table student_teachableunits drop constraint FK40FF84048C5EE861;
alter table student_teachableunits drop constraint FK40FF8404346DDBBC;
alter table unit_taught drop constraint FK531DF62666E1E0E7;
alter table unit_taught drop constraint FK531DF6264509265C;
alter table unit_taught drop constraint FK531DF6263CC2950C;
alter table units drop constraint FK6A4576F7270D359;
alter table units_units drop constraint FK525B829F9AC86BE;
alter table units_units drop constraint FK525B829F3DF1EFBC;
alter table user drop constraint FK36EBCB7270D359;
alter table user_role drop constraint FK143BF46AAF761958;
alter table user_role drop constraint FK143BF46A54A0DD38;
drop table academic_term if exists;
drop table administrator if exists;
drop table assesment_grades if exists;
drop table assignments if exists;
drop table courses if exists;
drop table department if exists;
drop table exam_marks if exists;
drop table news if exists;
drop table parents if exists;
drop table registered_student if exists;
drop table registration_code if exists;
drop table role if exists;
drop table student_grades if exists;
drop table student_parents if exists;
drop table student_teachableunits if exists;
drop table time_table if exists;
drop table unit_taught if exists;
drop table units if exists;
drop table units_units if exists;
drop table user if exists;
drop table user_role if exists;
create table academic_term (id bigint generated by default as identity, version bigint not null, semester varchar(255), yearofstudy varchar(255), primary key (id));
create table administrator (id bigint generated by default as identity, version bigint not null, primary key (id));
create table assesment_grades (id bigint generated by default as identity, version bigint not null, catmarks integer not null, exammark integer not null, grade varchar(255) not null, primary key (id));
create table assignments (id bigint generated by default as identity, version bigint not null, primary key (id));
create table courses (id bigint generated by default as identity, version bigint not null, coursecode varchar(255) not null, department_id bigint, name varchar(255) not null, primary key (id));
create table department (id bigint generated by default as identity, version bigint not null, deptcode varchar(255) not null, deptname varchar(255) not null, primary key (id));
create table exam_marks (id bigint generated by default as identity, version bigint not null, grade integer not null, student_id bigint not null, teacher_id bigint not null, unit_id bigint not null, primary key (id));
create table news (id bigint generated by default as identity, version bigint not null, body varchar(255) not null, title varchar(255) not null, primary key (id));
create table parents (id bigint generated by default as identity, version bigint not null, primary key (id));
create table registered_student (id bigint generated by default as identity, version bigint not null, course_id bigint, period_id bigint, registered_student_id bigint, primary key (id));
create table registration_code (id bigint generated by default as identity, date_created timestamp not null, token varchar(255) not null, username varchar(255) not null, primary key (id));
create table role (id bigint generated by default as identity, version bigint not null, authority varchar(255) not null unique, primary key (id));
create table student_grades (id bigint generated by default as identity, version bigint not null, assgrades_id bigint, student_id bigint not null, unittaught_id bigint not null, primary key (id));
create table student_parents (student_followed_id bigint, parents_id bigint);
create table student_teachableunits (student_id bigint, unit_taught_id bigint not null, primary key (student_id, unit_taught_id));
create table time_table (id bigint generated by default as identity, version bigint not null, primary key (id));
create table unit_taught (id bigint generated by default as identity, version bigint not null, academicyear_id bigint not null, courseunit_id bigint not null, teacher_id bigint not null, primary key (id));
create table units (id bigint generated by default as identity, version bigint not null, code varchar(255) not null, course_id bigint, description varchar(255), name varchar(255) not null, semester_offered varchar(255), unit_type varchar(8) not null, year_offered varchar(255), primary key (id));
create table units_units (units_prerequisites_id bigint, units_id bigint);
create table user (id bigint generated by default as identity, version bigint not null, account_expired boolean not null, account_locked boolean not null, email varchar(255) not null, enabled boolean not null, "password" varchar(255) not null, password_expired boolean not null, realname varchar(255) not null, username varchar(255) not null unique, class varchar(255) not null, course_id bigint, date_of_birth timestamp, registrationnumber varchar(255) unique, staffid varchar(255) unique, primary key (id));
create table user_role (role_id bigint not null, user_id bigint not null, primary key (role_id, user_id));
alter table courses add constraint FK391923B89065D58 foreign key (department_id) references department;
alter table exam_marks add constraint FK6BB11B264509265C foreign key (teacher_id) references user;
alter table exam_marks add constraint FK6BB11B26346DDBBC foreign key (student_id) references user;
alter table exam_marks add constraint FK6BB11B263E41B987 foreign key (unit_id) references units;
alter table registered_student add constraint FK41DBA57E5257F7CA foreign key (period_id) references academic_term;
alter table registered_student add constraint FK41DBA57E69784D99 foreign key (registered_student_id) references user;
alter table registered_student add constraint FK41DBA57E7270D359 foreign key (course_id) references courses;
alter table student_grades add constraint FKB797CE00A241C458 foreign key (unittaught_id) references unit_taught;
alter table student_grades add constraint FKB797CE002782DBE8 foreign key (assgrades_id) references assesment_grades;
alter table student_grades add constraint FKB797CE00346DDBBC foreign key (student_id) references user;
alter table student_parents add constraint FKFB67CB05B0D951C3 foreign key (student_followed_id) references user;
alter table student_parents add constraint FKFB67CB05A42740FC foreign key (parents_id) references parents;
alter table student_teachableunits add constraint FK40FF84048C5EE861 foreign key (unit_taught_id) references unit_taught;
alter table student_teachableunits add constraint FK40FF8404346DDBBC foreign key (student_id) references user;
alter table unit_taught add constraint FK531DF62666E1E0E7 foreign key (academicyear_id) references academic_term;
alter table unit_taught add constraint FK531DF6264509265C foreign key (teacher_id) references user;
alter table unit_taught add constraint FK531DF6263CC2950C foreign key (courseunit_id) references units;
alter table units add constraint FK6A4576F7270D359 foreign key (course_id) references courses;
alter table units_units add constraint FK525B829F9AC86BE foreign key (units_prerequisites_id) references units;
alter table units_units add constraint FK525B829F3DF1EFBC foreign key (units_id) references units;
alter table user add constraint FK36EBCB7270D359 foreign key (course_id) references courses;
alter table user_role add constraint FK143BF46AAF761958 foreign key (role_id) references role;
alter table user_role add constraint FK143BF46A54A0DD38 foreign key (user_id) references user;
