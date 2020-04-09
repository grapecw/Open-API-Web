select *
from emp e,dept d
where d.deptno=e.deptno;

select e.ename,e.job,d.dname
from emp e,dept d
where d.deptno=e.deptno
    AND d.LOC = 'DALLAS';
    
select e.ename,d.dname
from emp e,dept d
where d.deptno=e.deptno
    AND e.ename LIKE '%A%';
    
select e.ename,d.dname,e.sal
from emp e,dept d
where d.deptno=e.deptno
    AND e.sal>=3000;
    
select e.empno AS "������ȣ" , 
    e.ename AS "���� �̸�",
    e.sal*12 AS "����", 
    e.sal*12 + e.comm AS "�Ǳ޿�",
    s.grade AS "�޿����"
from emp e, salgrade s
where e.sal BETWEEN s.losal AND s.hisal
    AND comm is not null;
    
select e.empno AS "������ȣ" , 
    e.ename AS "���� �̸�",
    e.sal AS "����", 
    s.grade AS "�޿����"
from emp e, salgrade s
where e.sal BETWEEN s.losal AND s.hisal
    AND e.deptno = 10;
    
select e.empno AS "������ȣ" , 
    e.ename AS "���� �̸�",
    e.sal AS "����", 
    s.grade AS "�޿����"
from emp e, salgrade s
where e.sal BETWEEN s.losal AND s.hisal
    AND e.deptno IN (10,20)
ORDER by e.deptno desc,e.sal asc;
    
    
select e.ename,e.deptno,NVL(d.dname,'����')
from emp e,dept d
where d.deptno(+)=e.deptno;

select e.ename,NVL(e.deptno,0) AS �μ���ȣ,d.dname
from emp e,dept d
where d.deptno=e.deptno(+);

select e.ename,e.comm,d.dname,d.loc
from emp e,dept d
where d.deptno=e.deptno(+)
    AND comm is not NULL;
    
select e.ename,e.sal,s.grade
from emp e,dept d,salgrade s
where d.deptno=e.deptno(+)
    AND e.sal BETWEEN s.losal AND s.hisal
    AND d.loc = 'DALLAS';
    
select NVL(e.ename,'����?')AS "�̸�",d.deptno,d.dname
from emp e,dept d
where d.deptno=e.deptno(+)
UNION
select e.ename,d.deptno,NVL(d.dname,'���?') AS "�μ���"
from emp e,dept d
where d.deptno(+)=e.deptno;

select e.empno AS "�����ȣ",e.ename AS "����̸�", NVL(TO_CHAR(d.empno),'����') AS "�����ڹ�ȣ", NVL(d.ename, '����') AS "�������̸�"
from emp e,emp d
where e.mgr = d.empno;