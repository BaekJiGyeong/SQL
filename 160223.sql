-- 1.영화명, 출연진을 조회 하세요.
SELECT  TITLE
        , A.ACTOR_NAME
FROM    MOVIE M
        , ACTOR_LIST AL
        , ACTOR A
WHERE   M.MOVIE_ID = AL.MOVIE_ID
AND     A.ACTOR_ID = AL.ACTOR_ID
;

-- 2.두개 이상의 영화를 제작한 감독의 이름을 조회하세요.
SELECT  DIRECTOR_NAME
        , COUNT(DM.DIRECTOR_ID)
FROM    DIRECTOR D
        , DIRECTED_MOVIE DM
WHERE   D.DIRECTOR_ID = DM.DIRECTOR_ID
GROUP   BY DIRECTOR_NAME
HAVING  COUNT(DM.DIRECTOR_ID) > 1
;


-- 3.두편 이상의 영화에 출연한 배우의 이름을 조회하세요.
SELECT  *
FROM    (
          SELECT  ACTOR_NAME
                  ,COUNT( ACTOR_LIST_ID) CAL
          FROM    ACTOR_LIST AL
                  , ACTOR A
          WHERE   A.ACTOR_ID = AL.ACTOR_ID
          GROUP   BY ACTOR_NAME
        )
WHERE   CAL > 1
;

-- 4. 평점이 8.0점 미만인 영화에 출연한 배우의 이름과 감독의 이름을 조회하라.
-- (영화 명 포함)
SELECT  TITLE
        , ACTOR_NAME
        , DIRECTOR_NAME
FROM    MOVIE M
        , DIRECTED_MOVIE DM
        , DIRECTOR D
        , ACTOR_LIST AL
        , ACTOR A
WHERE   M.MOVIE_ID = DM.MOVIE_ID
AND     D.DIRECTOR_ID = DM.DIRECTOR_ID
AND     M.MOVIE_ID = AL.MOVIE_ID
AND     A.ACTOR_ID = AL.ACTOR_ID
AND     RATE < 8
;

-- 5. 가장 높은 평점을 기록한 영화의 이름과 배우명, 감독 명을 조회하세요.
SELECT  TITLE
        , ACTOR_NAME
        , DIRECTOR_NAME
FROM    (
          SELECT  MAX(RATE) MAX
          FROM    MOVIE
         )
        , MOVIE M
        , DIRECTED_MOVIE DM
        , DIRECTOR D
        , ACTOR_LIST AL
        , ACTOR A
WHERE   M.MOVIE_ID = DM.MOVIE_ID
AND     D.DIRECTOR_ID = DM.DIRECTOR_ID
AND     M.MOVIE_ID = AL.MOVIE_ID
AND     A.ACTOR_ID = AL.ACTOR_ID
AND     MAX = RATE
;

-- 6. 두 명 이상의 감독이 제작한 영화명을 조회하세요
SELECT  TITLE
FROM    MOVIE M
        , DIRECTED_MOVIE DM
WHERE   M.MOVIE_ID = DM.MOVIE_ID
GROUP   BY TITLE
HAVING  COUNT(DIRECTOR_ID) > 1
;

--7. 출연진이 한 명인 영화의 이름과 배우의 이름을 조회하세요
SELECT  TITLE
        , ACTOR_NAME
FROM    MOVIE M
        , ACTOR_LIST AL
        , ACTOR A
        , (
            SELECT  MOVIE_ID
                    , COUNT(ACTOR_ID) CA
            FROM    ACTOR_LIST
            GROUP   BY MOVIE_ID
        )CMA
WHERE   M.MOVIE_ID = AL.MOVIE_ID
AND     A.ACTOR_ID = AL.ACTOR_ID
AND     CMA.MOVIE_ID = M.MOVIE_ID
AND     CA = 1
;

--8. 영화를 제작하지 않은 감독의 이름을 조회하세요
SELECT  DIRECTOR_NAME
FROM    DIRECTOR D
WHERE   NOT EXISTS (
                SELECT '1'
                FROM    DIRECTED_MOVIE DM
                WHERE   D.DIRECTOR_ID = DM.DIRECTOR_ID
)
;

--9. 영화에 단 판편에도 출연하지 않은 배우의 이름을 조회하세요.
SELECT  ACTOR_NAME
FROM    ACTOR A
WHERE   NOT EXISTS (
                SELECT '1'
                FROM    ACTOR_LIST AL
                WHERE   A.ACTOR_ID = AL.ACTOR_ID
)
;

--10. 두 편이상의 영화에 출연했던 배우와 함께 일했던, 감독의 이름을 조회하세요 조인 가장 많음
SELECT  DISTINCT DIRECTOR_NAME
FROM    DIRECTOR D
        , DIRECTED_MOVIE DM
        , ACTOR_LIST AL
