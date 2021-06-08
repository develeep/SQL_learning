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

SELECT empno, ename, sal
    FROM emp;

SELECT *
    FROM emp;
    
SELECT emp.*, empno
    FROM emp;
    
SELECT empno as �����ȣ, ename as ����̸�, sal as "Salary"
  FROM emp; 

--
// ���� -> ||
SELECT ename || sal
    FROM emp;
    
SELECT ename || '�� ������' || sal || '�Դϴ� ' as ��������
    FROM emp;
    
SELECT ename || '�� ������' || job || '�Դϴ� ' as ��������
    from emp;
--
// �ߺ����� 
SELECT DISTINCT job
    FROM emp;
SELECT job
    FROM emp;
    
SELECT UNIQUE job
    FROM emp;
--    
// ������ ����

SELECT ename, sal
    FROM emp
    ORDER BY sal asc;
    
SELECT ename, sal
    FROM emp
    ORDER BY sal desc;
    
SELECT ename , sal as ����
    FROM emp
    ORDER BY ���� asc;
    
SELECT ename , deptno, sal
    FROM emp
    ORDER BY deptno asc , sal desc;
--
// ������ �˻� where
select ename , sal , job
    from emp
    where sal = 3000;

select ename as �̸�, sal as ����
    from emp
    where sal >= 3000;
    
--    
// ���ڿ� ���� �˻�
select ename, sal, job, hiredate, deptno
    from emp
    where ename = 'SCOTT';
    
select ename, sal, job, hiredate, deptno
    from emp
    where hiredate = '81/11/17';
    
// ���� ���� Ȯ��
select *
    from NLS_SESSION_PARAMETERS
    where PARAMETER = 'NLS_DATE_FORMAT';
    
    // ���ǿ����� �Ķ���͸� �ٲ�. ���缼�ǿ����� ��ȿ
    ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';
    SELECT ename, sal
    FROM emp
    WHERE hiredate= '81/11/17';
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    SELECT ename, sal
    FROM emp
    WHERE hiredate= '81/11/17';
    
--
//���������
SELECT ename, sal*12 as ����
    FROM emp
    where sal*12 >= 36000;
    
select ename, sal, comm, sal + comm
    from emp
    where deptno = 10;
    
// nvl = �ΰ��� �ι��� ���� ������ ���
select sal + nvl(comm,1000)
    from emp
    where ename= 'KING';
    
--
// �񱳿�����
select ename, sal, job, deptno
    from emp
    where sal <= 1200;