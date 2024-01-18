DROP DATABASE IF EXISTS MLR1;

CREATE DATABASE IF NOT EXISTS MLR1;
USE BDDJO;
-- -----------------------------------------------------------------------------
--       TABLE : PAYS
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PAYS
 (
   PAY_ID INT NOT NULL AUTO_INCREMENT,
   PAY_NOM VARCHAR(255) NOT NULL, 
   PRIMARY KEY (PAY_ID) 
 );


-- -----------------------------------------------------------------------------
--       TABLE : EDITION
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EDITION
 (
   ED_ID INT NOT NULL  AUTO_INCREMENT,
   PAY_ID INT NOT NULL  ,
   ED_ANNEE VARCHAR(255) NOT NULL  ,
   ED_NOM VARCHAR(255) NOT NULL  
   , PRIMARY KEY (ED_ID) 
 ) ;


-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EDITION
-- -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EDITION_PAYS
     ON EDITION (PAY_ID ASC);

-- -----------------------------------------------------------------------------
--       TABLE : ATHLETE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ATHLETE
 (
   PAY_ID INT NOT NULL  AUTO_INCREMENT,
   AT_NOM VARCHAR(255) NOT NULL  ,
   AT_ID INT NOT NULL  ,
   AT_PRENOM VARCHAR(255) NOT NULL  ,
   AT_NAISS DATE NOT NULL  
   , PRIMARY KEY (AT_ID) 
 ) ;


-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ATHLETE
-- -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ATHLETE_PAYS
     ON ATHLETE (PAY_ID ASC);

-- -----------------------------------------------------------------------------
--       TABLE : SPORT
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SPORT
 (
   SPOR_ID INT NOT NULL  AUTO_INCREMENT,
   SPOR_NOM VARCHAR(255) NOT NULL  
   , PRIMARY KEY (SPOR_ID) 
 ) ;


-- -----------------------------------------------------------------------------
--       TABLE : EPREUVE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EPREUVE
 (
   EP_ID INT NOT NULL  AUTO_INCREMENT,
   SPOR_ID INT NOT NULL  ,
   EP_NOM VARCHAR(255) NOT NULL  ,
   EP_CAT VARCHAR(255) NOT NULL  
   , PRIMARY KEY (EP_ID) 
 ) ;


-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EPREUVE
-- -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EPREUVE_SPORT
     ON EPREUVE (SPOR_ID ASC);

-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPER
 (
   AT_ID INT NOT NULL  ,
   EP_ID INT NOT NULL  ,
   ED_ID INT NOT NULL  ,
   RESULTAT INT,
    PRIMARY KEY (AT_ID,EP_ID,ED_ID) 
 ) ;

ALTER TABLE `athlete` ADD `at_image` VARCHAR(512) NOT NULL AFTER `AT_NAISS`;
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PARTICIPER
-- -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PARTICIPER_ATHLETE
     ON PARTICIPER (AT_ID ASC);

CREATE  INDEX I_FK_PARTICIPER_EPREUVE
     ON PARTICIPER (EP_ID ASC);

CREATE  INDEX I_FK_PARTICIPER_EDITION
     ON PARTICIPER (ED_ID ASC);

-- -----------------------------------------------------------------------------
--       TABLE : REL_1
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_1
 (
   ED_ID INT NOT NULL  ,
   AT_ID INT NOT NULL,  PRIMARY KEY (ED_ID,AT_ID) 
 ) ;


-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REL_1
-- -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_1_EDITION
     ON REL_1 (ED_ID ASC);

CREATE  INDEX I_FK_REL_1_ATHLETE
     ON REL_1 (AT_ID ASC);

ALTER TABLE PAY AUTO_INCREMENT=1001;
-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE EDITION 
  ADD FOREIGN KEY FK_EDITION_PAYS (PAY_ID)
      REFERENCES PAYS (PAY_ID) ;


ALTER TABLE ATHLETE 
  ADD FOREIGN KEY FK_ATHLETE_PAYS (PAY_ID)
      REFERENCES PAYS (PAY_ID) ;


ALTER TABLE EPREUVE 
  ADD FOREIGN KEY FK_EPREUVE_SPORT (SPOR_ID)
      REFERENCES SPORT (SPOR_ID) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_ATHLETE (AT_ID)
      REFERENCES ATHLETE (AT_ID) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_EPREUVE (EP_ID)
      REFERENCES EPREUVE (EP_ID) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_EDITION (ED_ID)
      REFERENCES EDITION (ED_ID) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_EDITION (ED_ID)
      REFERENCES EDITION (ED_ID) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_ATHLETE (AT_ID)
      REFERENCES ATHLETE (AT_ID) ;