WHERE   AL.ACTOR_ID = (
                        SELECT  ACTOR_ID
                        FROM    MOVIE M
                                , ACTOR_LIST AL
                        WHERE   M.MOVIE_ID = AL.MOVIE_ID
                        GROUP   BY ACTOR_ID
                        HAVING  COUNT(ACTOR_ID) >= 2
                       )
AND     AL.MOVIE_ID = DM.MOVIE_ID
AND     D.DIRECTOR_ID = DM.DIRECTOR_ID
;

--11. 두 편 이상의 영화에 출연했던 배우의 영화 총 평점을 조회하세요
SELECT  M.TITLE
        , M.RATE
FROM    MOVIE M
        , ACTOR_LIST AL
WHERE   AL.ACTOR_ID = (
                        SELECT  ACTOR_ID
                        FROM    MOVIE M
                                , ACTOR_LIST AL
                        WHERE   M.MOVIE_ID = AL.MOVIE_ID
                        GROUP   BY ACTOR_ID
                        HAVING  COUNT(ACTOR_ID) >= 2
                       )
AND     AL.MOVIE_ID = M.MOVIE_ID
;

-- 12.방르멸 영화의 총 개수를 출력하세요
SELECT  G.GENRE_TITLE
        , COUNT (GENRE_LIST_ID)
FROM    GENRE G
        , GENRE_LIST GL
WHERE   G.GENRE_ID = GL.GENRE_ID
GROUP   BY GENRE_TITLE
;

-- 13. 전체관람가 영화를 모두 조회하세요.
SELECT  TITLE
FROM    MOVIE
WHERE   GRADE_ID = (
                    SELECT  GRADE_ID
                    FROM    GRADE
                    WHERE   GRADE_TITLE = '전체 관람가'
                    )
;

-- 14. 12세 이상 관람가 영화에 출연한 배우의 이름을 조회하세요.
SELECT  ACTOR_NAME
FROM    ACTOR A
        , ACTOR_LIST AL
        , MOVIE M
        , GRADE G
WHERE   A.ACTOR_ID = AL.ACTOR_ID
AND     AL.MOVIE_ID = M.MOVIE_ID
AND     M.GRADE_ID = G.GRADE_ID
AND     G.GRADE_TITLE = '12세 이상 관람가'
;

-- 15. 청소년 관람 불가 영화에 출연한 배우의 이름과 감독의 이름을 조회하세요.
SELECT  ACTOR_NAME
        , DIRECTOR_NAME
FROM    ACTOR A
        , ACTOR_LIST AL
        , MOVIE M
        , DIRECTED_MOVIE DM
        , DIRECTOR D
        , GRADE G
WHERE   A.ACTOR_ID = AL.ACTOR_ID
AND     AL.MOVIE_ID = M.MOVIE_ID
AND     M.MOVIE_ID = DM.MOVIE_ID
AND     DM.DIRECTOR_ID = D.DIRECTOR_ID
AND     M.GRADE_ID = G.GRADE_ID
AND     G.GRADE_TITLE = '청소년 관람불가'
;

-- 16. 장르별 영화 중 가장 많은 영화를 가진 장르명을 조회하세요.
SELECT  GENRE_TITLE
FROM    (
          SELECT  G.GENRE_TITLE
                  , COUNT (GENRE_LIST_ID) GC
          FROM    GENRE G
                  , GENRE_LIST GL
          WHERE   G.GENRE_ID = GL.GENRE_ID
          GROUP   BY GENRE_TITLE
          )
WHERE     GC IN (
                  SELECT   MAX( GC )
                  FROM    (
                            SELECT  GENRE_ID
                            , COUNT(GENRE_LIST_ID) GC
                            FROM    GENRE_LIST
                            GROUP   BY GENRE_ID
                            )      
          )
;

SELECT  GENRE_TITLE
FROM    GENRE G
        , (
            SELECT  GENRE_ID
                    , COUNT(MOVIE_ID) AS GENRECOUNT#2
            FROM    GENRE_LIST
            GROUP   BY GENRE_ID        
        )TEMP2
WHERE   TEMP2.GENRECOUNT#2 IN (
                                SELECT  MAX(TEMP1.GENRECOUNT#1)
                                FROM    (
                                            SELECT  GENRE_ID
                                                    , COUNT(MOVIE_ID) AS GENRECOUNT#1
                                            FROM    GENRE_LIST
                                            GROUP   BY GENRE_ID          
                                        ) TEMP1     
                              )
AND     G.GENRE_ID = TEMP2.GENRE_ID                              
;

SELECT  GENRE_ID, COUNT(GENRE_LIST_ID)
FROM    GENRE_LIST
GROUP   BY GENRE_ID
;