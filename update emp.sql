USE UBAID

select * from EMP

insert into emp values(4,'khushali',22000,'kumar',90,12);
insert into emp values(5,'Mirnaa',12500,'ravi',92,14);

-----------------D/B INSERT AND UPDATE-------VERY IMP--
insert into emp values(13,'Rahman',48000,'Null',91,12);
update emp
set lname = NULL where fname = 'rahman'

alter table emp
 add dept_id int,
    job_id int;

 update emp set dept_id = 90, job_id = 11  where fname = 'stephen';
 update emp set dept_id = 91, job_id = 11  where fname = 'ricky';
 update emp set dept_id = 91, job_id = 12  where fname = 'poorna';

--------------DUPLI REC METHOD #1---------------
SELECT COUNT(*), FNAME FROM EMP
 GROUP BY FNAME
 HAVING COUNT(*) > 2;

 ------DELETE DUPLI RECO METHOD #2------------
 ------- >< OPERATOR ONLY APPLIED IN ROW_NUM------------
 WITH CTE AS(
     SELECT FNAME, LNAME, ROW_NUMBER() OVER (
	  PARTITION BY FNAME ORDER BY FNAME) AS RW
	   FROM EMP
) 
DELETE FROM CTE
WHERE RW > 2;

------- EQUAL TO OPERATOR CAN ONLY BE APPLIED IN DENSER, RANK------------
 WITH CTE AS(
     SELECT FNAME,LNAME,SALARY, DENSE_RANK() OVER (
	  PARTITION BY FNAME ORDER BY SALARY DESC) AS RW
	   FROM EMP
) 
SELECT * FROM CTE
WHERE RW = 1;
---------------------
----------- D/B ROW_NUMBER VS DENSE_RANK VS RANK --- CAN BE USED WITHOUT USING PARTITION----------
 SELECT FNAME,SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RATING FROM EMP
 ORDER BY SALARY DESC ---IT ONLY DEPENDS UPON THE VALUES

 SELECT FNAME,SALARY, ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RATING FROM EMP
 ORDER BY SALARY DESC --- DEPENDS UPON THE CONSECUTIVE ROWS

  SELECT FNAME,SALARY, RANK() OVER(ORDER BY SALARY DESC) AS RATING FROM EMP
 ORDER BY SALARY DESC
 --------------

 UPDATE EMP SET SALARY = 22000 WHERE FNAME = 'ROOPESH'