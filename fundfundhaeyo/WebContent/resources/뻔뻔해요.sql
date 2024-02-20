-- 계정 생성 구문
-- CREATE USER FFHY IDENTIFIED BY FFHY;
-- GRANT CONNECT, RESOURCE TO FFHY;

---------------------- 삭제 ----------------------
DROP TABLE TB_DELIVERY;
DROP TABLE TB_ORDER;
DROP TABLE TB_FUNDING_OPTION;
DROP TABLE TB_REPLY;
DROP TABLE TB_PAYMENT;
DROP TABLE TB_SELLER;
DROP TABLE TB_BUYER;
DROP TABLE TB_FILE;
DROP TABLE TB_LIKES;
DROP TABLE TB_REPORT;
DROP TABLE TB_CHAT;
DROP TABLE TB_PROJECT;
DROP TABLE TB_QNA;
DROP TABLE TB_RP_CATEGORY;
DROP TABLE TB_PJ_CATEGORY;
DROP TABLE TB_FAQ;
DROP TABLE TB_NOTICE;
DROP TABLE TB_ANNOUNCEMENT;
DROP TABLE TB_MEMBER;

DROP SEQUENCE SEQ_DELIVERY_NO;       -- 배송 번호 발생 시퀀스
DROP SEQUENCE SEQ_ORDER_NO;          -- 주문 번호 발생 시퀀스
DROP SEQUENCE SEQ_OPTION_NO;         -- 펀딩 옵션 번호 발생 시퀀스
DROP SEQUENCE SEQ_REPLY_NO;          -- 댓글 번호 발생 시퀀스
DROP SEQUENCE SEQ_PAYMENT_NO;        -- 결제 번호 발생 시퀀스
DROP SEQUENCE SEQ_FILE_NO;           -- 파일 번호 발생 시퀀스
DROP SEQUENCE SEQ_LIKES_NO;          -- 찜하기 번호 발생 시퀀스
DROP SEQUENCE SEQ_PROJECT_NO;        -- 프로젝트 번호 발생 시퀀스
DROP SEQUENCE SEQ_USER_NO;           -- 회원 번호 발생 시퀀스
DROP SEQUENCE SEQ_ANNOUNCEMENT_NO;   -- 공지 번호 발생 시퀀스
DROP SEQUENCE SEQ_NOTICE_NO;         -- 알림 번호 발생 시퀀스
DROP SEQUENCE SEQ_FAQ_NO;            -- FAQ 번호 발생 시퀀스
DROP SEQUENCE SEQ_QNA_NO;            -- QNA 번호 발생 시퀀스
DROP SEQUENCE SEQ_CHAT_NO;           -- 채팅 번호 발생 시퀀스
DROP SEQUENCE SEQ_REPORT_NO;         -- 신고 번호 발생 시퀀스
--------------------------------------------------
----------------- MEMBER 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_MEMBER (
  USER_NO NUMBER CONSTRAINT USER_NO_PK PRIMARY KEY,               
  USER_ID VARCHAR2(30) CONSTRAINT USER_ID_NN CHECK (USER_ID IS NOT NULL),
  USER_PWD VARCHAR2(100) CONSTRAINT USER_PWD_NN NOT NULL,  
  USER_NAME VARCHAR2(15) CONSTRAINT USER_NAME_NN NOT NULL, 
  USER_SSN VARCHAR2(14) CONSTRAINT USER_SSN_NN NOT NULL,
  USER_NICKNAME VARCHAR2(100) CONSTRAINT USER_NICKNAME_NN NOT NULL,
  USER_PHONE VARCHAR2(13) CONSTRAINT USER_PHONE_NN NOT NULL,              
  USER_EMAIL VARCHAR2(100) CONSTRAINT USER_EMAIL_NN NOT NULL,            
  USER_ADDRESS VARCHAR2(100) CONSTRAINT USER_ADDRESS_NN NOT NULL,
  USER_PROFILE VARCHAR2(4000) DEFAULT '안녕하세요',
  USER_GRADE NUMBER DEFAULT 1,
  USER_MARKETING VARCHAR2(1) DEFAULT 'N' CONSTRAINT USER_MARKETING_CK CHECK (USER_MARKETING IN('Y', 'N')),
  USER_ENROLL_DATE DATE DEFAULT SYSDATE,
  USER_MODIFY_DATE DATE DEFAULT SYSDATE,
  USER_TYPE VARCHAR2(1) DEFAULT 'U' CONSTRAINT USER_TYPE_CK CHECK (USER_TYPE IN('U', 'S')),
  USER_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT USER_STATUS_CK CHECK (USER_STATUS IN('Y', 'A', 'B', 'N')),
  CONSTRAINT UID_UQ UNIQUE (USER_ID)
);

COMMENT ON COLUMN TB_MEMBER.USER_NO IS '회원 번호';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS '회원 이름';
COMMENT ON COLUMN TB_MEMBER.USER_SSN IS '회원 주민등록번호';
COMMENT ON COLUMN TB_MEMBER.USER_NICKNAME IS '회원 닉네임';
COMMENT ON COLUMN TB_MEMBER.USER_PHONE IS '회원 전화번호';
COMMENT ON COLUMN TB_MEMBER.USER_EMAIL IS '회원 이메일';
COMMENT ON COLUMN TB_MEMBER.USER_ADDRESS IS '회원 주소';
COMMENT ON COLUMN TB_MEMBER.USER_PROFILE IS '회원 소개글';
COMMENT ON COLUMN TB_MEMBER.USER_GRADE IS '회원 등급 (1 : 일반 / 2 : 고급)';
COMMENT ON COLUMN TB_MEMBER.USER_MARKETING IS '회원 마케팅동의여부 (Y : 동의 / N : 미동의)';
COMMENT ON COLUMN TB_MEMBER.USER_ENROLL_DATE IS '회원 가입일';
COMMENT ON COLUMN TB_MEMBER.USER_MODIFY_DATE IS '회원 정보수정일';
COMMENT ON COLUMN TB_MEMBER.USER_TYPE IS '회원 유형(U : 일반 / S : 소셜)';
COMMENT ON COLUMN TB_MEMBER.USER_STATUS IS '회원 상태값 (Y : 사용중 / N : 탈퇴 / A : 관리자 / B : 블랙리스트)';

CREATE SEQUENCE SEQ_USER_NO
NOCACHE;

