USE Ubaid

CREATE TABLE EMP (
EID INT,
FNAME VARCHAR(10),
SALARY INT
);

drop table EMP


select * from emp

select a.eid, b.fname, a.salary
from emp a, emp b
where a.salary < b.salary;
