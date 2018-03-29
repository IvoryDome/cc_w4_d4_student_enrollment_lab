DROP TABLE student_enrollments;
DROP TABLE houses;

CREATE TABLE houses (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE student_enrollments (
  id serial4 primary key,
  first_name varchar(255),
  second_name varchar(255),
  house_id INT4 REFERENCES houses(id) ON DELETE CASCADE,
  age int2
);
