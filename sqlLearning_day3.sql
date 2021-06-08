alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

--
//비교 연산자 between and 하한가 상한가 순
select ename, sal
 from emp
 where sal BETWEEN 1000 and 3000;
 
//아래와 같음
select ename, sal
    from emp
    where (sal >= 1000 and sal <= 3000);
    
--
// 위의 반대
select ename, sal
    from emp
    where sal not between 1000 and 3000;
    
--    
// 아래와 같음
select ename, sal
    from emp
    where (sal < 1000 OR sal > 3000);
    
select ename, hiredate 
    from emp
    where hiredate between '1982/01/01' and '1982/12/31';
    
--
// 비교연산자 like
// S로 시작하는 이름 가진 사원 출력
select ename, sal
    from emp
    where ename like 'S%';
    
// 두번째 철자가 m 인 사원
select ename, sal
    from emp
    where ename like '_M%';
    
select ename, sal
    from emp
    where ename like '%T';
    
select ename, sal
    from emp
    where ename like '%A%';
    
--    
// 비교연산자 is null
// null 인 경우
Select ename, comm
    from emp
    where comm is null;
// 반대
Select ename, comm
    from emp
    where comm is not null;
    
--    
// 비교연산자 in
select ename, sal, job
    from emp
    where job in ('SALESMAN','ANALYST','MANAGER');
    
select ename, sal, job
    from emp
    where job not in ('SALESMAN','ANALYST','MANAGER');

--
// 논리연산자
select ename, sal, job
    from emp
    where job = 'SALESMAN' and sal >= 1200;
    
select ename, sal, job
    from emp
    where job='ABCDEFG' and sal <= 1200;