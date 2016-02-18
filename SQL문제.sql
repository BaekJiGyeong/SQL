-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 176
;

-- 3. 연봉이 5000에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY < 5000
OR      SALARY > 12000
;

-- 4. 1998/02/20 일부터 1998/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
-- 고용일자 순으로 정렬한다.
SELECT  LAST_NAME
        , EMPLOYEE_ID
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE >= '2002/02/20'
AND     HIRE_DATE <= '2008/05/01'
--BETWEEN TO_DATE('20080220', 'YYYY/MM/DD') 
ORDER   BY HIRE_DATE ASC
;

-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN ( 20, 50 )
ORDER   BY LAST_NAME ASC
;

-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 
-- LAST_NAME 및 연봉을 조회한다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN ( 20, 50 )
AND     SALARY > 5000
AND     SALARY < 12000
;

-- 7. 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
SELECT  LAST_NAME
        , HIRE_DATE
FROM    EMPLOYEES
WHERE   HIRE_DATE
BETWEEN '04-01-01' AND '04-12-31'
;

-- 8. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT  LAST_NAME
        , JOB_ID
FROM    EMPLOYEES
WHERE   MANAGER_ID IS NULL
OR      MANAGER_ID = ''
;

-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
-- 연봉 역순, 커미션 역순차로 정렬한다.
SELECT  LAST_NAME
        , SALARY
        , COMMISSION_PCT
FROM    EMPLOYEES
WHERE   COMMISSION_PCT IS NOT NULL
ORDER   BY SALARY DESC
        , COMMISSION_PCT DESC
;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '___a%'
;

-- 11. LAST_NAME 에 a 및 e 글자가 있는 사원들의 LAST_NAME 을 조회힌다.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '%a%'
OR      LAST_NAME LIKE '%e%'
;

-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT  LAST_NAME, JOB_TITLE
FROM    EMPLOYEES, JOBS
WHERE   SALARY NOT IN ( 2500, 3500, 7000 )
AND     JOB_TITLE IN ( 'Sales Representative', 'Shipping Clerk' )
;


/*13. 직업이 AD_PRESS 인 사람은 A 등급을, 
      ST_MAN 인 사람은 B 등급을,
      IT_PROG 인 사람은 C 등급을,
      SA_REP 인 사람은 D 등급을,
      ST_CLEAK 인 사람은 E 등급을 
      기타는 0 을 부여하여 조회한다.*/
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


-- 14. 모든 사원들의 LAST_NAME, 부서 번호 및 부서 이름을 조회한다.
SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.
SELECT  DISTINCT JOB_ID
        , D.LOCATION_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.DEPARTMENT_ID IN (10, 20, 30, 90 )
;

-- 16. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT  LAST_NAME
        , DEPARTMENT_NAME
        , LOCATION_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.COMMISSION_PCT IS NOT NULL
AND     E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT  E2.LAST_NAME
        , E2.HIRE_DATE
FROM    EMPLOYEES E1
        , EMPLOYEES E2
WHERE   E1.LAST_NAME = 'Davies'
AND     E1.HIRE_DATE < E2.HIRE_DATE
;

-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.
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
-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
;

-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT  JOB_ID
        , MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

-- 21. 동일한 직업을 가진 사원들의 총 수를 조회한다.
SELECT  JOB_ID
        , COUNT( EMPLOYEE_ID )
FROM    EMPLOYEES
GROUP   BY JOB_ID
;

-- 22. 매니저로 근무하는 사원들의 총 수를 조회한다.
SELECT  COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
WHERE   EMPLOYEE_ID IN ( SELECT  DISTINCT MANAGER_ID
                         FROM    EMPLOYEES
                         WHERE   MANAGER_ID IS NOT NULL
                       )
;

-- 23. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT  MAX(SALARY)-MIN(SALARY) AS DIFF
FROM    EMPLOYEES
;

-- 24. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
-- 매니저가 없는 사람들은 제외한다.
-- 최소 연봉이 6000 미만인 경우는 제외한다.
-- 연봉 기준 역순으로 조회한다.

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

-- 25. 부서 명, 위치 ID, 각 부서별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
-- 평균 연봉은 소수점 2자리까지만 표현한다.
SELECT  DEPARTMENT_NAME
        , LOCATION_ID
        , COUNT(EMPLOYEE_ID)
        , ROUND(AVG(SALARY),2)
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP   BY DEPARTMENT_NAME
        , LOCATION_ID
