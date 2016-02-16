-- Employees 테이블에서 LAST_NAME과 SALARY를 가져온다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
;

-- Employees 테이블에서 LAST_NAME, EMPLOYEE_ID, HIRE_DATE를 가져온다.
SELECT  EMPLOYEE_ID
        , LAST_NAME
        , HIRE_DATE
FROM    EMPLOYEES
;

-- 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, 연봉 및 커미션을 조회
SELECT  EMPLOYEE_ID
        , FIRST_NAME
        , LAST_NAME
        , SALARY
        , COMMISSION_PCT
FROM    EMPLOYEES
;

-- 부서번호와 부서명
SELECT  DEPARTMENT_ID
        , DEPARTMENT_NAME
FROM    DEPARTMENTS
;


-- 부서 번호가 30보다 작은 부서에서 일하는 사원들의 사번과 성과 이름을 조회
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


-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 조회
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 20
OR      DEPARTMENT_ID = 50
;

-- 20번 및 50번 부서에서 근무하지 않는 모든 사원들의 LAST_NAME 및 부서 번호를 조회
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID NOT IN ( 20, 50 )
;

-- 연봉이 12000이상되는 직원들의 LAST_NAME과 SALARY를 가져온다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
ORDER   BY SALARY ASC
        , LAST_NAME ASC
;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 정렬
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   DEPARTMENT_ID = 20
OR      DEPARTMENT_ID = 50
ORDER   BY LAST_NAME ASC
;

-- 1. 연봉이 12000이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT  LAST_NAME
        , SALARY
FROM    EMPLOYEES
WHERE   SALARY >= 12000
;

-- 2. 사원번호가 176인 사람의 LAST_NAME과 부서번호를 조회한다.
SELECT  LAST_NAME
        , DEPARTMENT_ID
FROM    EMPLOYEES
WHERE   EMPLOYEE_ID = 176
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

-- 14. 모든 사원들의 LAST_NAME, 부서 번호 및 부서 이름을 조회한다.
SELECT  E.LAST_NAME
        , D.DEPARTMENT_ID
        , D.DEPARTMENT_NAME
FROM    EMPLOYEES E
        , DEPARTMENTS D
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
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

-- 전 사원의 수
SELECT  DEPARTMENT_ID
        , COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
;

-- 부서별 사원수
SELECT  DEPARTMENT_ID
        , COUNT(EMPLOYEE_ID)
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
ORDER   BY DEPARTMENT_ID
;

-- 부서장(MANAGER_ID) 별 부하 직원의 수를 구하시오
SELECT  MANAGER_ID
        , COUNT( EMPLOYEE_ID )
FROM    EMPLOYEES
GROUP   BY MANAGER_ID
ORDER   BY MANAGER_ID
;

-- 전체 사원 중, 가장 높은 연봉과 가장 낮은 연봉
-- 전체 연봉의 합, 전체 연봉의 평균을 구하시오
SELECT  MAX( SALARY )
        , MIN( SALARY )
        , SUM( SALARY )
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
;

-- 부서별 가장 높은 연봉과 가장 낮은 연봉
-- 전체 연봉의 합, 전체 연봉의 평균을 구하시오
SELECT  NVL (DEPARTMENT_ID, 0) AS DEPARTMENT_ID
        , MAX( SALARY ) AS MAX_SALARY
        , MIN( SALARY ) MIN_SALARY
        , SUM( SALARY ) SUM_SALARY
        , ROUND(AVG( SALARY ))
FROM    EMPLOYEES
GROUP   BY DEPARTMENT_ID
ORDER   BY DEPARTMENT_ID
;

-- 평균 연봉이 5000이상인 것만 집계
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

-- 전체 사원중에서 연봉을 가장 적게받는 금액
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

-- 평균 연봉보다 많이받는 사람들
SELECT  *
FROM    EMPLOYEES
WHERE   SALARY >  (
                    SELECT  AVG(SALARY)
                    FROM    EMPLOYEES
                  )
;

-- 평균 연봉에서 +- 500인 사람들
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

-- 부서별로 연봉을 가장많이 받는 사람
SELECT  *
FROM    EMPLOYEES
WHERE   ( NVL (DEPARTMENT_ID, 0 ) ,SALARY ) IN   (
                                        SELECT  NVL ( DEPARTMENT_ID, 0 )
                                                , MAX(SALARY)
                                        FROM    EMPLOYEES
                                        GROUP   BY DEPARTMENT_ID
                                      )
;
-- 28. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
-- 결과값에서 Zlotkey 는 제외한다.
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

