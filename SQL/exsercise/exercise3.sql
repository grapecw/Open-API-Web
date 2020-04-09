-- 1. ���տ����� �ǽ� 

-- 1.1 course1 �� course2 �� ��� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����Ͻÿ�.

select name,phone,age
from course1
union
select name,phone,age
from course2;

-- 1.2 course1 �̵� course2 �� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����ϴµ� ���̰� ���� ������ ����Ͻÿ�.
select *
from (select name,phone,age
    from course1
    union
    select name,phone,age
    from course2)
ORDER by age desc;

-- 1.3 course1�� ���������� course2 �� �������� �ʴ� �л����� �̸��� ����Ͻÿ�.

select name,phone,age
from course1
Minus
select name,phone,age
from course2;

-- 1.4 course2�� ���������� course1 �� �������� �ʴ� �л����� �̸��� ��ȭ��ȣ�� 
--    �̸� ������ ����Ͻÿ�.

select * 
from (select name,phone,age
    from course2
    Minus
    select name,phone,age
    from course1
    )
ORDER by name;

--2. ��� ������ ������ ����� ���Ͻÿ�. 
--       (�Ҽ��� ���� ��°�ڸ������� ��Ÿ���� ��°�ڸ� ���ʹ� �����Ͻÿ�)

select trunc(avg(sal),2) AS "�������"
from emp;


--3. ��� �������� �޴� Ŀ�̼��� ���� ���Ͻÿ�.

select sum(comm) AS "Ŀ�̼� ��"
from emp;

select job,sum(sal) AS "�ѿ���"
from emp
GROUP by job
ORDER by sum(sal);

select NVL2(deptno,TO_CHAR(deptno)||'�� �μ�','����') AS "�μ���",count(*)
from emp
GROUP by deptno
ORDER by count(*);

select To_CHAR(hireDATE,'YYYY')||'�⵵' AS "�Ի�⵵",count(*) AS "�Ի��ο�"
from emp
group by To_CHAR(hireDATE,'YYYY')
ORDER by count(*) desc;

select To_CHAR(SysDATE,'YYYY"�� "MM"�� "DD"�� "') || '�������� '||count(*)||'���� �ٹ����Դϴ�.' AS "�ٹ� �ο�"
from emp;

select job,sum(sal)
from emp
where job NOT in('MANAGER')
group by job
having sum(sal)>5000;

select job, To_CHAR(Round(avg(sal+NVL(comm,0)*12),2),'999,999,999.99') AS "��� ����"
from emp
where deptno = 30
group by job;

select To_CHAR(hireDATE,'MM')||'��' AS "��" ,count(*) AS "�Ի��ο�"
from emp
group by To_CHAR(hireDATE,'MM')
having count(*)>=2
order by "��";