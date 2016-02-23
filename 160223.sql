-- 1.��ȭ��, �⿬���� ��ȸ �ϼ���.
SELECT  TITLE
        , A.ACTOR_NAME
FROM    MOVIE M
        , ACTOR_LIST AL
        , ACTOR A
WHERE   M.MOVIE_ID = AL.MOVIE_ID
AND     A.ACTOR_ID = AL.ACTOR_ID
;

-- 2.�ΰ� �̻��� ��ȭ�� ������ ������ �̸��� ��ȸ�ϼ���.
SELECT  DIRECTOR_NAME
        , COUNT(DM.DIRECTOR_ID)
FROM    DIRECTOR D
        , DIRECTED_MOVIE DM
WHERE   D.DIRECTOR_ID = DM.DIRECTOR_ID
GROUP   BY DIRECTOR_NAME
HAVING  COUNT(DM.DIRECTOR_ID) > 1
;


-- 3.���� �̻��� ��ȭ�� �⿬�� ����� �̸��� ��ȸ�ϼ���.
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

-- 4. ������ 8.0�� �̸��� ��ȭ�� �⿬�� ����� �̸��� ������ �̸��� ��ȸ�϶�.
-- (��ȭ �� ����)
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

-- 5. ���� ���� ������ ����� ��ȭ�� �̸��� ����, ���� ���� ��ȸ�ϼ���.
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

-- 6. �� �� �̻��� ������ ������ ��ȭ���� ��ȸ�ϼ���
SELECT  TITLE
FROM    MOVIE M
        , DIRECTED_MOVIE DM
WHERE   M.MOVIE_ID = DM.MOVIE_ID
GROUP   BY TITLE
HAVING  COUNT(DIRECTOR_ID) > 1
;

--7. �⿬���� �� ���� ��ȭ�� �̸��� ����� �̸��� ��ȸ�ϼ���
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

--8. ��ȭ�� �������� ���� ������ �̸��� ��ȸ�ϼ���
SELECT  DIRECTOR_NAME
FROM    DIRECTOR D
WHERE   NOT EXISTS (
                SELECT '1'
                FROM    DIRECTED_MOVIE DM
                WHERE   D.DIRECTOR_ID = DM.DIRECTOR_ID
)
;

--9. ��ȭ�� �� ������ �⿬���� ���� ����� �̸��� ��ȸ�ϼ���.
SELECT  ACTOR_NAME
FROM    ACTOR A
WHERE   NOT EXISTS (
                SELECT '1'
                FROM    ACTOR_LIST AL
                WHERE   A.ACTOR_ID = AL.ACTOR_ID
)
;

--10. �� ���̻��� ��ȭ�� �⿬�ߴ� ���� �Բ� ���ߴ�, ������ �̸��� ��ȸ�ϼ��� ���� ���� ����
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

--11. �� �� �̻��� ��ȭ�� �⿬�ߴ� ����� ��ȭ �� ������ ��ȸ�ϼ���
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

-- 12.�渣�� ��ȭ�� �� ������ ����ϼ���
SELECT  G.GENRE_TITLE
        , COUNT (GENRE_LIST_ID)
FROM    GENRE G
        , GENRE_LIST GL
WHERE   G.GENRE_ID = GL.GENRE_ID
GROUP   BY GENRE_TITLE
;

-- 13. ��ü������ ��ȭ�� ��� ��ȸ�ϼ���.
SELECT  TITLE
FROM    MOVIE
WHERE   GRADE_ID = (
                    SELECT  GRADE_ID
                    FROM    GRADE
                    WHERE   GRADE_TITLE = '��ü ������'
                    )
;

-- 14. 12�� �̻� ������ ��ȭ�� �⿬�� ����� �̸��� ��ȸ�ϼ���.
SELECT  ACTOR_NAME
FROM    ACTOR A
        , ACTOR_LIST AL
        , MOVIE M
        , GRADE G
WHERE   A.ACTOR_ID = AL.ACTOR_ID
AND     AL.MOVIE_ID = M.MOVIE_ID
AND     M.GRADE_ID = G.GRADE_ID
AND     G.GRADE_TITLE = '12�� �̻� ������'
;

-- 15. û�ҳ� ���� �Ұ� ��ȭ�� �⿬�� ����� �̸��� ������ �̸��� ��ȸ�ϼ���.
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
AND     G.GRADE_TITLE = 'û�ҳ� �����Ұ�'
;

-- 16. �帣�� ��ȭ �� ���� ���� ��ȭ�� ���� �帣���� ��ȸ�ϼ���.
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