INSERT INTO TB_MEMBER
VALUES (SEQ_USER_NO.NEXTVAL, 'admin', '1234', '관리자', '950814-1234567', '관리자', '010-1234-5678', 'admin@kh.or.kr', '서울시 강남구 역삼동', '관리자입니다', 1, 'N', '2024-02-22', SYSDATE, DEFAULT, 'A');

INSERT INTO TB_MEMBER
VALUES (SEQ_USER_NO.NEXTVAL, 'user01', 'pass01', '박보영', '900212-232141', '뽀', '010-1111-1111', 'user01@kh.or.kr', '서울시 강동구 천호동', '박보영이에요', 1, 'N', '2024-02-22', SYSDATE, DEFAULT, 'Y');

INSERT INTO TB_MEMBER
VALUES (SEQ_USER_NO.NEXTVAL, 'user02', 'pass02', '윈터', '010101-2213456', '앙', '010-2222-2222', 'user02@kh.or.kr', '서울시 양천구 목동', '힘들다', 1, 'N', '2024-02-22', SYSDATE, DEFAULT, 'Y');

INSERT INTO TB_MEMBER
VALUES (SEQ_USER_NO.NEXTVAL, 'user03', 'pass03', '진세연', '940215-2224131', '파스타', '010-3333-3333', 'user03@kh.or.kr', '서울시 강서구', '로제 파스타 먹고 싶어요', 1, 'N', '2024-02-22', SYSDATE, DEFAULT, 'Y');

INSERT INTO TB_MEMBER
VALUES (SEQ_USER_NO.NEXTVAL, 'user04', 'pass04', '하니', '010101-2141231', '뉴진스', '010-4444-4444', 'user04@kh.or.kr', '서울시 강북구', '뉴진스 하입보이요', 1, 'N', '2024-02-22', SYSDATE, DEFAULT, 'Y');
--------------------------------------------------
-------------- ANNOUNCEMENT 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_ANNOUNCEMENT (
    ANNOUNCEMENT_NO NUMBER CONSTRAINT ANNOUNCEMENT_NO_PK PRIMARY KEY,
    ANNOUNCEMENT_TITLE VARCHAR2(100) CONSTRAINT ANNOUNCEMENT_TITLE_NN NOT NULL,
    ANNOUNCEMENT_CONTENT VARCHAR2(4000) CONSTRAINT ANNOUNCEMENT_CONTENT_NN NOT NULL,
    ANNOUNCEMENT_WRITER NUMBER CONSTRAINT ANNOUNCEMENT_WRITER_NN NOT NULL,
    ANNOUNCEMENT_COUNT NUMBER DEFAULT 0,
    ANNOUNCEMENT_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT ANNOUNCEMENT_CREATE_DATE_NN NOT NULL,
    ANNOUNCEMENT_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ANNOUNCEMENT_STATUS_CK CHECK (ANNOUNCEMENT_STATUS IN('Y', 'N')),
    CONSTRAINT ANNOUNCEMENT_WRITER_FK FOREIGN KEY(ANNOUNCEMENT_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_NO IS '공지 번호';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_TITLE IS '공지 제목';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_CONTENT IS '공지 내용';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_WRITER IS '공지 작성자회원번호';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_COUNT IS '공지 조회수';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_CREATE_DATE IS '공지 작성일';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_STATUS IS '공지 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_ANNOUNCEMENT_NO
NOCACHE;

INSERT INTO TB_ANNOUNCEMENT
VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '오픈! 뻔뻔해요!', '첫번째 공지 내용입니다.', 1, DEFAULT, '2024-02-22', DEFAULT);

INSERT INTO TB_ANNOUNCEMENT
VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '두번째 공지 제목입니다.', '두번째 공지 내용입니다.', 1, DEFAULT, '2024-02-23', DEFAULT);

INSERT INTO TB_ANNOUNCEMENT
VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '세번째 공지 제목입니다.', '세번째 공지 내용입니다.', 1, DEFAULT, '2024-02-24', DEFAULT);

INSERT INTO TB_ANNOUNCEMENT
VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '네번째 공지 제목입니다.', '네번째 공지 내용입니다.', 1, DEFAULT, '2024-02-25', DEFAULT);

