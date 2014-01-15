
--
-- ACCOUNT
--
  CREATE TABLE "ACCOUNT" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,
	"TRUENAME" NVARCHAR2(50) NOT NULL ENABLE,
	"ACCESSTOKEN" VARCHAR2(128) NOT NULL ENABLE,
	"CREATE_TIME" DATE NOT NULL ENABLE,
	"DEPARTMENT" VARCHAR2(128)
   ) PCTFREE 10 INITRANS 1 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 );
--
-- CONFIG
--
  CREATE TABLE "CONFIG" 
   (	"KEY" VARCHAR2(128) NOT NULL ENABLE,
	"VALUE" BLOB
   ) PCTFREE 10 INITRANS 1 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 );
--
-- INFODATA
--
  CREATE TABLE "INFODATA" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,
	"INFO_ID" CHAR(36) NOT NULL ENABLE,
	"INFO_TYPE" NUMBER(10,0) NOT NULL ENABLE,
	"DATA" BLOB,
	"DELETED" NUMBER(1,0) NOT NULL ENABLE,
	"CREATE_TIME" DATE NOT NULL ENABLE,
	"UPDATE_TIME" DATE NOT NULL ENABLE
   ) PCTFREE 10 INITRANS 1 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 );
--
-- PROJECT
--
  CREATE TABLE "PROJECT" 
   (	"ID" VARCHAR2(36 CHAR) NOT NULL ENABLE,
	"DELETED" NUMBER(1,0) DEFAULT 0  NOT NULL ENABLE,
	"CREATE_TIME" DATE NOT NULL ENABLE,
	"UPDATE_TIME" DATE NOT NULL ENABLE,
	"PROJECT_NO" VARCHAR2(128 CHAR),
	"PROJECT_NAME" VARCHAR2(256 CHAR),
	"SHOU_LI_HAO" VARCHAR2(128 CHAR),
	"SHEN_QING_DAN_WEI" VARCHAR2(256 CHAR),
	"CITY" VARCHAR2(20 CHAR),
	"COUNTY" VARCHAR2(20),
	"AREACODE" VARCHAR2(20 CHAR),
	"BUSINESS_TYPE" NUMBER(1,0) NOT NULL ENABLE,
	"FLOW_STEP" NUMBER(10,0) NOT NULL ENABLE,
	"STATUS" NUMBER(10,0) DEFAULT 0  NOT NULL ENABLE
   ) PCTFREE 10 INITRANS 1 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 );
--
-- IX_INFODATA_INFOID_TYPE
--
  CREATE INDEX "IX_INFODATA_INFOID_TYPE" ON "INFODATA" ("INFO_ID")
  PCTFREE 10 INITRANS 2 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 
  );
--
-- PK_ACCOUNT_ID
--
ALTER TABLE "ACCOUNT" ADD CONSTRAINT "PK_ACCOUNT_ID" PRIMARY KEY ("ID") ENABLE;

--
-- PK_CONFIG_KEY
--
ALTER TABLE "CONFIG" ADD CONSTRAINT "PK_CONFIG_KEY" PRIMARY KEY ("KEY") ENABLE;

--
-- PK_INFODATA_ID
--
ALTER TABLE "INFODATA" ADD CONSTRAINT "PK_INFODATA_ID" PRIMARY KEY ("ID") ENABLE;

--
-- INFODATA_TRIGGER1
--
  CREATE OR REPLACE TRIGGER "INFODATA_TRIGGER1"
  BEFORE INSERT ON "INFODATA"
  REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
  DECLARE
BEGIN
 select SEQ_INFODATA_ID.nextval
 into :new.id
 from sys.dual;

END;

/
