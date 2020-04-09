--QUESTION
--1. ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
-- [���]       ����̸�
--           ---------------------
--                  Smith
       
--desc emp;

select INITCAP(ENAME) AS "����̸�"
from EMP;


--2. ������̺��� ����̸��� ��� �̸��� �ι�° ���ں��� �׹�° ���ڱ���
-- ����Ͻÿ�.
-- [���]         ����̸�    2-4����
--                  ---------------------
--                  SMITH        MIT
        
select ENAME AS "����̸�" ,
    SUBSTR(ENAME,2,4)  AS "2~4����"
from EMP;

--3. ������̺��� ��� �̸��� ���� ������ ����Ͻÿ�.
select ENAME,length(ENAME)
from EMP;

--4. ������̺��� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ� 
-- ��� �ҹ��ڷ� ���� ����Ͻÿ�.
select ENAME,LOWER(SUBSTR(ENAME,1,1) || SUBSTR(ENAME,-1,1))
from EMP;

--5. 3456.78�� �ݿø��Ͽ� �Ҽ��� �Ʒ� ù��° �ڸ� ������ ��Ÿ���ÿ�.

select round(3456.78,1) from dual;

--6. ���޿� 50�� ���ϰ� �ʴ����� �����Ͽ� ����ϴµ� ���޵ڿ� '��'�� ���̰� 
--    õ�������� ','�� �ٿ��� ����Ѵ�.
--[���]	��� ���
-----------------
--          40,000��
--	80,000��
-- 	62,500��
--	148,700��

select TO_CHAR(trunc(sal*50,-2),'999,999,999')||'��'
from emp;

--7. ���� �̸��� Ŀ�̼� ���� ���θ� ����ϴµ� �����Ǿ����� '����'
--    �������� �ʾ����� '����'�� ����Ͻÿ�.
--    	SMITH	����	
--	ALLEN	����	300
--	WARD	����	200
--	JONES	����	30

select eNAME , NVL2(COMM ,'����'||TO_CHAR(comm),'����')
FROM EMP;

--8. ���� �̸��� �μ���ȣ �׸��� �μ���ȣ�� ���� �μ����� ����Ͻÿ�.
--    �μ��� ���� ������ '����' �� ����Ͻÿ�.
--    (�μ��� : 10 �̸� 'A �μ�', 20 �̸� 'B �μ�', 30 �̸� 'C �μ�')
desc emp
select eNAME ,DEPTNO, NVL2(DEPTNO,TO_CHAR(DEPTNO)||'�μ�','����')
FROM EMP;

--9. ������ 'SALESMAN'�̰� ������ 1000�̻��� �����
-- �̸��� ������ ����Ͻÿ�.

select eNAME ,SAL
FROM EMP
where job='SALESMAN'
AND SAL>=1000;

--10. ���ó�¥�� ���ó�¥���� 10���� ���� ��¥�� ����Ͻÿ�.

select SYSDATE,SYSDATE+10
FROM dual;

--11. ���� �ð��� "....�� ..�� ..�� ..�� ..��" ���� ����Ͻÿ�.

select TO_CHAR(SYSDATE,'YYYY"��"MM"��"DD"��"HH"��"MI"��"')
FROM dual;

--12. ������ �̸�, ���޿�, ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, ������ ������ $200�� �� ���ʽ��� �����Ͽ� ����մϴ�.)

--�̸�              ���޿�               ����
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400

select ename,sal,(sal+200)*12
FROM emp;

--13.  12��27��_�߰�.docx �� ��ü

select ename AS "�̸�", sal as "����",
    case 
        when sal<1000 THEN 'A'
        when sal<2000 THEN 'B'
        when sal<3000 THEN 'C'
        when sal<4000 THEN 'D'
        else 'E'
    END AS "�ڵ�"
from emp;

--14. 12��27��_�߰�.docx �� ��ü

select ename AS "�̸�", deptno AS "�μ���ȣ",
    DECODE (deptno,
    10,'A',
    20,'B',
    30,'C',
    40,'D'
    )
from emp;

--15. �̸��� �ι�° ���ڰ� ��A���� ��� ������ �̸��� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ� 

--ENAME
----------
--WARD 
--MARTIN
--JAMES

Select ename
from emp
where ename like '_A%';


--16.   ��� ������ �̸��� ��������� �Ի�Ⱓ�� ������(���� ����� ���� �ݿø��� ��)�� 
--   ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--   (�̶�, �Ի�Ⱓ�� �ش��ϴ� ����Ī�� ��MONTHS WORKED���� �ϰ�, 
--    �Ի�Ⱓ�� ���� ���� ���������� �����Ѵ�.)

--��¿�)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348

select ename,round(MONTHS_BETWEEN(SYSDATE,HIREDATE))
from EMP;

--17. ������̺��� ����̸��� ������� ���� ��¥������ �ٹ��ϼ��� ���Ͻÿ�.
--����̸�   �ٹ��ϼ�
-- -----------------------
--SMITH    12474��
--ALLEN    12409��
--WARD    12407��
--JONES    12368��
--MARTIN    12189��
--BLAKE    12369��

select ename,TO_CHAR(round(SYSDATE-HIREDATE))||'��' AS �ٹ��ϼ�
from EMP;

--18. 1981�⵵�� �Ի��� �������� �̸�, ���� �׸��� �Ի�����
--         �Ի��� ������ ����Ͻÿ�.

select ename,job,HIREDATE
from EMP
Where TO_CHAR(HIREDATE,'YYYY')= '1981'
order by hiredate asc;

--19. �������� �������� ������ ����ϴ� SQL  ����� �ۼ��Ͻÿ�.

select TO_CHAR(TO_DATE('1994/08/27'),'DAY')
from dual;

--20. ���縦 �������� ���� �¾�� �� ���� �Ǿ����� �� �� �ִ� 
--      SQL ����� �ۼ��Ͻÿ�.

select MONTHS_BETWEEN(SYSDATE,TO_DATE('1994/08/27','YYYY-MM-DD'))
from dual;

--21. �������� �̸��� ���� �׸��� Ŀ�̼� ������ ����ϴµ�
--     Ŀ�̼��� �������� ���� ������ "����"�̶�� ����Ͻÿ�.
select eNAME , NVL(TO_CHAR(COMM) ,'����')
FROM EMP;

--22. ������̺��� �̸��� ù���ڰ� A�̰� ������ ���ڰ� N�� �ƴ� �����
-- �̸��� ����Ͻÿ�.

Select ename
from emp
where ename like 'A%'
AND ename not like '%N';

--23. ������ �̸�, �Ի� ��¥ �׸��� �⵵�� ���������� �ݿø� ��¥��
--     ����Ͻÿ�.        

Select ename,ROUND(HIREDATE,'DD'),ROUND(HIREDATE,'YYYY')
from emp