INSERT INTO TB_ANNOUNCEMENT
VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '다섯번째 공지 제목입니다.', '다섯번째 공지 내용입니다.', 1, DEFAULT, '2024-02-26', DEFAULT);
--------------------------------------------------
----------------- NOTICE 알림 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_NOTICE (
    NOTICE_NO NUMBER CONSTRAINT NOTICE_NO_PK PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
    NOTICE_WRITER NUMBER CONSTRAINT NOTICE_WRITER_NN NOT NULL,
    NOTICE_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT NOTICE_CREATE_DATE_NN NOT NULL,
    NOTICE_TYPE NUMBER DEFAULT 1 CONSTRAINT NOTICE_TYPE_CK CHECK (NOTICE_TYPE IN(1, 2, 3)),
    NOTICE_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT NOTICE_STATUS_CK CHECK (NOTICE_STATUS IN('Y', 'N')),
    CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY(NOTICE_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '알림 번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_TITLE IS '알림 제목';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '알림 내용';
COMMENT ON COLUMN TB_NOTICE.NOTICE_WRITER IS '알림 작성자회원번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CREATE_DATE IS '알림 작성일';
COMMENT ON COLUMN TB_NOTICE.NOTICE_TYPE IS '알림 유형 (1 : 일반 공지 / 2 : 프로젝트 알림 / 3 : QNA 알림)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_STATUS IS '알림 상태값 (Y : 읽음 / N : 안읽음)';

CREATE SEQUENCE SEQ_NOTICE_NO
NOCACHE;
--------------------------------------------------
----------------- FAQ 게시판 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_FAQ (
    FAQ_NO NUMBER CONSTRAINT FAQ_NO_PK PRIMARY KEY,
    FAQ_TITLE VARCHAR2(100) CONSTRAINT FAQ_TITLE_NN NOT NULL,
    FAQ_CONTENT VARCHAR2(4000) CONSTRAINT FAQ_CONTENT_NN NOT NULL,
    FAQ_WRITER NUMBER CONSTRAINT FAQ_WRITER_NN NOT NULL,
    FAQ_COUNT NUMBER DEFAULT 0,
    FAQ_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FAQ_CREATE_DATE_NN NOT NULL,
    FAQ_MODIFY_DATE DATE DEFAULT SYSDATE,
    FAQ_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT FAQ_STATUS_CK CHECK (FAQ_STATUS IN('Y', 'N')),
    CONSTRAINT FAQ_WRITER_FK FOREIGN KEY(FAQ_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_FAQ.FAQ_NO IS '자주묻는질문 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_TITLE IS '자주묻는질문 제목';
COMMENT ON COLUMN TB_FAQ.FAQ_CONTENT IS '자주묻는질문 내용';
COMMENT ON COLUMN TB_FAQ.FAQ_WRITER IS '자주묻는질문 작성자회원번호';
COMMENT ON COLUMN TB_FAQ.FAQ_COUNT IS '자주묻는질문 조회수';
COMMENT ON COLUMN TB_FAQ.FAQ_CREATE_DATE IS '자주묻는질문 작성일';
COMMENT ON COLUMN TB_FAQ.FAQ_MODIFY_DATE IS '자주묻는질문 수정일';
COMMENT ON COLUMN TB_FAQ.FAQ_STATUS IS '자주묻는질문 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_FAQ_NO
NOCACHE;

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '첫번째 자주묻는질문 제목입니다.', '첫번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '두번째 자주묻는질문 제목입니다.', '두번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '세번째 자주묻는질문 제목입니다.', '세번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '네번째 자주묻는질문 제목입니다.', '네번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '다섯번째 자주묻는질문 제목입니다.', '다섯번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '여섯번째 자주묻는질문 제목입니다.', '여섯번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '일곱번째 자주묻는질문 제목입니다.', '일곱번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '여덟번째 자주묻는질문 제목입니다.', '여덟번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '아홉번째 자주묻는질문 제목입니다.', '아홉번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);

INSERT INTO TB_FAQ
VALUES (SEQ_FAQ_NO.NEXTVAL, '열번째 자주묻는질문 제목입니다.', '열번째 자주묻는질문 내용입니다.', 1, DEFAULT, '2024-02-22', '2024-02-22', DEFAULT);
--------------------------------------------------
----------------- PJ_CATEGORY 관련 ----------------	
--------------------------------------------------
CREATE TABLE TB_PJ_CATEGORY(
  PJ_CATEGORY_NO NUMBER CONSTRAINT PJ_CATEGORY_NO_PK PRIMARY KEY,
  PJ_CATEGORY_NAME VARCHAR2(30) CONSTRAINT PJ_CATEGORY_NAME_NN NOT NULL
);

COMMENT ON COLUMN TB_PJ_CATEGORY.PJ_CATEGORY_NO IS '펀딩 프로젝트 카테고리 번호';
COMMENT ON COLUMN TB_PJ_CATEGORY.PJ_CATEGORY_NAME IS '펀딩 프로젝트 카테고리 이름';

INSERT INTO TB_PJ_CATEGORY VALUES(10, '공통');
INSERT INTO TB_PJ_CATEGORY VALUES(20, '푸드');
INSERT INTO TB_PJ_CATEGORY VALUES(30, '보드게임');
INSERT INTO TB_PJ_CATEGORY VALUES(40, '캐릭터');
INSERT INTO TB_PJ_CATEGORY VALUES(50, '향수');
INSERT INTO TB_PJ_CATEGORY VALUES(60, '공연');
INSERT INTO TB_PJ_CATEGORY VALUES(70, '게임');
INSERT INTO TB_PJ_CATEGORY VALUES(80, '의류');
INSERT INTO TB_PJ_CATEGORY VALUES(90, '웹툰');
INSERT INTO TB_PJ_CATEGORY VALUES(100, '가전');
INSERT INTO TB_PJ_CATEGORY VALUES(110, '잡화');
INSERT INTO TB_PJ_CATEGORY VALUES(120, '사진');
INSERT INTO TB_PJ_CATEGORY VALUES(130, '반려동물');
INSERT INTO TB_PJ_CATEGORY VALUES(140, '주얼리');
INSERT INTO TB_PJ_CATEGORY VALUES(150, '음악');
INSERT INTO TB_PJ_CATEGORY VALUES(160, '스포츠');
INSERT INTO TB_PJ_CATEGORY VALUES(170, '패션');
INSERT INTO TB_PJ_CATEGORY VALUES(180, '키즈');
INSERT INTO TB_PJ_CATEGORY VALUES(190, '가구');
INSERT INTO TB_PJ_CATEGORY VALUES(200, '기타');
--------------------------------------------------
----------------- RP_CATEGORY 관련 ----------------	
--------------------------------------------------
CREATE TABLE TB_RP_CATEGORY(
  RP_CATEGORY_NO NUMBER CONSTRAINT RP_CATEGORY_NO_RP PRIMARY KEY,
  RP_CATEGORY_NAME VARCHAR2(100) CONSTRAINT RP_CATEGORY_NAME_NN NOT NULL
);

COMMENT ON COLUMN TB_RP_CATEGORY.RP_CATEGORY_NO IS '펀딩 프로젝트 카테고리 번호';
COMMENT ON COLUMN TB_RP_CATEGORY.RP_CATEGORY_NAME IS '펀딩 프로젝트 카테고리 이름';

INSERT INTO TB_RP_CATEGORY VALUES(1, '스팸홍보/도배글입니다.');
INSERT INTO TB_RP_CATEGORY VALUES(2, '음란물입니다.');
INSERT INTO TB_RP_CATEGORY VALUES(3, '불법정보를 포함하고 있습니다.');
INSERT INTO TB_RP_CATEGORY VALUES(4, '청소년에게 유해한 내용입니다.');
INSERT INTO TB_RP_CATEGORY VALUES(5, '욕설/생명경시/혐오/차별적 표현입니다.');
INSERT INTO TB_RP_CATEGORY VALUES(6, '개인정보 노출 게시물입니다.');
INSERT INTO TB_RP_CATEGORY VALUES(7, '불쾌한 표현이 있습니다.');
INSERT INTO TB_RP_CATEGORY VALUES(8, '명예훼손 또는 저작권이 침해되었습니다.');
INSERT INTO TB_RP_CATEGORY VALUES(9, '불법촬영물등이 포함되어 있습니다.');
INSERT INTO TB_RP_CATEGORY VALUES(10, '기타');
--------------------------------------------------
----------------- QNA 게시판 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_QNA(
    QNA_NO NUMBER CONSTRAINT QNA_NO_PK PRIMARY KEY,
    QNA_TYPE NUMBER DEFAULT 1 CONSTRAINT QNA_TYPE_CK CHECK(QNA_TYPE IN(1, 2)),
    QNA_WRITER NUMBER CONSTRAINT QNA_WRITER_NN NOT NULL,
    QNA_TITLE VARCHAR2(100) CONSTRAINT QNA_TITLE_NN NOT NULL,
    QNA_CONTENT VARCHAR2(4000) CONSTRAINT QNA_CONTENT_NN NOT NULL,
    QNA_COUNT NUMBER DEFAULT 0,
    QNA_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT QNA_CREATE_DATE_NN NOT NULL,
    QNA_MODIFY_DATE DATE DEFAULT SYSDATE,
    QNA_ANSWER_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT QNA_ANSWER_STATUS_CK CHECK(QNA_ANSWER_STATUS IN('Y', 'N')),
    QNA_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT QNA_STATUS_CK CHECK(QNA_STATUS IN('Y', 'N')),
    CONSTRAINT QNA_WRITER_FK FOREIGN KEY (QNA_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_QNA.QNA_NO IS 'QNA 번호';
COMMENT ON COLUMN TB_QNA.QNA_WRITER IS 'QNA 작성자회원번호';
COMMENT ON COLUMN TB_QNA.QNA_TYPE IS 'QNA 타입 (1 : 일반 / 2 : 사진)';
COMMENT ON COLUMN TB_QNA.QNA_TITLE IS 'QNA 제목';
COMMENT ON COLUMN TB_QNA.QNA_CONTENT IS 'QNA 내용';
COMMENT ON COLUMN TB_QNA.QNA_COUNT IS 'QNA 조회수';
COMMENT ON COLUMN TB_QNA.QNA_CREATE_DATE IS 'QNA 작성일';
COMMENT ON COLUMN TB_QNA.QNA_MODIFY_DATE IS 'QNA 수정일';
COMMENT ON COLUMN TB_QNA.QNA_STATUS IS 'QNA 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_QNA_NO
NOCACHE;

INSERT INTO TB_QNA(QNA_NO, QNA_TYPE, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 1, 2, '프로젝트에 대한 문의', '상세한 내용을 알려주실 수 있나요?', '2024-02-22', 'N', 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_TYPE, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 1, 2, '프로젝트 후원 방법 문의', '후원 방법에 대해 자세히 설명해주실 수 있나요?', '2024-02-23', 'N', 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_TYPE, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 1, 4, '프로젝트 진행 상황 문의', '진행 상황에 대해 업데이트 해주실 수 있나요?', '2024-02-24', 'N', 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_TYPE, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 1, 3, '후원한 프로젝트의 선물 배송 일정 문의', '선물 배송 일정에 대해 알려주실 수 있나요?', '2024-02-25', 'N', 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_TYPE, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 1, 2, '프로젝트에 대해 더 자세히 알고 싶습니다', '추가 정보를 제공해주실 수 있나요?', '2024-02-26', 'N', 'Y');
--------------------------------------------------
----------------- PROJECT 관련 --------------------	
--------------------------------------------------
CREATE TABLE TB_PROJECT (
    PROJECT_NO NUMBER CONSTRAINT PROJECT_NO_PK PRIMARY KEY,
    PROJECT_SELLER NUMBER CONSTRAINT PROJECT_SELLER_NN NOT NULL,
    PROJECT_CATEGORY_NO NUMBER CONSTRAINT PROJECT_CATEGORY_NO_NN NOT NULL,
    PROJECT_OVERVIEW VARCHAR2(500) CONSTRAINT PROJECT_OVERVIEW_NN NOT NULL,
    PROJECT_TITLE VARCHAR2(100) CONSTRAINT PROJECT_TITLE_NN NOT NULL,
    PROJECT_CONTENT VARCHAR2(4000) CONSTRAINT PROJECT_CONTENT_NN NOT NULL,
    PROJECT_TAG VARCHAR2(50) CONSTRAINT PROJECT_TAG_NN NOT NULL,
    PROJECT_PRICE NUMBER CONSTRAINT PROJECT_PRICE_NN NOT NULL,
    PROJECT_START DATE CONSTRAINT PROJECT_START_NN NOT NULL,
    PROJECT_END DATE CONSTRAINT PROJECT_END_NN NOT NULL,
    PROJECT_PAYMENT_BUYER DATE CONSTRAINT PROJECT_PAYMENT_BUYER_NN NOT NULL,
    PROJECT_PAYMENT_SELLER DATE CONSTRAINT PROJECT_PAYMENT_SELLER_NN NOT NULL,
    PROJECT_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT PROJECT_STATUS_CK CHECK(PROJECT_STATUS IN('Y', 'N')),
    CONSTRAINT PROJECT_SELLER_FK FOREIGN KEY (PROJECT_SELLER) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT PROJECT_CATEGORY_NO_FK FOREIGN KEY (PROJECT_CATEGORY_NO) REFERENCES TB_PJ_CATEGORY(PJ_CATEGORY_NO)
);

COMMENT ON COLUMN TB_PROJECT.PROJECT_NO IS '펀딩 프로젝트 번호';
COMMENT ON COLUMN TB_PROJECT.PROJECT_SELLER IS '펀딩 프로젝트 창작자회원번호';
COMMENT ON COLUMN TB_PROJECT.PROJECT_CATEGORY_NO IS '펀딩 프로젝트 카테고리';
COMMENT ON COLUMN TB_PROJECT.PROJECT_OVERVIEW IS '펀딩 프로젝트 요약 설명';
COMMENT ON COLUMN TB_PROJECT.PROJECT_TITLE IS '펀딩 프로젝트 제목';
COMMENT ON COLUMN TB_PROJECT.PROJECT_CONTENT IS '펀딩 프로젝트 내용';
COMMENT ON COLUMN TB_PROJECT.PROJECT_TAG IS '펀딩 프로젝트 태그';
COMMENT ON COLUMN TB_PROJECT.PROJECT_PRICE IS '펀딩 프로젝트 목표금액';
COMMENT ON COLUMN TB_PROJECT.PROJECT_START IS '펀딩 프로젝트 시작일';
COMMENT ON COLUMN TB_PROJECT.PROJECT_END IS '펀딩 프로젝트 종료일';
COMMENT ON COLUMN TB_PROJECT.PROJECT_PAYMENT_BUYER IS '펀딩 프로젝트 후원자결제기한';
COMMENT ON COLUMN TB_PROJECT.PROJECT_PAYMENT_SELLER IS '펀딩 프로젝트 창작자정산일';
COMMENT ON COLUMN TB_PROJECT.PROJECT_STATUS IS '펀딩 프로젝트 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_PROJECT_NO
START WITH 1000
NOCACHE;

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 2, 20, '세상 단 하나뿐인 마시는 푸딩', '푸딩을 마실 수 있다?', '국내 최초 마시는 푸딩을 개발하였습니다. 더 이상 떠 먹지 말고 마셔요', '#마시는 푸딩', 1000000, '2020-02-21', '2020-03-20', '2020-03-27', '2020-04-03', 'Y');

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 2, 30, '추억의 비석치기', '돌덩이로 게임이 된다', '전통놀이인 비석치기, 더 이상 옛 놀이가 아니에요', '#비석치기', 2000000, '2020-02-25', '2020-03-24', '2020-03-31', '2020-04-07', 'Y');

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 3, 140, '뒷모습은 사람이다', '찰랑찰랑 맹이 사진', '머릿결이 찰랑거리는 반려견 맹이의 단독 사진', '#귀여운 강아지', 3000000, '2020-02-26', '2020-03-25', '2020-04-01', '2020-04-08', 'Y');

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 2, 50, '벌꿀 향수?', '여름대비 고급 향수', '무더운 여름을 날려줄 천연 향수', '#천연 향수', 4000000, '2020-02-28', '2020-03-27', '2020-04-03', '2020-04-10', 'Y');

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 4, 60, '셜록홈즈', '셜록홈즈 일대기', '그가 살아온 인생이 궁금하다면?', '#셜록홈즈', 5000000, '2020-03-01', '2020-03-31', '2020-04-07', '2020-04-14', 'Y');

INSERT INTO TB_PROJECT(PROJECT_NO, PROJECT_SELLER, PROJECT_CATEGORY_NO, PROJECT_OVERVIEW, PROJECT_TITLE, PROJECT_CONTENT, PROJECT_TAG, PROJECT_PRICE, PROJECT_START, PROJECT_END, PROJECT_PAYMENT_BUYER, PROJECT_PAYMENT_SELLER, PROJECT_STATUS) 
VALUES(SEQ_PROJECT_NO.NEXTVAL, 2, 70, '추억의 이순신 게임', '7차 교육과정에도 실린 이순신 게임', '그 시절이 궁금하신가요?', '#이순신 게임', 6000000, '2020-03-15', '2020-04-14', '2020-04-21', '2020-04-28', 'Y');
--------------------------------------------------
------------------ CHAT 관련 ----------------------	
--------------------------------------------------
CREATE TABLE TB_CHAT (
    CHAT_NO NUMBER CONSTRAINT CHAT_NO_PK PRIMARY KEY,
    CHAT_WRITER NUMBER CONSTRAINT CHAT_WRITER_NN NOT NULL,
    CHAT_PROJECT_NO NUMBER CONSTRAINT CHAT_PROJECT_NO_NN NOT NULL,
    CHAT_CONTENT VARCHAR2(4000),
    CONSTRAINT CHAT_WRITER_FK FOREIGN KEY (CHAT_WRITER) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT CHAT_PROJECT_NO_FK FOREIGN KEY (CHAT_PROJECT_NO) REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_CHAT.CHAT_NO IS '채팅 번호';
COMMENT ON COLUMN TB_CHAT.CHAT_WRITER IS '채팅 작성자';
COMMENT ON COLUMN TB_CHAT.CHAT_PROJECT_NO IS '채팅 프로젝트번호';
COMMENT ON COLUMN TB_CHAT.CHAT_CONTENT IS '채팅 내용';

CREATE SEQUENCE SEQ_CHAT_NO
NOCACHE;

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 2, 1001, '안녕하세요 창작자님. 뭐 좀 물어봐도 될까요?');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 4, 1001, '안녕하세요 후원자님! 언제든지 편히 연락주세요!');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 2, 1001, '답변이 기계적이네');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 4, 1001, '불편을 끼쳐 죄송합니다');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 2, 1001, '그런 말투가 불편하다고요');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 4, 1001, '불편을 끼쳐 죄송합니다');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 2, 1001, '이젠 답변도 복붙이네');

