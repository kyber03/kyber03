use Practice


select C1, C2 from T1
inner join T2 ON
T1.C1 = T2.C2;

select C1, C2 from T1
Right join T2 ON
T1.C1 = T2.C2;

select C1, C2 from T1
left join T2 ON
T1.C1 = T2.C2;

select C1, C2 from T1
full outer join T2 ON
T1.C1 = T2.C2;


-----------------------------
source query 

create table T1(
C1 int);

insert into T1 values(1);
insert into T1 values(2);
insert into T1 values(3);
insert into T1 values(Null);
insert into T1 values(5);

create table T2(
C2 int);

insert into T2 values(1);
insert into T2 values(1);
insert into T2 values(2);
insert into T2 values(4);
insert into T2 values(Null);

select * from T1;

select * from T2;