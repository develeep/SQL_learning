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
// 소숫점을 버리고 출력
select '876.567' as 숫자, trunc(876.567,1)
    from dual;
    
select '876.567' as 숫자, trunc(876.567,-1)
    from dual;    
    
--    
//  나눈 나머지 출력
select mod(10,3)
    from dual;
    
select empno, mod(empno,2)
    from emp;
    
// 짝수인 사원의 번호와 이름 출력
select empno, ename
    from emp
    where mod(empno,2) = 0;

// 나눈 몫
select floor(10/3)
    from dual;
    
--
// 날자 개월수 출력
select ename, MONTHS_BETWEEN(sysdate, hiredate)
    from emp;
    
select to_date('2019-06-01','RRRR-MM-DD') - to_date('2018-10-01','RRRR-MM-DD') as "일 수"
    from dual;
select round((to_date('2019-06-01','RRRR-MM-DD') - to_date('2018-10-01','RRRR-MM-DD')) / 7) as "총 주수"
    from dual;
--
// 개월수 더한 날짜 출력
select add_months(to_date('2019-05-01','RRRR-MM-DD'), 100)
    from dual;
    
// 2019-05-01 부터 100일후 돌아오는 날짜
select to_date('2019-05-01','RRRR-MM-DD') + 100
    from dual;

select to_date('2019-05-01','RRRR-MM-DD') + interval '100' month
    from dual;
select to_date('2019-05-01','RRRR-MM-DD') + interval '1-3' year(1) to month
    from dual;