INSERT INTO TB_CHAT(CHAT_NO, CHAT_WRITER, CHAT_PROJECT_NO, CHAT_CONTENT) 
VALUES(SEQ_CHAT_NO.NEXTVAL, 4, 1001, '원하시는 답변을 드리지 못해 죄송합니다');
--------------------------------------------------
----------------- REPORT 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_REPORT (
    REPORT_NO NUMBER CONSTRAINT REPORT_NO_PK PRIMARY KEY,
    REPORT_CATEGORY_NO NUMBER CONSTRAINT REPORT_CATEGORY_NO_NN NOT NULL,
    REPORT_WRITER NUMBER CONSTRAINT REPORT_WRITER_NN NOT NULL,
    REPORT_REF_NO NUMBER CONSTRAINT REPORT_REF_NO_NN NOT NULL,
    REPORT_TITLE VARCHAR2(100) CONSTRAINT REPORT_TITLE_NN NOT NULL,
    REPORT_CONTENT VARCHAR2(4000) CONSTRAINT REPORT_CONTENT_NN NOT NULL,
    REPORT_CREATE_DATE DATE CONSTRAINT REPORT_CREATE_DATE_NN NOT NULL,
    REPORT_MODIFY_DATE DATE,
    REPORT_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT REPORT_STATUS CHECK(REPORT_STATUS IN('Y', 'N')),
    CONSTRAINT REPORT_CATEGORY_NO_FK FOREIGN KEY (REPORT_CATEGORY_NO) REFERENCES TB_RP_CATEGORY(RP_CATEGORY_NO),
    CONSTRAINT REPORT_WRITER_FK FOREIGN KEY (REPORT_WRITER) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT REPORT_REF_NO_FK FOREIGN KEY (REPORT_REF_NO) REFERENCES TB_CHAT(CHAT_NO)
);

