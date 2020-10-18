DROP TABLE GOODSRE CASCADE CONSTRAINT;
DROP SEQUENCE GOODSRE_SEQ;
DROP SEQUENCE GOODSRE_NSEQ;


CREATE SEQUENCE GOODSRE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 9999 
NOCYCLE
NOCACHE

CREATE SEQUENCE GOODSRE_NSEQ
INCREMENT BY 1
START WITH 1
MINVALUE 0 
MAXVALUE 9999 
NOCYCLE
NOCACHE

CREATE TABLE GOODSRE(
	GOODS_RE_NO NUMBER PRIMARY KEY,
	GOODS_NO NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(50) NOT NULL,
	GOODS_RE_CONTENT VARCHAR2(1000) NOT NULL,
	GOODS_RE_REGDATE DATE DEFAULT(SYSDATE)NOT NULL,
	GOODS_RE_GROUPNO NUMBER NOT NULL,
	GOODS_RE_SEQ NUMBER DEFAULT 1 NOT NULL ,
	GOODS_RE_TITLETAB NUMBER NOT NULL,
	CONSTRAINT GOODSRE_FK_GOODS_NO FOREIGN KEY(GOODS_NO) REFERENCES GOODS(GOODS_NO)
	ON DELETE CASCADE,
	CONSTRAINT GOODSRE_RK_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
	ON DELETE CASCADE
);


S_NO, MEMBER_ID, GOODS_RE_CONTENT, GOODS_RE_REGDATE, GOODS_RE_GROUPNO,
  GOODS_RE_SEQ, GOODS_RE_TITLETAB , MEMBER_NICK
  FROM GOODSRE JOIN MEMBER USING(MEMBER_ID);
  
    SELECT GOODS_RE_NO, GOODS_NO, MEMBER_ID, GOODS_RE_CONTENT, GOODS_RE_REGDATE, GOODS_RE_GROUPNO,
  GOODS_RE_SEQ, GOODS_RE_TITLETAB
  FROM GOODSRE ORDER BY GOODS_RE_GROUPNO DESC ,GOODS_RE_SEQ DESC 

INSERT INTO GOODSRE
VALUES(GOODSRE@_SEQ.NEXTVAL, 13, 'ID','TEST내용',SYSDATE,GOODSRE_NSEQ.NEXTVAL,1,0);

SELECT GOODS_RE_SEQ+1, FROM GOODSRE WHERE GOODS_RE_NO =7

SELECT * FROM GOODSRE;


DELETE  FROM GOODSRE;
