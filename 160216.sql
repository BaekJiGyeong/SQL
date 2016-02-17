-- 10. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '___a%'
-- WHERE    SUBSTR (LAST_NAME, 4, 1) = 'a'  ���꽺Ʈ�� ���
;

-- 11. LAST_NAME �� a �� e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ����.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '%a%'
OR      LAST_NAME LIKE '%e%'
;

-- 17. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT  E2.LAST_NAME
        , E2.HIRE_DATE
FROM    EMPLOYEES E1
        , EMPLOYEES E2
WHERE   E1.LAST_NAME = 'Davies'
AND     E1.HIRE_DATE < E2.HIRE_DATE
;

-- 19. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ),1)
FROM    EMPLOYEES
;

-- 20. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT  JOB_ID
        , MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

-- 21. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.
SELECT  JOB_ID
        , COUNT( EMPLOYEE_ID )
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

-- 22. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
SELECT  COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
WHERE   EMPLOYEE_ID IN ( SELECT  DISTINCT MANAGER_ID
                         FROM    EMPLOYEES
                         WHERE   MANAGER_ID IS NOT NULL
                       )
;

SELECT  COUNT (DISTINCT MANAGER_ID)
FROM    EMPLOYEES
;

-- 23. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
SELECT  MAX(SALARY)-MIN(SALARY) AS DIFF
FROM    EMPLOYEES
;

-- 26. �� ��� �� �� 1995, 1996, 1997, 1998 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�.
SELECT  (SELECT COUNT (EMPLOYEE_ID)
         FROM   EMPLOYEES
        )AS TOTAL
        ,(SELECT COUNT (EMPLOYEE_ID)
         FROM   EMPLOYEES
         WHERE  TO_CHAR(HIRE_DATE,'YYYY')='2005'
        )AS Y2005
        ,(SELECT COUNT (EMPLOYEE_ID)
         FROM   EMPLOYEES
         WHERE  TO_CHAR(HIRE_DATE,'YYYY')='2006'
        )AS Y2006
        ,(SELECT COUNT (EMPLOYEE_ID)
         FROM   EMPLOYEES
         WHERE  TO_CHAR(HIRE_DATE,'YYYY')='2007'
        )AS Y2007
        ,(SELECT COUNT (EMPLOYEE_ID)
         FROM   EMPLOYEES
         WHERE  TO_CHAR(HIRE_DATE,'YYYY')='2008'
        )AS Y2008
FROM    EMPLOYEES
WHERE   ROWNUM = 1
;

-- 27. ������ ���� �������� �� �μ� �� �� ���� �� ���� �� �� �� �� �μ��� ���� �� ���� ��ȸ�Ѵ�.
SELECT  JOB_ID
        ,(
        SELECT  NVL(SUM(SALARY),0)
        FROM    EMPLOYEES E2
        WHERE   DEPARTMENT_ID = 20
        AND     E.JOB_ID = E2.JOB_ID
        ) AS DEPT20
        ,(
        SELECT  NVL(SUM(SALARY),0)
        FROM    EMPLOYEES E5
        WHERE   DEPARTMENT_ID = 50
        AND     E.JOB_ID = E5.JOB_ID
        ) AS DEPT50
        ,(
        SELECT  NVL(SUM(SALARY),0)
        FROM    EMPLOYEES E8
        WHERE   DEPARTMENT_ID = 80
        AND     E.JOB_ID = E8.JOB_ID
        ) AS DEPT80
        ,(
        SELECT  NVL(SUM(SALARY),0)
        FROM    EMPLOYEES E9
        WHERE   DEPARTMENT_ID = 90
        AND     E.JOB_ID = E9.JOB_ID
        ) AS DEPT90
        ,(
        SELECT  SUM(SALARY)
        FROM    EMPLOYEES TE
        WHERE   E.JOB_ID = TE.JOB_ID
        ) AS TOTAL
FROM    EMPLOYEES E
GROUP   BY JOB_ID
;

-- 28. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
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

-- 29. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
FROM    EMPLOYEES
WHERE   SALARY > (SELECT  AVG(SALARY)
                  FROM    EMPLOYEES
                  )
;

-- 30. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                            SELECT  DEPARTMENT_ID
                            FROM    EMPLOYEES
                            WHERE   LAST_NAME LIKE '%u%'
                          )
;

-- 32. King �� �Ŵ����� �ΰ� �ִ� ��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   MANAGER_ID IN (SELECT EMPLOYEE_ID
                       FROM   EMPLOYEES
                       WHERE  LAST_NAME = 'King'
                      )
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