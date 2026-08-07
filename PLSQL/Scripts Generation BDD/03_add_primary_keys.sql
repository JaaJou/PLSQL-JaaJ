-- =====================================================
-- Base de données RH
-- Script 03 - Création des clés primaires
-- =====================================================

---------------------------------------------------------
-- REGION
---------------------------------------------------------

ALTER TABLE region
ADD CONSTRAINT pk_region
PRIMARY KEY (region_id);

---------------------------------------------------------
-- COUNTRY
---------------------------------------------------------

ALTER TABLE country
ADD CONSTRAINT pk_country
PRIMARY KEY (country_id);

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

ALTER TABLE location
ADD CONSTRAINT pk_location
PRIMARY KEY (location_id);

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

ALTER TABLE department
ADD CONSTRAINT pk_department
PRIMARY KEY (department_id);

---------------------------------------------------------
-- JOB
---------------------------------------------------------

ALTER TABLE job
ADD CONSTRAINT pk_job
PRIMARY KEY (job_id);

---------------------------------------------------------
-- EMPLOYEE
---------------------------------------------------------

ALTER TABLE employee
ADD CONSTRAINT pk_employee
PRIMARY KEY (employee_id);

---------------------------------------------------------
-- LEAVE_TYPE
---------------------------------------------------------

ALTER TABLE leave_type
ADD CONSTRAINT pk_leave_type
PRIMARY KEY (leave_type_id);

---------------------------------------------------------
-- LEAVE_REQUEST
---------------------------------------------------------

ALTER TABLE leave_request
ADD CONSTRAINT pk_leave_request
PRIMARY KEY (leave_id);

---------------------------------------------------------
-- TRAINING
---------------------------------------------------------

ALTER TABLE training
ADD CONSTRAINT pk_training
PRIMARY KEY (training_id);

---------------------------------------------------------
-- EMPLOYEE_TRAINING
-- Clé primaire composée :
-- Un employé ne peut suivre une même formation
-- qu'une seule fois à une date donnée.
---------------------------------------------------------

ALTER TABLE employee_training
ADD CONSTRAINT pk_employee_training
PRIMARY KEY (
    employee_id,
    training_id,
    training_date
);

---------------------------------------------------------
-- REVIEW
---------------------------------------------------------

ALTER TABLE review
ADD CONSTRAINT pk_review
PRIMARY KEY (review_id);

---------------------------------------------------------
-- SALARY_HISTORY
---------------------------------------------------------

ALTER TABLE salary_history
ADD CONSTRAINT pk_salary_history
PRIMARY KEY (history_id);