COMMENT ON COLUMN TB_REPORT.REPORT_NO IS '신고 번호';
COMMENT ON COLUMN TB_REPORT.REPORT_CATEGORY_NO IS '신고 카테고리 번호';
COMMENT ON COLUMN TB_REPORT.REPORT_WRITER IS '신고 작성자회원번호';
COMMENT ON COLUMN TB_REPORT.REPORT_REF_NO IS '신고 참조하는 게시글 번호';
COMMENT ON COLUMN TB_REPORT.REPORT_TITLE IS '신고 제목';
COMMENT ON COLUMN TB_REPORT.REPORT_CONTENT IS '신고 내용';
COMMENT ON COLUMN TB_REPORT.REPORT_CREATE_DATE IS '신고 작성일';
COMMENT ON COLUMN TB_REPORT.REPORT_MODIFY_DATE IS '신고 수정일';
COMMENT ON COLUMN TB_REPORT.REPORT_STATUS IS '신고 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_REPORT_NO
NOCACHE;

INSERT INTO TB_REPORT(REPORT_NO, REPORT_CATEGORY_NO, REPORT_WRITER, REPORT_REF_NO, REPORT_TITLE, REPORT_CONTENT, REPORT_CREATE_DATE)
VALUES(SEQ_REPORT_NO.NEXTVAL, 7, 4, (SELECT CHAT_NO FROM TB_CHAT WHERE CHAT_CONTENT = '답변이 기계적이네'), '말투가 불편하네요', '너무 무례해요', SYSDATE);

