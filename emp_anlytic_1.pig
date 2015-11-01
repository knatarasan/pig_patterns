--SELECT ename, mgr, hiredate, AVG(sal) OVER (PARTITION BY hiredate) as avg_sal FROM emp;

emp = load 'emp2.csv' using PigStorage(',') as  (empno:int,ename:chararray,job:chararray,mgr:int,hiredate:chararray,sal:int,comm:float,deptno:int);

grp = group emp by hiredate;

av_sal = foreach grp generate group as hiredate, AVG(emp.sal) as avs;

jnd = join av_sal by hiredate, emp by hiredate;

final = foreach jnd generate emp::ename,emp::mgr,av_sal::hiredate,av_sal::avs;

dump final ;
