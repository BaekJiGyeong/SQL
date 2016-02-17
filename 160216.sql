-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '___a%'
-- WHERE    SUBSTR (LAST_NAME, 4, 1) = 'a'  서브스트링 사용
;

-- 11. LAST_NAME 에 a 및 e 글자가 있는 사원들의 LAST_NAME 을 조회힌다.
SELECT  LAST_NAME
FROM    EMPLOYEES
WHERE   LAST_NAME LIKE '%a%'
OR      LAST_NAME LIKE '%e%'
;

-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT  E2.LAST_NAME
        , E2.HIRE_DATE
FROM    EMPLOYEES E1
        , EMPLOYEES E2
WHERE   E1.LAST_NAME = 'Davies'
AND     E1.HIRE_DATE < E2.HIRE_DATE
;

-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ),1)
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

SELECT  COUNT (DISTINCT MANAGER_ID)
FROM    EMPLOYEES
;

-- 23. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT  MAX(SALARY)-MIN(SALARY) AS DIFF
FROM    EMPLOYEES
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