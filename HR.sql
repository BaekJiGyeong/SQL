-- Employees ���̺��� LAST_NAME�� SALARY�� �����´�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
;

-- Employees ���̺��� LAST_NAME, EMPLOYEE_ID, HIRE_DATE�� �����´�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , HIRE_DATE
FROM    EMPLOYEES
;

-- ������� EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ���� �� Ŀ�̼��� ��ȸ
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , SALARY
        , COMMISSION_PCT
FROM    EMPLOYEES
;

-- �μ���ȣ�� �μ���
SELECT  DEPARTMENT_ID
        , DEPARTMENT_NAME
FROM    DEPARTMENTS
;


-- �μ� ��ȣ�� 30���� ���� �μ����� ���ϴ� ������� ����� ���� �̸��� ��ȸ
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , DEPARTMENT_ID
        , SALARY
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID < 30
AND     SALARY >= 5000
--AND EMPLOYEE_ID = 200
;


-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ��ȸ
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 20
OR      DEPARTMENT_ID = 50
;

-- 20�� �� 50�� �μ����� �ٹ����� �ʴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ��ȸ
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID NOT IN ( 20, 50 )
;

-- ������ 12000�̻�Ǵ� �������� LAST_NAME�� SALARY�� �����´�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
ORDER   BY SALARY ASC
        , LAST_NAME ASC
;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ����
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 20
OR      DEPARTMENT_ID = 50
ORDER   BY LAST_NAME ASC
;

-- 1. ������ 12000�̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
;

-- 2. �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ�� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   EMPLOYEE_ID = 176
;

-- 3. ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY < 5000
OR      SALARY > 12000
;

-- 4. 1998/02/20 �Ϻ��� 1998/05/01 ���̿� ���� ������� LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.
-- ������� ������ �����Ѵ�.
SELECT  LAST_NAME
        , EMPLOYEE_ID
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE >= '2002/02/20'
AND     HIRE_DATE <= '2008/05/01'
--BETWEEN TO_DATE('20080220', 'YYYY/MM/DD') 
ORDER   BY HIRE_DATE ASC
;

-- 5. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN ( 20, 50 )
ORDER   BY LAST_NAME ASC
;

-- 6. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� 
-- LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN ( 20, 50 )
AND     SALARY > 5000
AND     SALARY < 12000
;

-- 7. 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE
BETWEEN '04-01-01' AND '04-12-31'
;

-- 8. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , JOB_ID
FROM    EMPLOYEES
WHERE   MANAGER_ID IS NULL
OR      MANAGER_ID = ''
;

-- 9. Ŀ�̼��� ���� ��� ������� LAST_ANME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
-- ���� ����, Ŀ�̼� �������� �����Ѵ�.
SELECT  LAST_NAME
        , SALARY
        , COMMISSION_PCT
FROM    EMPLOYEES
WHERE   COMMISSION_PCT IS NOT NULL
ORDER   BY SALARY DESC
        , COMMISSION_PCT DESC
;

-- 10. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '___a%'
;

-- 11. LAST_NAME �� a �� e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ����.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '%a%'
OR      LAST_NAME LIKE '%e%'
;

-- 12. ������ 2,500, 3,500, 7000 �� �ƴϸ� ������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.
SELECT  LAST_NAME, JOB_TITLE
FROM    EMPLOYEES, JOBS
WHERE   SALARY NOT IN ( 2500, 3500, 7000 )
AND     JOB_TITLE IN ( 'Sales Representative', 'Shipping Clerk' )
;

-- 14. ��� ������� LAST_NAME, �μ� ��ȣ �� �μ� �̸��� ��ȸ�Ѵ�.
SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 16. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_NAME
        , LOCATION_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.COMMISSION_PCT IS NOT NULL
AND     E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 17. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT  E2.LAST_NAME
        , E2.HIRE_DATE
FROM    EMPLOYEES E1
        , EMPLOYEES E2
WHERE   E1.LAST_NAME = 'Davies'
AND     E1.HIRE_DATE < E2.HIRE_DATE
;


-- 2016/02/16


SELECT  DISTINCT MANAGER_ID
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   MANAGER_ID IS NOT NULL
ORDER   BY MANAGER_ID
        , DEPARTMENT_ID
;

