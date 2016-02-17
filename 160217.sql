


-- ���� ����

-- ��ü ������� ��� ��ȣ, LAST_NAME, �μ���, �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , DEPARTMENT_NAME
        , D.DEPARTMENT_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 16. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_NAME
        , L.LOCATION_ID
        , CITY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID -- ������
AND     D.LOCATION_ID = L.LOCATION_ID -- ������
AND     L.LOCATION_ID = (
                          SELECT  LOCATION_ID
                          FROM    LOCATIONS
                          WHERE   CITY = 'Seattle'
                        )
;

-- 25. �μ� ��, ��ġ ID, �� �μ��� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
-- ��� ������ �Ҽ��� 2�ڸ������� ǥ���Ѵ�.
SELECT  DEPARTMENT_NAME
        , LOCATION_ID
        , COUNT(EMPLOYEE_ID)
        , ROUND(AVG(SALARY),2)
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP   BY DEPARTMENT_NAME
        , LOCATION_ID
--SELECT������ �����Լ� ������ ������ �͵� �� ����ߵ�
;



-- ����

-- 14. ��� ������� LAST_NAME, �μ� ��ȣ �� �μ� �̸��� ��ȸ�Ѵ�.
SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 15. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 90 �μ� ���� �����Ѵ�.
SELECT  D.DEPARTMENT_ID
        , JOB_ID
        , D.LOCATION_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     ( D.DEPARTMENT_ID = 30
OR      D.DEPARTMENT_ID = 90)
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

-- 18. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , HIRE_DATE
FROM    EMPLOYEES E
WHERE   HIRE_DATE < (
                      SELECT  HIRE_DATE
                      FROM    EMPLOYEES E2
                      WHERE   E.MANAGER_ID = E2.EMPLOYEE_ID
                      )
;

-- 25. �μ� ��, ��ġ ID, �� �μ��� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
-- ��� ������ �Ҽ��� 2�ڸ������� ǥ���Ѵ�.
SELECT  DEPARTMENT_NAME
        , LOCATION_ID
        , COUNT(EMPLOYEE_ID)
        , ROUND(AVG(SALARY),2)
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP   BY DEPARTMENT_NAME
        , LOCATION_ID
--SELECT������ �����Լ� ������ ������ �͵� �� ����ߵ�
;

-- 31. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , D.DEPARTMENT_ID
        , JOB_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.LOCATION_ID = 1700
;

-- 33. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.
SELECT  D.DEPARTMENT_ID
        , LAST_NAME
        , JOB_ID
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Executive'
;

-- 42. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , D.DEPARTMENT_ID
        , SALARY
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   SALARY IN (
                  SELECT  SALARY
                  FROM    EMPLOYEES E
                          , DEPARTMENTS D
                  WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                  AND     D.LOCATION_ID = 1700
                  )
AND     NVL(COMMISSION_PCT,0) IN (
                  SELECT  NVL(COMMISSION_PCT,0)
                  FROM    EMPLOYEES E
                          , DEPARTMENTS D
                  WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                  AND     D.LOCATION_ID = 1700
                  )
AND     D.DEPARTMENT_ID = E.DEPARTMENT_ID
--AND     D.LOCATION_ID != 1700
;

SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , E.SALARY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , EMPLOYEES E2
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     E.EMPLOYEE_ID = E2.EMPLOYEE_ID
AND     D.LOCATION_ID = 1700
AND     E2.SALARY = E.SALARY
AND     NVL(E2.COMMISSION_PCT,0) = NVL(E.COMMISSION_PCT,0)
;

SELECT  SALARY,COMMISSION_PCT
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = 1700
;

-- 43. LAST_NAME �� 'Kochhar' �� ����� ������ ���� �� Ŀ�̼��� ���� �������
-- LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_ID
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY IN (
                  SELECT  SALARY
                  FROM    EMPLOYEES
                  WHERE   LAST_NAME = 'Kochhar'
                  )
AND     NVL(COMMISSION_PCT,0) IN (
                  SELECT  NVL(COMMISSION_PCT,0)
                  FROM    EMPLOYEES
                  WHERE   LAST_NAME = 'Kochhar'
                  )
AND     LAST_NAME != 'Kochhar'
;

-- 44. ���� ID �� SA_MAN �� ������� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , JOB_ID
        , SALARY
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     SALARY > (
                  SELECT  MAX(SALARY)
                  FROM    EMPLOYEES E
                          , DEPARTMENTS D
                  WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
                  AND     JOB_ID = 'SA_MAN'
                  )
;

-- 45. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , D.DEPARTMENT_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = L.LOCATION_ID
AND     CITY LIKE 'T%'
;
