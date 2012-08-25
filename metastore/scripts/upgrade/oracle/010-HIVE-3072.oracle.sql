CREATE TABLE SKEWED_STRING_LIST
(
    SD_ID NUMBER NOT NULL
);

ALTER TABLE SKEWED_STRING_LIST ADD CONSTRAINT SKEWED_STRING_LIST_PK PRIMARY KEY (SD_ID);

CREATE TABLE SKEWED_STRING_LIST_VALUES
(
    STRING_LIST_ID NUMBER NOT NULL,
    "STRING_LIST_VALUE" VARCHAR2(256) NULL,
    INTEGER_IDX NUMBER(10) NOT NULL
);

ALTER TABLE SKEWED_STRING_LIST_VALUES ADD CONSTRAINT SKEWED_STRING_LIST_VALUES_PK PRIMARY KEY (STRING_LIST_ID,INTEGER_IDX);

ALTER TABLE SKEWED_STRING_LIST_VALUES ADD CONSTRAINT SKEWED_STRING_LIST_VALUES_FK1 FOREIGN KEY (STRING_LIST_ID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) INITIALLY DEFERRED ;

CREATE TABLE SKEWED_COL_NAMES
(
    SD_ID NUMBER NOT NULL,
    "SKEWED_COL_NAME" VARCHAR2(256) NULL,
    INTEGER_IDX NUMBER(10) NOT NULL
);

ALTER TABLE SKEWED_COL_NAMES ADD CONSTRAINT SKEWED_COL_NAMES_PK PRIMARY KEY (SD_ID,INTEGER_IDX);

ALTER TABLE SKEWED_COL_NAMES ADD CONSTRAINT SKEWED_COL_NAMES_FK1 FOREIGN KEY (SD_ID) REFERENCES SDS (SD_ID) INITIALLY DEFERRED ;

CREATE TABLE SKEWED_COL_VALUE_LOCATION_MAPPING
(
    SD_ID NUMBER NOT NULL,
    STRING_LIST_ID_KID NUMBER NOT NULL,
    "LOCATION" VARCHAR2(4000) NULL
);

ALTER TABLE SKEWED_COL_VALUE_LOCATION_MAPPING ADD CONSTRAINT SKEWED_COL_VALUE_LOCATION_MAPPING_PK PRIMARY KEY (SD_ID,STRING_LIST_ID_KID);

ALTER TABLE SKEWED_COL_VALUE_LOCATION_MAPPING ADD CONSTRAINT SKEWED_COL_VALUE_LOCATION_MAPPING_FK1 FOREIGN KEY (STRING_LIST_ID_KID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) INITIALLY DEFERRED ;

ALTER TABLE SKEWED_COL_VALUE_LOCATION_MAPPING ADD CONSTRAINT SKEWED_COL_VALUE_LOCATION_MAPPING_FK2 FOREIGN KEY (SD_ID) REFERENCES SDS (SD_ID) INITIALLY DEFERRED ;

CREATE TABLE SKEWED_VALUES
(
    SD_ID_OID NUMBER NOT NULL,
    STRING_LIST_ID_EID NUMBER NOT NULL,
    INTEGER_IDX NUMBER(10) NOT NULL
);

ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_PK PRIMARY KEY (SD_ID_OID,INTEGER_IDX);

ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_FK1 FOREIGN KEY (STRING_LIST_ID_EID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) INITIALLY DEFERRED ;

ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_FK2 FOREIGN KEY (SD_ID_OID) REFERENCES SDS (SD_ID) INITIALLY DEFERRED ;