INSERT INTO TB_REPORT(REPORT_NO, REPORT_CATEGORY_NO, REPORT_WRITER, REPORT_REF_NO, REPORT_TITLE, REPORT_CONTENT, REPORT_CREATE_DATE)
VALUES(SEQ_REPORT_NO.NEXTVAL, 7, 4, (SELECT CHAT_NO FROM TB_CHAT WHERE CHAT_CONTENT = '그런 말투가 불편하다고요'), '말투가 불편하네요', '본인 말투가 불편한 걸 모르는 듯', SYSDATE);

INSERT INTO TB_REPORT(REPORT_NO, REPORT_CATEGORY_NO, REPORT_WRITER, REPORT_REF_NO, REPORT_TITLE, REPORT_CONTENT, REPORT_CREATE_DATE)
VALUES(SEQ_REPORT_NO.NEXTVAL, 7, 4, (SELECT CHAT_NO FROM TB_CHAT WHERE CHAT_CONTENT = '이젠 답변도 복붙이네'), '말투가 불편하네요', '대놓고 시비걸어요~ 이사람~', SYSDATE);

INSERT INTO TB_REPORT(REPORT_NO, REPORT_CATEGORY_NO, REPORT_WRITER, REPORT_REF_NO, REPORT_TITLE, REPORT_CONTENT, REPORT_CREATE_DATE)
VALUES(SEQ_REPORT_NO.NEXTVAL, 7, 3, (SELECT CHAT_NO FROM TB_CHAT WHERE CHAT_CONTENT = '그런 말투가 불편하다고요'), '악플 신고합니다', '제재 부탁드려요', SYSDATE);

