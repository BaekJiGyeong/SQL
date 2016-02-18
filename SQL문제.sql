-- 1. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
;

-- 2. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 176
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


/*13. ������ AD_PRESS �� ����� A �����, 
      ST_MAN �� ����� B �����,
      IT_PROG �� ����� C �����,
      SA_REP �� ����� D �����,
      ST_CLEAK �� ����� E ����� 
      ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.*/
SELECT  FIRST_NAME
        , LAST_NAME
        , DECODE(JOB_ID
                 , 'AD_PRESS', 'A'
                 , 'ST_MAN', 'B'
                 , 'IT_PROG', 'C'
                 , 'SA_REP', 'D'
                 , 'ST_CLERK', 'E'
                 , '0') JOB_GRADE                          
          FROM    EMPLOYEES
;


-- 14. ��� ������� LAST_NAME, �μ� ��ȣ �� �μ� �̸��� ��ȸ�Ѵ�.
SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 15. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 90 �μ� ���� �����Ѵ�.
SELECT  DISTINCT JOB_ID
        , D.LOCATION_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.DEPARTMENT_ID IN (10, 20, 30, 90 )
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

SELECT  EMP.LAST_NAME
        , EMP.HIRE_DATE
FROM    EMPLOYEES EMP
        , EMPLOYEES MGR
WHERE   EMP.MANAGER_ID = MGR.EMPLOYEE_ID
AND     EMP.HIRE_DATE < MGR.HIRE_DATE
;
-- 19. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
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

-- 23. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
SELECT  MAX(SALARY)-MIN(SALARY) AS DIFF
FROM    EMPLOYEES
;

-- 24. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
-- �Ŵ����� ���� ������� �����Ѵ�.
-- �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
-- ���� ���� �������� ��ȸ�Ѵ�.

--MANAGER VIEW
SELECT  DISTINCT M.EMPLOYEE_ID AS MANAGER_ID
FROM    EMPLOYEES E
        , EMPLOYEES M
WHERE   E.MANAGER_ID = M.EMPLOYEE_ID
;

--ORIGINAL QUERY
SELECT  MANAGER.MANAGER_ID
        ,MIN(SALARY)
FROM    (
          SELECT  DISTINCT M.EMPLOYEE_ID AS MANAGER_ID
          FROM    EMPLOYEES E
                  , EMPLOYEES M
          WHERE   E.MANAGER_ID = M.EMPLOYEE_ID
         ) MANAGER
         , EMPLOYEES E
WHERE   MANAGER.MANAGER_ID = E.MANAGER_ID
GROUP   BY MANAGER.MANAGER_ID
HAVING  MIN(SALARY)>=6000
ORDER   BY MIN(SALARY) DESC
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
-- 31. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , D.DEPARTMENT_ID
        , JOB_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.LOCATION_ID = 1700
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

-- 35. ST_CLERK�� ���� ID�� ���� ����� ���� �μ� ID�� ��ȸ�Ѵ�.
-- NULL ���� �����Ѵ�. (NOT EXISTS ���)
SELECT  DISTINCT DEPARTMENT_ID
FROM    EMPLOYEES E1
WHERE   NOT EXISTS (
                    SELECT  '1'
                    FROM    EMPLOYEES E
                    WHERE   JOB_ID = 'ST_CLERK'
                    AND     E.EMPLOYEE_ID = E1.EMPLOYEE_ID
)
AND     DEPARTMENT_ID IS NOT NULL
;

SELECT  '1'
FROM    EMPLOYEES
WHERE   JOB_ID = 'ST_CLERK'
;

-- 36. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ�Ѵ�.
SELECT  COUNTRY_ID
FROM    DEPARTMENTS D
        , LOCATIONS L
WHERE   D.LOCATION_ID = L.LOCATION_ID
AND     L.COUNTRY_ID = C.COUNTRY_ID
;

SELECT  C.COUNTRY_ID
        , C.COUNTRY_NAME
