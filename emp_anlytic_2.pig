--SELECT first_value(ename)  OVER (PARTITION BY hiredate, ORDER BY salary ASC) as name FROM emp;

emp = load 'emp2.csv' using PigStorage(',') as  (empno:int,ename:chararray,job:chararray,mgr:int,hiredate:chararray,sal:int,comm:float,deptno:int);

final = FOREACH (group emp by hiredate) {
	ordered = order emp by sal ASC;
	limited = limit ordered 1;
	GENERATE FLATTEN(limited);
};

final2 = foreach final generate ename;

dump final2;
