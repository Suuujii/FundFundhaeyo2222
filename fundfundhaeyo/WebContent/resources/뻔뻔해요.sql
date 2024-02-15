---------------------- ���� ----------------------
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_UNO;

---------------------- ���� ----------------------

--------------------------------------------------
----------------- MEMBER ���� ---------------------	
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
  PROFILE VARCHAR2(4000) DEFAULT '�ȳ��ϼ���',
  GRADE NUMBER DEFAULT 1,
  MARKETING VARCHAR2(1) DEFAULT 'N' CHECK (MARKETING IN('Y', 'N')),
  ENROLL_DATE DATE DEFAULT SYSDATE,
  MODIFY_DATE DATE DEFAULT SYSDATE,
  USER_TYPE VARCHAR2(1) DEFAULT 'U' CHECK (USER_TYPE IN('U', 'S')),
  USER_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (USER_STATUS IN('Y', 'A', 'B', 'N')),
  CONSTRAINT UID_UQ UNIQUE (USER_ID)
);

COMMENT ON COLUMN MEMBER.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.USER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.USER_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.USER_SSN IS '�ֹε�Ϲ�ȣ';
COMMENT ON COLUMN MEMBER.NICKNAME IS '�г���';
COMMENT ON COLUMN MEMBER.PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MEMBER.PROFILE IS '�Ұ���';
COMMENT ON COLUMN MEMBER.GRADE IS 'ȸ����� (�Ϲ�1/���2)';
COMMENT ON COLUMN MEMBER.MARKETING IS '�����õ��ǿ��� (����Y/�̵���N)';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS 'ȸ��������';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '����������';
COMMENT ON COLUMN MEMBER.USER_TYPE IS 'ȸ������(�Ϲ�U/�Ҽ�S)';
COMMENT ON COLUMN MEMBER.USER_STATUS IS 'ȸ������(�����Y/Ż��N/������A/������ƮB)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '������', '950814-1234567', '������', '010-1234-5678', 'admin@kh.or.kr', '����� ������ ���ﵿ', '�������Դϴ�', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'A');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user01', 'pass01', '�ں���', '900212-232141', '��', '010-1111-1111', 'user01@kh.or.kr', '����� ������ õȣ��', '�ں����̿���', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user02', 'pass02', '����', '010101-2213456', '��', '010-2222-2222', 'user02@kh.or.kr', '����� ��õ�� ��', '�����', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user03', 'pass03', '������', '940215-2224131', '�Ľ�Ÿ', '010-3333-3333', 'user03@kh.or.kr', '����� ������', '���� �Ľ�Ÿ �԰� �;��', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user04', 'pass04', '�ϴ�', '010101-2141231', '������', '010-4444-4444', 'user04@kh.or.kr', '����� ���ϱ�', '������ ���Ժ��̿�', 1, 'N', SYSDATE, SYSDATE, DEFAULT, 'Y');



--------------------------------------------------
----------------- MEMBER ���� ---------------------	
--------------------------------------------------






COMMIT;