INSERT INTO TB_REPORT(REPORT_NO, REPORT_CATEGORY_NO, REPORT_WRITER, REPORT_REF_NO, REPORT_TITLE, REPORT_CONTENT, REPORT_CREATE_DATE)
VALUES(SEQ_REPORT_NO.NEXTVAL, 7, 3, (SELECT CHAT_NO FROM TB_CHAT WHERE CHAT_CONTENT = '이젠 답변도 복붙이네'), '신고합니다', '이 분 제재좀 해주세요', SYSDATE);
--------------------------------------------------
------------------ LIKES 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_LIKES (
    LIKES_USER_NO NUMBER, 
    LIKES_PROJECT_NO NUMBER, 
    LIKES_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT LIKES_CREATE_DATE_NN NOT NULL,
    LIKES_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT LIKES_STATUS_CK CHECK(LIKES_STATUS IN('Y', 'N')),
    CONSTRAINT LIKES_PK PRIMARY KEY (LIKES_USER_NO, LIKES_PROJECT_NO),
    CONSTRAINT LIKES_USER_NO_FK FOREIGN KEY (LIKES_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT LIKES_PROJECT_NO_FK FOREIGN KEY (LIKES_PROJECT_NO) REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_LIKES.LIKES_USER_NO IS '찜 회원번호';
COMMENT ON COLUMN TB_LIKES.LIKES_PROJECT_NO IS '찜 프로젝트번호';
COMMENT ON COLUMN TB_LIKES.LIKES_CREATE_DATE IS '찜 등록일';
COMMENT ON COLUMN TB_LIKES.LIKES_STATUS IS '찜 상태값 (Y : 찜 / N : 찜 해제)';

CREATE SEQUENCE SEQ_LIKES_NO
NOCACHE;

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(2, 1000, '2024-02-26', 'Y');

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(2, 1001, '2024-02-26', 'Y');

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(4, 1000, '2024-02-27', 'Y');

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(3, 1001, '2024-02-27', 'Y');

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(2, 1003, '2024-02-28', 'Y');

INSERT INTO TB_LIKES(LIKES_USER_NO, LIKES_PROJECT_NO, LIKES_CREATE_DATE, LIKES_STATUS) 
VALUES(2, 1002, '2024-03-01', 'Y');
--------------------------------------------------
------------------ FILE 관련 ----------------------	
--------------------------------------------------
CREATE TABLE TB_FILE (
    FILE_NO NUMBER CONSTRAINT FILE_NO_PK PRIMARY KEY,
    FILE_USER_NO NUMBER,
    FILE_CHAT_NO NUMBER,
    FILE_QNA_NO NUMBER,
    FILE_REPORT_NO NUMBER,
    FILE_NOTICE_NO NUMBER,
    FILE_PROJECT_NO NUMBER,
    FILE_ORIGIN_NAME VARCHAR2(255) CONSTRAINT FILE_ORIGIN_NAME_NN NOT NULL,
    FILE_UPDATE_NAME VARCHAR2(255) CONSTRAINT FILE_UPDATE_NAME_NN NOT NULL,
    FILE_PATH VARCHAR2(1000),
    FILE_UPLOAD_DATE DATE CONSTRAINT FILE_UPLOAD_DATE_NN NOT NULL,
    FILE_LEVEL NUMBER CONSTRAINT FILE_LEVEL_NN NOT NULL,
    FILE_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT FILE_STATUS_CK CHECK(FILE_STATUS IN('Y', 'N')),
    CONSTRAINT FILE_USER_NO_FK FOREIGN KEY (FILE_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT FILE_CHAT_NO_FK FOREIGN KEY (FILE_CHAT_NO) REFERENCES TB_CHAT(CHAT_NO),
    CONSTRAINT FILE_QNA_NO_FK FOREIGN KEY (FILE_QNA_NO) REFERENCES TB_QNA (QNA_NO),
    CONSTRAINT FILE_REPORT_NO_FK FOREIGN KEY (FILE_REPORT_NO) REFERENCES TB_REPORT (REPORT_NO),
    CONSTRAINT FILE_NOTICE_NO_FK FOREIGN KEY (FILE_NOTICE_NO) REFERENCES TB_NOTICE (NOTICE_NO),
    CONSTRAINT FILE_PROJECT_NO_FK FOREIGN KEY (FILE_PROJECT_NO) REFERENCES TB_PROJECT (PROJECT_NO)
);

COMMENT ON COLUMN TB_FILE.FILE_NO IS '파일 번호';
COMMENT ON COLUMN TB_FILE.FILE_USER_NO IS '파일 참조게시글번호 (MEMBER)';
COMMENT ON COLUMN TB_FILE.FILE_CHAT_NO IS '파일 참조게시글번호 (CHAT)';
COMMENT ON COLUMN TB_FILE.FILE_QNA_NO IS '파일 참조게시글번호 (QNA)';
COMMENT ON COLUMN TB_FILE.FILE_REPORT_NO IS '파일 참조게시글번호 (REPORT)';
COMMENT ON COLUMN TB_FILE.FILE_NOTICE_NO IS '파일 참조게시글번호 (NOTICE)';
COMMENT ON COLUMN TB_FILE.FILE_PROJECT_NO IS '파일 참조게시글번호 (PROJECT)';
COMMENT ON COLUMN TB_FILE.FILE_ORIGIN_NAME IS '파일 원본파일명';
COMMENT ON COLUMN TB_FILE.FILE_UPDATE_NAME IS '파일 수정파일명';
COMMENT ON COLUMN TB_FILE.FILE_PATH IS '파일 저장폴더경로';
COMMENT ON COLUMN TB_FILE.FILE_UPLOAD_DATE IS '파일 업로드일';
COMMENT ON COLUMN TB_FILE.FILE_LEVEL IS '파일 레벨 (1 : 메인 / 2 : 서브)';
COMMENT ON COLUMN TB_FILE.FILE_STATUS IS '파일 상태값 (Y : 유효 / N : 비유효)';

CREATE SEQUENCE SEQ_FILE_NO
NOCACHE;
--------------------------------------------------
------------------ BUYER 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_BUYER (
    BUYER_USER_NO NUMBER CONSTRAINT BUYER_USER_NO_FK REFERENCES TB_MEMBER(USER_NO),
    BUYER_PROJECT_NO NUMBER CONSTRAINT BUYER_PROJECT_NO_FK REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_BUYER.BUYER_USER_NO IS '후원자 회원번호';
COMMENT ON COLUMN TB_BUYER.BUYER_PROJECT_NO IS '후원자 프로젝트번호';
--------------------------------------------------
------------------ SELLER 관련 --------------------	
--------------------------------------------------
CREATE TABLE TB_SELLER (
    SELLER_USER_NO NUMBER CONSTRAINT SELLER_USER_NO_FK REFERENCES TB_MEMBER(USER_NO),
    SELLER_PROJECT_NO NUMBER CONSTRAINT SELLER_PROJECT_NO_FK REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_SELLER.SELLER_USER_NO IS '창작자 회원번호';
COMMENT ON COLUMN TB_SELLER.SELLER_PROJECT_NO IS '창작자 프로젝트번호';
--------------------------------------------------
------------------ PAYMENT 관련 -------------------	
--------------------------------------------------
CREATE TABLE TB_PAYMENT (
    PAYMENT_NO NUMBER CONSTRAINT PAYMENT_NO_PK PRIMARY KEY,
    PAYMENT_USER_NO NUMBER CONSTRAINT PAYMENT_USER_NO_NN NOT NULL,
    PAYMENT_PROJECT_NO NUMBER CONSTRAINT PAYMENT_PROJECT_NO_NN NOT NULL,
    PAYMENT_AMOUNT NUMBER CONSTRAINT PAYMENT_AMOUNT_NN NOT NULL,
    PAYMENT_METHOD NUMBER CONSTRAINT PAYMENT_METHOD_CK CHECK(PAYMENT_METHOD IN(1, 2)),
    PAYMENT_STATUS VARCHAR2(1) CONSTRAINT PAYMENT_STATUS_CK CHECK(PAYMENT_STATUS IN('Y', 'N')),
    PAYMENT_DATE DATE CONSTRAINT PAYMENT_DATE_NN NOT NULL,
    CONSTRAINT PAYMENT_USER_NO_FK FOREIGN KEY (PAYMENT_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT PAYMENT_PROJECT_NO_FK FOREIGN KEY (PAYMENT_PROJECT_NO) REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_PAYMENT.PAYMENT_NO IS '결제 번호';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_USER_NO IS '결제 후원자회원번호';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_PROJECT_NO IS '결제 프로젝트번호';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_AMOUNT IS '결제 금액';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_METHOD IS '결제 수단 (1 : 계좌이체 / 2 : 네이버페이)';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_STATUS IS '결제 상태값 (Y : 결제 / 2 : 미결제)';
COMMENT ON COLUMN TB_PAYMENT.PAYMENT_DATE IS '결제 일자';

CREATE SEQUENCE SEQ_PAYMENT_NO
NOCACHE;
--------------------------------------------------
------------------- REPLY 관련 --------------------	
--------------------------------------------------
CREATE TABLE TB_REPLY (
    REPLY_NO NUMBER CONSTRAINT REPLY_NO_PK PRIMARY KEY,
    REPLY_CONTENT VARCHAR2(1000) CONSTRAINT REPLY_CONTENT_NN NOT NULL,
    REPLY_REF_NO NUMBER CONSTRAINT REPLY_REF_NO_NN NOT NULL,
    REPLY_WRITER NUMBER CONSTRAINT REPLY_WRITER_NO_NN NOT NULL,
    REPLY_CREATE_DATE DATE CONSTRAINT REPLY_CREATE_DATE_NN NOT NULL,
    REPLY_MODIFY_DATE DATE CONSTRAINT REPLY_MODIFY_DATE_NN NOT NULL,
    REPLY_STATUS VARCHAR2(1) CONSTRAINT REPLY_STATUS_NN NOT NULL CONSTRAINT REPLY_STATUS_CK CHECK (REPLY_STATUS IN ('Y', 'N')),
    CONSTRAINT REPLY_REF_NO_FK FOREIGN KEY (REPLY_REF_NO) REFERENCES TB_QNA(QNA_NO),
    CONSTRAINT REPLY_WRITER_FK FOREIGN KEY (REPLY_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN TB_REPLY.REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_REPLY.REPLY_REF_NO IS '댓글 참조게시글번호';
COMMENT ON COLUMN TB_REPLY.REPLY_WRITER IS '댓글 작성자회원번호';
COMMENT ON COLUMN TB_REPLY.REPLY_CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN TB_REPLY.REPLY_MODIFY_DATE IS '댓글 수정일';
COMMENT ON COLUMN TB_REPLY.REPLY_STATUS IS '댓글 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_REPLY_NO
NOCACHE;
--------------------------------------------------
-------------- FUNDING_OPTION 관련 ----------------	
--------------------------------------------------
CREATE TABLE TB_FUNDING_OPTION (
    OPTION_NO NUMBER CONSTRAINT OPTION_NO_PK PRIMARY KEY,
    OPTION_PROJECT_NO NUMBER CONSTRAINT OPTION_PROJECT_NO_NN NOT NULL,
    OPTION_AMOUNT NUMBER CONSTRAINT OPTION_AMOUNT_NN NOT NULL,
    OPTION_DESCRIPTION VARCHAR2(500),
    CONSTRAINT OPTION_PROJECT_NO_FK FOREIGN KEY (OPTION_PROJECT_NO) REFERENCES TB_PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN TB_FUNDING_OPTION.OPTION_NO IS '펀딩 옵션 번호';
COMMENT ON COLUMN TB_FUNDING_OPTION.OPTION_PROJECT_NO IS '펀딩 프로젝트 번호';
COMMENT ON COLUMN TB_FUNDING_OPTION.OPTION_AMOUNT IS '펀딩 옵션 금액';
COMMENT ON COLUMN TB_FUNDING_OPTION.OPTION_DESCRIPTION IS '펀딩 옵션 설명';

CREATE SEQUENCE SEQ_OPTION_NO
NOCACHE;
--------------------------------------------------
------------------ ORDER 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_ORDER (
    ORDER_NO NUMBER CONSTRAINT ORDER_NO_PK PRIMARY KEY,
    ORDER_USER_NO NUMBER CONSTRAINT ORDER_USER_NO_NN NOT NULL,
    ORDER_PROJECT_NO NUMBER CONSTRAINT ORDER_PROJECT_NO_NN NOT NULL,
    ORDER_OPTION_NO NUMBER CONSTRAINT ORDER_OPTION_NO_NN NOT NULL,
    ORDER_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT ORDER_STATUS_CK CHECK(ORDER_STATUS IN('Y', 'N', 'C')),
    ORDER_PAYMENT_NO NUMBER CONSTRAINT ORDER_PAYMENT_NO_NN NOT NULL,
    CONSTRAINT ORDER_USER_NO_FK FOREIGN KEY (ORDER_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT ORDER_PROJECT_NO_FK FOREIGN KEY (ORDER_PROJECT_NO) REFERENCES TB_PROJECT(PROJECT_NO),
    CONSTRAINT ORDER_OPTION_NO_FK FOREIGN KEY (ORDER_OPTION_NO) REFERENCES TB_FUNDING_OPTION(OPTION_NO),
    CONSTRAINT ORDER_PAYMENT_NO_FK FOREIGN KEY (ORDER_PAYMENT_NO) REFERENCES TB_PAYMENT(PAYMENT_NO)
);

COMMENT ON COLUMN TB_ORDER.ORDER_NO IS '주문 번호';
COMMENT ON COLUMN TB_ORDER.ORDER_USER_NO IS '주문자 회원 번호';
COMMENT ON COLUMN TB_ORDER.ORDER_PROJECT_NO IS '주문 프로젝트 번호';
COMMENT ON COLUMN TB_ORDER.ORDER_OPTION_NO IS '주문 후원 옵션 번호';
COMMENT ON COLUMN TB_ORDER.ORDER_STATUS IS '주문 상태값 (Y : 주문완료 / N : 주문대기 / C : 주문취소)';
COMMENT ON COLUMN TB_ORDER.ORDER_PAYMENT_NO IS '주문 결제 번호';

CREATE SEQUENCE SEQ_ORDER_NO
NOCACHE;
--------------------------------------------------
----------------- DELIVERY 관련 -------------------	
--------------------------------------------------
CREATE TABLE TB_DELIVERY (
    DELIVERY_NO NUMBER CONSTRAINT DELIVERY_NO_PK PRIMARY KEY,
    DELIVERY_ORDER_NO NUMBER CONSTRAINT DELIVERY_ORDER_NO_NN NOT NULL,
    DELIVERY_ADDRESS VARCHAR2(500) CONSTRAINT DELIVERY_ADDRESS_NN NOT NULL,
    DELIVERY_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT DELIVERY_STATUS_CK CHECK(DELIVERY_STATUS IN('Y', 'I', 'N')),
    DELIVERY_START DATE,
    DELIVERY_END DATE,
    CONSTRAINT DELIVERY_ORDER_NO_FK FOREIGN KEY (DELIVERY_ORDER_NO) REFERENCES TB_ORDER(ORDER_NO)
);

COMMENT ON COLUMN TB_DELIVERY.DELIVERY_NO IS '배송 번호';
COMMENT ON COLUMN TB_DELIVERY.DELIVERY_ORDER_NO IS '배송 주문 번호';
COMMENT ON COLUMN TB_DELIVERY.DELIVERY_ADDRESS IS '배송지 주소';
COMMENT ON COLUMN TB_DELIVERY.DELIVERY_STATUS IS '배송 상태값 (Y : 배송완료 / I : 배송중 / N : 배송대기)';
COMMENT ON COLUMN TB_DELIVERY.DELIVERY_START IS '배송 시작일';
COMMENT ON COLUMN TB_DELIVERY.DELIVERY_END IS '배송 도착일';

CREATE SEQUENCE SEQ_DELIVERY_NO
NOCACHE;





COMMIT;
