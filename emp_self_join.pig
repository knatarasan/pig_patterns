--SELECT emp.ename, sup.ename FROM emp JOIN emp as sup ON (emp.mgr = sup.empno);

emp = load 'emp2.csv' using PigStorage(',') as  (empno:int,ename:chararray,job:chararray,mgr:int,hiredate:chararray,sal:int,comm:float,deptno:int);

sup = foreach emp generate *;

--jnd = join emp by mgr,sup by empno;

final = foreach (join emp by mgr,sup by empno) generate emp::ename,sup::ename ;

dump final;


 