--SELECT절에서 집계함수 제외한 나머지 것들 다 적어야됨
;

-- 26. 총 사원 수 및 1995, 1996, 1997, 1998 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.
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

-- 27. 다음과 같은 포맷으로 각 부서 별 각 직업 별 연봉 총 합 및 각 부서별 연봉 총 합을 조회한다.
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

-- 28. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
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

-- 29. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.
SELECT  EMPLOYEE_ID
        , LAST_NAME
FROM    EMPLOYEES
WHERE   SALARY > (SELECT  AVG(SALARY)
                  FROM    EMPLOYEES
                  )
;

-- 30. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.
SELECT  EMPLOYEE_ID
        , LAST_NAME
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID IN (
                            SELECT  DEPARTMENT_ID
                            FROM    EMPLOYEES
                            WHERE   LAST_NAME LIKE '%u%'
                          )
;
-- 31. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.
SELECT  LAST_NAME
        , D.DEPARTMENT_ID
        , JOB_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.LOCATION_ID = 1700
;

-- 32. King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   MANAGER_ID IN (SELECT EMPLOYEE_ID
                       FROM   EMPLOYEES
                       WHERE  LAST_NAME = 'King'
                      )
;

-- 34. 회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이 
-- 근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.
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

-- 35. ST_CLERK인 직업 ID를 가진 사원이 없는 부서 ID를 조회한다.
-- NULL 값은 제외한다. (NOT EXISTS 사용)
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

-- 36. 위치한 부서가 없는 국가 ID 및 국가 이름을 조회한다.
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

-- 41. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
SELECT  E.LAST_NAME
        , E.DEPARTMENT_ID
        , E.SALARY
FROM    EMPLOYEES E
        , EMPLOYEES E2
WHERE   E.DEPARTMENT_ID = E2.DEPARTMENT_ID
AND     E.SALARY = E2.SALARY
AND     E2.COMMISSION_PCT IS NOT NULL
;



-- 42. 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
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


-- 43. LAST_NAME 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 사원들의
-- LAST_NAME, 부서 번호 및 연봉을 조회한다.
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

-- 44. 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.
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

-- 45. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.
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

-- 46. 각 부서별 평균 연봉보다 더 받는 동일부서 근무사원들의 
-- LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉을 조회한다.
-- 결과는 부서별 연봉을 기준으로 정렬한다.
SELECT  LAST_NAME
        , SALARY
        , E.DEPARTMENT_ID
        , DEP_SAL.AVG_SAL
FROM    EMPLOYEES E
        , (
            SELECT  DEPARTMENT_ID   --부서별 평균연봉 VIEW
                    , ROUND(AVG(SALARY)) AVG_SAL
            FROM    EMPLOYEES
            GROUP   BY DEPARTMENT_ID
          )DEP_SAL
WHERE   E.DEPARTMENT_ID = DEP_SAL.DEPARTMENT_ID
AND     SALARY > (
                    SELECT  ROUND(AVG(AVG_SAL))  --각 부서별 평균 연봉
                    FROM    (
                              SELECT  DEPARTMENT_ID  --부서별 평균연봉 VIEW
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



-- 47. NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회한다.
SELECT  FIRST_NAME
        , LAST_NAME
FROM    EMPLOYEES E1
WHERE   NOT EXISTS (

  SELECT  '1'
  FROM    EMPLOYEES E
  WHERE   E.MANAGER_ID = E1.EMPLOYEE_ID

)
;

-- 48. 소속부서의 평균 연봉보다 적게 버는 사원들의 last_name 을 조회한다.
SELECT  E.LAST_NAME, E.SALARY, DEP_SAL.AVG_SAL
FROM    EMPLOYEES E
        , (
                    SELECT  DEPARTMENT_ID  --부서별 평균연봉 VIEW
                            , ROUND(AVG(SALARY)) AVG_SAL
                    FROM    EMPLOYEES
                    WHERE   DEPARTMENT_ID IS NOT NULL
                    GROUP   BY DEPARTMENT_ID
          ) DEP_SAL
WHERE   E.DEPARTMENT_ID = DEP_SAL.DEPARTMENT_ID
AND     E.SALARY < DEP_SAL.AVG_SAL
;

-- 49. 각 사원 별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 
-- 사원이 존재하는 모든 사원들의 last_name 을 조회한다.
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
