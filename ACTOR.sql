--------------------------------------------------------
--  파일이 생성됨 - 월요일-2월-29-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACTOR
--------------------------------------------------------

  CREATE TABLE "MOVIE"."ACTOR" 
   (	"ACTOR_ID" NUMBER, 
	"ACTOR_NAME" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into MOVIE.ACTOR
SET DEFINE OFF;
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (207,'김혜수');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (6,'박영희');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (7,'정원도');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (8,'최부업');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (9,'하자진');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (10,'지니퍼 굿윈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (11,'제이슨 베이트먼');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (12,'샤키라');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (13,'이드리스 엘바');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (14,'알란 터딕');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (15,'J.K. 시몬스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (16,'라이언 레이놀즈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (17,'강하늘');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (18,'박정민');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (19,'김인우');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (20,'이미연');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (21,'최지우');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (22,'김주혁');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (23,'유아인');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (25,'이솜');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (26,'이재범');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (27,'이경태');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (28,'김민정');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (29,'브루노 비치어');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (30,'안젤리카 베일');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (31,'오마르 차파로');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (32,'에디 레드메인');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (33,'알리시아 비칸데르');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (34,'엠버 허드');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (35,'적룡');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (36,'주윤발');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (37,'장국영');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (38,'정현진');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (39,'루나');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (40,'홍수아');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (41,'임성언');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (42,'양명헌');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (43,'김하유');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (44,'이채담');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (45,'정혜원');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (46,'이용신');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (47,'김채하');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (48,'소연');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (49,'여윤미');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (50,'김보영');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (51,'이소은');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (52,'방연지');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (53,'임윤선');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (54,'이선');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (55,'최덕희');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (56,'위훈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (57,'신용우');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (58,'김율');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (59,'박선영');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (60,'안영미');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (61,'한신');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (62,'유인나');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (63,'정유정');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (64,'모로호시 스미레');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (65,'타도코로 아즈사');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (66,'오오하시 아야카');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (67,'시모지 시노');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (68,'쿠로사와 토모요');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (69,'누마쿠라 마나미');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (70,'야스노 키요노');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (71,'미무라 유우나');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (72,'스자키 아야');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (73,'코토부키 미나코');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (74,'이시하라 카오리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (75,'타카하시 미나미');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (76,'케이트 윈슬렛');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (77,'주디 데이비스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (78,'리암 헴스워스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (79,'믈라다 쿠돌리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (80,'리카르도 마시');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (81,'구안쿤 유');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (82,'안드레 슈엔');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (83,'타일란 라인하르트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (84,'코시민 이프림');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (85,'마누엘 폰 젠덴');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (86,'미하일 리소프');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (87,'히라노 야스시');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (88,'케이트 블란쳇');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (89,'루니 마라');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (90,'카일 챈들러');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (91,'저스틴 롱');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (92,'제이슨 리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (93,'매튜 그레이 구블러');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (94,'제시 맥카트니');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (95,'크리스티나 애플게이트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (96,'칼리 쿠오코');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (97,'안나 페리스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (98,'킴벌리 윌리엄스-페이슬리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (99,'조쉬 그린');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (100,'토니 헤일');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (101,'벨라 손');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (102,'서기');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (103,'장첸');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (104,'츠마부키 사토시');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (105,'사흔영');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (106,'손예진');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (107,'진백림');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (108,'신현준');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (109,'황정민');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (110,'강동원');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (111,'저스티나 그린자이트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (112,'에릭 커틀러');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (113,'레이 멜로즈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (114,'엘리노어 데니스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (115,'그레이엄 댄비');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (116,'조지 험프리스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (117,'잭 블랙');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (118,'안젤리나 졸리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (119,'더스틴 호프만');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (120,'성룡');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (121,'세스 로건');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (122,'루시 리우');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (123,'데이빗 크로스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (125,'케이트 허드슨');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (126,'제임스 홍');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (127,'브라이언 크랜스톤');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (128,'장-루이 트린티냥');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (129,'스테파니아 산드렐리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (130,'장유상');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (131,'하윤경');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (132,'이서준');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (133,'조재현');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (134,'예론 반 코닝스부르헤');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (135,'조지나 벨바안');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (136,'뱅상 랭동');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (137,'줄리엣 비노쉬');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (138,'루 드 라쥬');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (139,'지오지오 콜란겔리');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (140,'클로틸드 쿠로');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (141,'스타니슬라 메하르');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (142,'하세가와 히로키');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (143,'아소 구미코');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (144,'니시다 토시유키');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (145,'시부카와 키요히코');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (146,'오쿠노 에이타');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (147,'토비 맥과이어');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (148,'리브 슈라이버');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (149,'피터 사스가드');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (150,'릴리 레이브');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (151,'소피 넬리스');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (152,'로빈 웨이거트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (153,'마이클 스털버그');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (154,'이성민');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (155,'이희준');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (156,'이하늬');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (157,'김원해');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (158,'채수빈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (159,'심은경');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (160,'크리스찬 베일');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (161,'스티브 카렐');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (162,'라이언 고슬링');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (163,'브래드 피트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (164,'모건 프리먼');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (165,'다이안 키튼');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (166,'임시완');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (167,'고아성');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (168,'마이클 패스벤더');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (171,'데이너 이브기');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (172,'넬리 타가르');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (173,'샤니 클라인');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (174,'안용준');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (175,'정유석');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (176,'문남숙');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (177,'정혜옥');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (178,'최하나');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (179,'김영선');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (180,'안나 네트렙코');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (181,'이영란');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (182,'전지윤');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (183,'다솜');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (184,'정준원');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (185,'소이');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (186,'스티븐 연');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (187,'신민철');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (188,'신지수');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (189,'이새별');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (190,'정성일');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (191,'이도아');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (192,'이광훈');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (193,'이유미');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (194,'레오나르도 디카프리오');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (195,'톰 하디');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (196,'돔놀 글리슨');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (197,'윌 폴터');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (199,'샤를리즈 테론');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (200,'니콜라스 홀트');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (201,'나카야마 미호');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (202,'토요카와 에츠시');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (203,'김동령');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (204,'박경태');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (205,'나카 리이사');
Insert into MOVIE.ACTOR (ACTOR_ID,ACTOR_NAME) values (206,'이시다 타쿠야');
--------------------------------------------------------
--  DDL for Index ACTOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOVIE"."ACTOR_PK" ON "MOVIE"."ACTOR" ("ACTOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ACTOR
--------------------------------------------------------

  ALTER TABLE "MOVIE"."ACTOR" ADD CONSTRAINT "ACTOR_PK" PRIMARY KEY ("ACTOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MOVIE"."ACTOR" MODIFY ("ACTOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "MOVIE"."ACTOR" MODIFY ("ACTOR_ID" NOT NULL ENABLE);