FROM    COUNTRIES C
WHERE   NOT EXISTS (
                    SELECT  COUNTRY_ID
                    FROM    DEPARTMENTS D
                            , LOCATIONS L
                    WHERE   D.LOCATION_ID = L.LOCATION_ID
                    AND     L.COUNTRY_ID = C.COUNTRY_ID

)
;

-- 41. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT  E.LAST_NAME
        , E.DEPARTMENT_ID
        , E.SALARY
FROM    EMPLOYEES E
        , EMPLOYEES E2
WHERE   E.DEPARTMENT_ID = E2.DEPARTMENT_ID
AND     E.SALARY = E2.SALARY
AND     E2.COMMISSION_PCT IS NOT NULL
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
FROM    EMPLOYEES
WHERE   SALARY > (
                  SELECT  MAX(SALARY)
                  FROM    EMPLOYEES
                  WHERE   JOB_ID = 'SA_MAN'
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

-- 46. �� �μ��� ��� �������� �� �޴� ���Ϻμ� �ٹ�������� 
-- LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ������ ��ȸ�Ѵ�.
-- ����� �μ��� ������ �������� �����Ѵ�.
SELECT  LAST_NAME
        , SALARY
        , E.DEPARTMENT_ID
        , DEP_SAL.AVG_SAL
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID   --�μ��� ��տ��� VIEW
                    , ROUND(AVG(SALARY)) AVG_SAL
            FROM    EMPLOYEES
            GROUP   BY DEPARTMENT_ID
          )DEP_SAL
WHERE   E.DEPARTMENT_ID = DEP_SAL.DEPARTMENT_ID
AND     SALARY > (
                    SELECT  ROUND(AVG(AVG_SAL))  --�� �μ��� ��� ����
                    FROM    (
                              SELECT  DEPARTMENT_ID  --�μ��� ��տ��� VIEW
                                      , ROUND(AVG(SALARY)) AVG_SAL
                              FROM    EMPLOYEES
                              WHERE   DEPARTMENT_ID IS NOT NULL
                              GROUP   BY DEPARTMENT_ID
                              )DEP_SAL
                  )
ORDER   BY DEP_SAL.AVG_SAL
;

SELECT  ROUND(AVG(AVG_SAL))
FROM    (
          SELECT  DEPARTMENT_ID
                  , ROUND(AVG(SALARY)) AVG_SAL
          FROM    EMPLOYEES
          WHERE   DEPARTMENT_ID IS NOT NULL
          GROUP   BY DEPARTMENT_ID
          )DEP_SAL
;



-- 47. NOT EXISTS �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ��� �̸��� ��ȸ�Ѵ�.
SELECT  FIRST_NAME
        , LAST_NAME
FROM    EMPLOYEES E1
WHERE   NOT EXISTS (

  SELECT  '1'
  FROM    EMPLOYEES E
  WHERE   E.MANAGER_ID = E1.EMPLOYEE_ID

)
;

-- 48. �ҼӺμ��� ��� �������� ���� ���� ������� last_name �� ��ȸ�Ѵ�.
SELECT  E.LAST_NAME, E.SALARY, DEP_SAL.AVG_SAL
FROM    EMPLOYEES E
        , (
                    SELECT  DEPARTMENT_ID  --�μ��� ��տ��� VIEW
                            , ROUND(AVG(SALARY)) AVG_SAL
                    FROM    EMPLOYEES
                    WHERE   DEPARTMENT_ID IS NOT NULL
                    GROUP   BY DEPARTMENT_ID
          ) DEP_SAL
WHERE   E.DEPARTMENT_ID = DEP_SAL.DEPARTMENT_ID
AND     E.SALARY < DEP_SAL.AVG_SAL
;

-- 49. �� ��� �� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� 
-- ����� �����ϴ� ��� ������� last_name �� ��ȸ�Ѵ�.
SELECT  E.LAST_NAME
FROM    EMPLOYEES E
WHERE   EXISTS (
                SELECT  '1'
                FROM    EMPLOYEES E2
                WHERE   E.DEPARTMENT_ID = E2.DEPARTMENT_ID
                AND     E.HIRE_DATE < E2.HIRE_DATE
                AND     E.SALARY < E2.SALARY
                )
;