SELECT    MANAGER_ID
          , DEPARTMENT_ID
FROM      EMPLOYEES
GROUP     BY DEPARTMENT_ID
          , MANAGER_ID
ORDER     BY MANAGER_ID
          , DEPARTMENT_ID
;

-- �� ����� ��
SELECT  DEPARTMENT_ID
        , COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
;

-- �μ��� �����
SELECT  DEPARTMENT_ID
        , COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
ORDER   BY DEPARTMENT_ID
;

-- �μ���(MANAGER_ID) �� ���� ������ ���� ���Ͻÿ�
SELECT  MANAGER_ID
        , COUNT( EMPLOYEE_ID )
FROM    EMPLOYEES
GROUP   BY MANAGER_ID
ORDER   BY MANAGER_ID
;

-- ��ü ��� ��, ���� ���� ������ ���� ���� ����
-- ��ü ������ ��, ��ü ������ ����� ���Ͻÿ�
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
;

-- �μ��� ���� ���� ������ ���� ���� ����
-- ��ü ������ ��, ��ü ������ ����� ���Ͻÿ�
SELECT  NVL (DEPARTMENT_ID, 0) AS DEPARTMENT_ID
        , MAX( SALARY ) AS MAX_SALARY
        , MIN( SALARY ) MIN_SALARY
        , SUM( SALARY ) SUM_SALARY
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
ORDER   BY DEPARTMENT_ID
;

-- ��� ������ 5000�̻��� �͸� ����
SELECT  NVL (DEPARTMENT_ID, 0) AS DEPARTMENT_ID
        , MAX( SALARY ) AS MAX_SALARY
        , MIN( SALARY ) MIN_SALARY
        , SUM( SALARY ) SUM_SALARY
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
HAVING  AVG(SALARY) >= 5000
ORDER   BY DEPARTMENT_ID
;

-- ��ü ����߿��� ������ ���� ���Թ޴� �ݾ�
SELECT  *
FROM    EMPLOYEES
WHERE   SALARY IN  (
                    SELECT  MAX(SALARY)
                    FROM    EMPLOYEES
                  )
;

SELECT  MIN( SALARY )
FROM    EMPLOYEES
;

-- ��� �������� ���̹޴� �����
SELECT  *
FROM    EMPLOYEES
WHERE   SALARY >  (
                    SELECT  AVG(SALARY)
                    FROM    EMPLOYEES
                  )
;

-- ��� �������� +- 500�� �����
SELECT  *
FROM    EMPLOYEES
WHERE   SALARY >  (
                    SELECT  AVG(SALARY) - 500
                    FROM    EMPLOYEES
                  )
AND     SALARY <  (
                    SELECT  AVG(SALARY) + 500
                    FROM    EMPLOYEES
                    )
ORDER   BY SALARY
;

-- �μ����� ������ ���帹�� �޴� ���
SELECT  *
FROM    EMPLOYEES
WHERE   ( NVL (DEPARTMENT_ID, 0 ) ,SALARY ) IN   (
                                        SELECT  NVL ( DEPARTMENT_ID, 0 )
                                                , MAX(SALARY)
                                        FROM    EMPLOYEES
                                        GROUP   BY DEPARTMENT_ID
                                      )
;
-- 28. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
-- ��������� Zlotkey �� �����Ѵ�.
SELECT  EMPLOYEE_ID
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID =  (
                            SELECT  DEPARTMENT_ID
                            FROM    EMPLOYEES
                            WHERE   LAST_NAME = 'Zlotkey'
                          )
AND     LAST_NAME != 'Zlotkey'
;

-- 34. ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
-- �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                              SELECT  DEPARTMENT_ID
                              FROM    EMPLOYEES
                              WHERE   LAST_NAME LIKE '%u%'
                              AND     SALARY >   (
                                                      SELECT  AVG(SALARY)
                                                      FROM    EMPLOYEES
                                                  )                   
                          )
;

SELECT  DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '%u%'
AND     SALARY >  (
                    SELECT  AVG(SALARY)
                    FROM    EMPLOYEES
                  )
;

SELECT  AVG(SALARY)
FROM    EMPLOYEES
;

SELECT  SUM(SALARY)
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 40
--AND     ROWNUM = 1
;

