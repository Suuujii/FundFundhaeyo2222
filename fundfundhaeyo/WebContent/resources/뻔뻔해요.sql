---------------------- 삭제 ----------------------
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_UNO;

---------------------- 생성 ----------------------

--------------------------------------------------
----------------- MEMBER 관련 ---------------------	
--------------------------------------------------

CREATE TABLE MEMBER (
  USER_NO NUMBER CONSTRAINT UNO_PK PRIMARY KEY,               
  USER_ID VARCHAR2(30) CONSTRAINT UID_NN CHECK (USER_ID IS NOT NULL),
  USER_PWD VARCHAR2(100) CONSTRAINT UPWD_NN NOT NULL,  
  USER_NAME VARCHAR2(15) CONSTRAINT UNAME_NN NOT NULL, 
  USER_SSN VARCHAR2(14) CONSTRAINT USSN_NN NOT NULL,
  NICKNAME VARCHAR2(100) CONSTRAINT NICKNAME_NN NOT NULL,
  PHONE VARCHAR2(13) CONSTRAINT PHONE_NN NOT NULL,              
  EMAIL VARCHAR2(100) CONSTRAINT EMAIL_NN NOT NULL,            
  ADDRESS VARCHAR2(100) CONSTRAINT ADDRESS_NN NOT NULL,
  PROFILE VARCHAR2(4000) DEFAULT '안녕하세요',
  GRADE NUMBER DEFAULT 1,
  MARKETING VARCHAR2(1) DEFAULT 'N' CHECK (MARKETING IN('Y', 'N')),
  ENROLL_DATE DATE DEFAULT SYSDATE,
  MODIFY_DATE DATE DEFAULT SYSDATE,
  USER_TYPE VARCHAR2(1) DEFAULT 'U' CHECK (USER_TYPE IN('U', 'S')),
  USER_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (USER_STATUS IN('Y', 'A', 'B', 'N')),
  CONSTRAINT UID_UQ UNIQUE (USER_ID)
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.USER_SSN IS '주민등록번호';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.PROFILE IS '소개글';
COMMENT ON COLUMN MEMBER.GRADE IS '회원등급';
COMMENT ON COLUMN MEMBER.MARKETING IS '마케팅동의여부';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.USER_TYPE IS '회원유형(일반U/소셜S)';
COMMENT ON COLUMN MEMBER.USER_STATUS IS '회원상태(사용중Y/탈퇴N/관리자A/블랙리스트B)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', '950814-1234567', '관리자', '010-1234-5678', 'admin@kh.or.kr', '서울시 강남구 역삼동', '관리자입니다', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'A');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user01', 'pass01', '박보영', '900212-232141', '뽀', '010-1111-1111', 'user01@kh.or.kr', '서울시 강동구 천호동', '박보영이에요', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user02', 'pass02', '윈터', '010101-2213456', '앙', '010-2222-2222', 'user02@kh.or.kr', '서울시 양천구 목동', '힘들다', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user03', 'pass03', '진세연', '940215-2224131', '파스타', '010-3333-3333', 'user03@kh.or.kr', '서울시 강서구', '로제 파스타 먹고 싶어요', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user04', 'pass04', '하니', '010101-2141231', '뉴진스', '010-4444-4444', 'user04@kh.or.kr', '서울시 강북구', '뉴진스 하입보이요', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');










COMMIT;
