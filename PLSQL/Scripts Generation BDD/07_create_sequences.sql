-- =====================================================
-- Base de données RH
-- Script 07 - Création des séquences
-- =====================================================
--
-- Bien que les clés primaires utilisent des colonnes IDENTITY,
-- ce script crée des séquences afin d'illustrer leur utilisation
-- dans les prochains chapitres du cours PL/SQL.
--
-- Elles seront utilisées lors des exercices sur :
--   - NEXTVAL
--   - CURRVAL
--   - procédures
--   - triggers
-- =====================================================

---------------------------------------------------------
-- REGION
---------------------------------------------------------

CREATE SEQUENCE seq_region
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

CREATE SEQUENCE seq_location
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

CREATE SEQUENCE seq_department
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- JOB
---------------------------------------------------------

CREATE SEQUENCE seq_job
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- EMPLOYEE
---------------------------------------------------------

CREATE SEQUENCE seq_employee
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- LEAVE_TYPE
---------------------------------------------------------

CREATE SEQUENCE seq_leave_type
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- LEAVE_REQUEST
---------------------------------------------------------

CREATE SEQUENCE seq_leave_request
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- TRAINING
---------------------------------------------------------

CREATE SEQUENCE seq_training
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- REVIEW
---------------------------------------------------------

CREATE SEQUENCE seq_review
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- SALARY_HISTORY
---------------------------------------------------------

CREATE SEQUENCE seq_salary_history
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;