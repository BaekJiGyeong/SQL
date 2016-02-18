SELECT  *
FROM    EMP_DETAILS_VIEW
;

SELECT  *
FROM    (
             SELECT
              e.employee_id,
              e.job_id,
              e.manager_id,
              e.department_id,
              d.location_id,
              l.country_id,
              e.first_name,
              e.last_name,
              e.salary,
              e.commission_pct,
              d.department_name,
              j.job_title,
              l.city,
              l.state_province,
              c.country_name,
              r.region_name
            FROM
              employees e,
              departments d,
              jobs j,
              locations l,
              countries c,
              regions r
            WHERE e.department_id = d.department_id
              AND d.location_id = l.location_id
              AND l.country_id = c.country_id
              AND c.region_id = r.region_id
              AND j.job_id = e.job_id
            WITH READ ONLY
)
;

--  30. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT  DISTINCT E.EMPLOYEE_ID
        , LAST_NAME
FROM    (
          SELECT  DEPARTMENT_ID
          FROM    EMPLOYEES
          WHERE   LAST_NAME LIKE '%u%'
        ) U_NAME
        , EMPLOYEES E
WHERE   U_NAME.DEPARTMENT_ID = E.DEPARTMENT_ID
;

-- 31. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.
SELECT  LAST_NAME
        , DEPARTMENT_ID
        , JOB_ID
FROM    (
          SELECT  EMPLOYEE_ID
          FROM    EMPLOYEES E
                  , DEPARTMENTS D
          WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
          AND     D.LOCATION_ID = '1700'
          ) EMP1700
          , EMPLOYEES E
WHERE     EMP1700.EMPLOYEE_ID = E.EMPLOYEE_ID
;

-- 34. ȸ�� ��ü ��� ���� ���� �� ���� ����� ��  -- INLINE VIEW
--     LAST_NAME �� u �� �ִ� ������ ������ �μ��� -- INLINE VIEW
--     ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , SALARY
FROM    (
          /*LAST_NAME�� u�� �ִ� ������� �μ� VIEW*/
          SELECT  DEPARTMENT_ID
          FROM    (
                      /*ȸ�� ��ü ��� ���� ���� �� ���� ��� VIEW*/
                      SELECT  EMPLOYEE_ID
                      FROM    EMPLOYEES
                      WHERE   SALARY > (
                                        SELECT  AVG(SALARY)
                                        FROM    EMPLOYEES
                                        )
                  )EMP2
                  ,EMPLOYEES E
          WHERE   EMP2.EMPLOYEE_ID = E.EMPLOYEE_ID
          AND     E.LAST_NAME LIKE '%u%'
         ) DEPT
         , EMPLOYEES E
WHERE    DEPT.DEPARTMENT_ID = E.DEPARTMENT_ID          
;

-- 42. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� 
--     LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT  DISTINCT LAST_NAME
        , DEPARTMENT_ID
FROM    (
          SELECT  SALARY
                  , NVL(COMMISSION_PCT,0) COMMISSION_PCT
          FROM    EMPLOYEES E
                  , DEPARTMENTS D
          WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
          AND     D.LOCATION_ID = 1700
         ) SAL1700
         , EMPLOYEES E
WHERE     SAL1700.SALARY = E.SALARY
AND       SAL1700.COMMISSION_PCT = NVL(E.COMMISSION_PCT, 0)
;

-- 35. ST_CLERK�� ���� ID�� ���� ����� ���� �μ� ID�� ��ȸ�Ѵ�.
-- NULL ���� �����Ѵ�. (NOT EXISTS ���)
SELECT  *
FROM    EMPLOYEES E
WHERE   NOT EXISTS ( -- �����Ͱ� ���ٸ� ����ض�
                  SELECT  '1'
                  FROM    EMPLOYEES E1
                  WHERE   JOB_ID = 'ST_CLERK'         
                  AND     E1.DEPARTMENT_ID = E.DEPARTMENT_ID
                )
AND     DEPARTMENT_ID IS NOT NULL
;

SELECT  '1'
FROM    EMPLOYEES
WHERE   JOB_ID = 'ST_CLERK'
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
;

SELECT  '1'
FROM    EMPLOYEES E
WHERE   JOB_ID = 'ST_CLERK'
AND     E.EMPLOYEE_ID = E1.EMPLOYEE_ID
;

-- 36. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ�Ѵ�.
SELECT  DISTINCT COUNTRY_ID
        , COUNTRY_NAME
FROM    COUNTRIES C
WHERE   NOT EXISTS (
                    SELECT  '1'
                    FROM    DEPARTMENTS D
                            , LOCATIONS L
                    WHERE   C.COUNTRY_ID = L.COUNTRY_ID
                    AND     L.LOCATION_ID = D.LOCATION_ID
                    )
;
SELECT  '1'
FROM    COUNTRIES C
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   C.COUNTRY_ID = L.COUNTRY_ID
AND     L.LOCATION_ID = D.LOCATION_ID
AND     C.COUNTRY_ID = C1.COUNTRY_ID
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

/*13. ������ AD_PRESS �� ����� A �����, 
      ST_MAN �� ����� B �����,
      IT_PROG �� ����� C �����,
      SA_REP �� ����� D �����,
      ST_CLEAK �� ����� E ����� 
      ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.*/
     
     
SELECT  *
FROM    (
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
          )
WHERE     JOB_GRADE = 'B'
;

SELECT  FIRST_NAME
        , LAST_NAME
        , CASE JOB_ID
                  WHEN 'AD_PRESS' THEN
                    'A'
                  WHEN 'ST_MAN' THEN
                   'B'
                  WHEN 'IT_PROG' THEN
                   'C'
                  WHEN 'SA_REP' THEN
                   'D'
                  WHEN 'ST_CLERK' THEN
                   'E'
                  ELSE '0'
          END
FROM    EMPLOYEES
;

SELECT  FIRST_NAME
        , LAST_NAME
        , CASE  -- �ٸ� �÷����� ���� ���
                  WHEN JOB_ID = 'AD_PRESS' THEN
                    'A'
                  WHEN JOB_ID = 'ST_MAN' THEN
                   'B'
                  WHEN JOB_ID = 'IT_PROG' THEN
                   'C'
                  WHEN JOB_ID = 'SA_REP' THEN
                   'D'
                  WHEN JOB_ID = 'ST_CLERK' THEN
                   'E'
                  ELSE '0'
          END
FROM    EMPLOYEES
;

SELECT  FIRST_NAME
        , LAST_NAME
        , CASE  -- THEN������ ������ �߰��� �� �ִ�.
                  WHEN (SELECT 98 FROM DUAL ) = 100 THEN
                    (SELECT SYSDATE FROM DUAL)
                  WHEN (SELECT 98 FROM DUAL ) >= 90 THEN
                    (SELECT SYSDATE -2 FROM DUAL)
                  WHEN (SELECT 98 FROM DUAL ) >= 80 THEN
                   (SELECT SYSDATE -3 FROM DUAL)
                  WHEN (SELECT 98 FROM DUAL ) >= 70 THEN
                   (SELECT SYSDATE -4 FROM DUAL)
                  WHEN (SELECT 98 FROM DUAL ) >= 60 THEN
                   (SELECT SYSDATE -1 FROM DUAL)
                  ELSE (SELECT SYSDATE -1 FROM DUAL)
          END
FROM    EMPLOYEES
;

SELECT  LPAD('111', 6, '0') || '====DF==='
        || LPAD('1', 6, '0') || '+++'
        || RPAD('111', 6, '0')
        || RPAD('1', 6, '0')
FROM    DUAL
;



