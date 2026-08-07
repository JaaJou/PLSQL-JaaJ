-- =====================================================
-- Base de données RH
-- Script 05 - Création des contraintes
-- =====================================================

---------------------------------------------------------
-- REGION
---------------------------------------------------------

ALTER TABLE region
ADD CONSTRAINT uk_region_name
UNIQUE (region_name);

---------------------------------------------------------
-- COUNTRY
---------------------------------------------------------

ALTER TABLE country
ADD CONSTRAINT uk_country_name
UNIQUE (country_name);

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

ALTER TABLE location
ADD CONSTRAINT ck_location_city
CHECK (city IS NOT NULL);

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

ALTER TABLE department
ADD CONSTRAINT uk_department_name
UNIQUE (department_name);

---------------------------------------------------------
-- JOB
---------------------------------------------------------

ALTER TABLE job
ADD CONSTRAINT uk_job_title
UNIQUE (job_title);

ALTER TABLE job
ADD CONSTRAINT ck_job_salary
CHECK (
    min_salary >= 0
    AND max_salary >= min_salary
);

---------------------------------------------------------
-- EMPLOYEE
---------------------------------------------------------

ALTER TABLE employee
ADD CONSTRAINT uk_employee_email
UNIQUE (email);

ALTER TABLE employee
ADD CONSTRAINT ck_employee_salary
CHECK (salary >= 0);

ALTER TABLE employee
ADD CONSTRAINT ck_employee_commission
CHECK (
    commission_pct IS NULL
    OR commission_pct BETWEEN 0 AND 100
);

---------------------------------------------------------
-- LEAVE_TYPE
---------------------------------------------------------

ALTER TABLE leave_type
ADD CONSTRAINT uk_leave_type_name
UNIQUE (leave_name);

---------------------------------------------------------
-- LEAVE_REQUEST
---------------------------------------------------------

ALTER TABLE leave_request
ADD CONSTRAINT ck_leave_dates
CHECK (end_date >= start_date);

---------------------------------------------------------
-- TRAINING
---------------------------------------------------------

ALTER TABLE training
ADD CONSTRAINT uk_training_name
UNIQUE (training_name);

ALTER TABLE training
ADD CONSTRAINT ck_training_duration
CHECK (duration_days > 0);

---------------------------------------------------------
-- EMPLOYEE_TRAINING
---------------------------------------------------------

ALTER TABLE employee_training
ADD CONSTRAINT ck_training_score
CHECK (
    score IS NULL
    OR score BETWEEN 0 AND 20
);

---------------------------------------------------------
-- REVIEW
---------------------------------------------------------

ALTER TABLE review
ADD CONSTRAINT ck_review_score
CHECK (
    score IS NULL
    OR score BETWEEN 0 AND 5
);

---------------------------------------------------------
-- SALARY_HISTORY
---------------------------------------------------------

ALTER TABLE salary_history
ADD CONSTRAINT ck_salary_history_values
CHECK (
    old_salary >= 0
    AND new_salary >= 0
);

ALTER TABLE salary_history
ADD CONSTRAINT ck_salary_history_change
CHECK (old_salary <> new_salary);