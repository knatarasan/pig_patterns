--SELECT loc, AVG(sal) FROM emp JOIN dept USING(deptno) WHERE sal > 3000 GROUP BY loc;

emp = load 'emp2.csv' using PigStorage(',') as  (empno:int,ename:chararray,job:chararray,mgr:int,hiredate:chararray,sal:int,comm:float,deptno:int);

dept = load 'dept.csv' using PigStorage(',') as  (deptno:int,dname:chararray,loc:chararray);

emp_fil = filter emp by sal >3000;

jnd = join emp_fil by deptno,dept by deptno;

grp = group jnd by loc;

final = foreach grp generate group as loc, AVG(jnd.sal) as av_sal;

dump final;


 
