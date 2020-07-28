DROP TABLE CATEGORY;
DROP TABLE CATEGORY CASCADE CONSTRAINTS;

CREATE TABLE CATEGORY(
CATEGORY_NO NUMBER PRIMARY KEY,
RECIPE_MATERIAL_ONE VARCHAR2(50) NOT NULL,
RECIPE_CATEGORY_DIVISION VARCHAR2(50) NOT NULL,
RECIPE_NAME VARCHAR2(50) NOT NULL,
CONSTRAINT CATEGORY_CK CHECK(RECIPE_CATEGORY_DIVISION IN ('MAIN','SUB'))
);