


-- 수업 내용

-- 전체 사원들의 사원 번호, LAST_NAME, 부서명, 부서 번호를 조회한다.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , DEPARTMENT_NAME
        , D.DEPARTMENT_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

-- 16. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT  LAST_NAME
        , DEPARTMENT_NAME
        , L.LOCATION_ID
        , CITY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID -- 빨간줄
AND     D.LOCATION_ID = L.LOCATION_ID -- 보라줄
AND     L.LOCATION_ID = (
                          SELECT  LOCATION_ID
                          FROM    LOCATIONS
                          WHERE   CITY = 'Seattle'
                        )
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



-- 과제

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
        , L.LOCATION_ID
        , CITY
FROM    EMPLOYEES E
        , DEPARTMENTS D
        , LOCATIONS L
WHERE   E.COMMISSION_PCT IS NOT NULL
AND     E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     D.LOCATION_ID = L.LOCATION_ID
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
SELECT


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


-- 31. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.
SELECT  LAST_NAME
        , D.DEPARTMENT_ID
        , JOB_ID
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.LOCATION_ID = 1700
;

-- 33. EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID 를 조회한다.
SELECT  D.DEPARTMENT_ID
        , LAST_NAME
        , JOB_ID
FROM    DEPARTMENTS D
        , EMPLOYEES E
WHERE   D.DEPARTMENT_ID = E.DEPARTMENT_ID
AND     D.DEPARTMENT_NAME = 'Executive'
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
