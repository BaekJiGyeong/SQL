SELECT  M.*
                   , G.GRADE_TITLE
        	 FROM    MOVIE M
                 , GRADE G
      	   WHERE   M.GRADE_ID = G.GRADE_ID
      	   AND M.MOVIE_ID = 1;
           
   
   