-- =====================================================
-- Base de données RH
-- Script 04 - Création des clés étrangères
-- =====================================================

---------------------------------------------------------
-- COUNTRY
---------------------------------------------------------

ALTER TABLE country
ADD CONSTRAINT fk_country_region
FOREIGN KEY (region_id)
REFERENCES region (region_id);

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

ALTER TABLE location
ADD CONSTRAINT fk_location_country
FOREIGN KEY (country_id)
REFERENCES country (country_id);

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

ALTER TABLE department
ADD CONSTRAINT fk_department_location
FOREIGN KEY (location_id)
REFERENCES location (location_id);

---------------------------------------------------------
-- JOB
---------------------------------------------------------
-- Aucune clé étrangère.

---------------------------------------------------------
-- EMPLOYEE
---------------------------------------------------------

-- Département de l'employé
ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES department (department_id);

-- Poste occupé par l'employé
ALTER TABLE employee
ADD CONSTRAINT fk_employee_job
FOREIGN KEY (job_id)
REFERENCES job (job_id);

-- Responsable hiérarchique (auto-référence)
ALTER TABLE employee
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (manager_id)
REFERENCES employee (employee_id);

---------------------------------------------------------
-- LEAVE_REQUEST
---------------------------------------------------------

-- Employé concerné par la demande de congé
ALTER TABLE leave_request
ADD CONSTRAINT fk_leave_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id);

-- Type de congé
ALTER TABLE leave_request
ADD CONSTRAINT fk_leave_type
FOREIGN KEY (leave_type_id)
REFERENCES leave_type (leave_type_id);

---------------------------------------------------------
-- EMPLOYEE_TRAINING
---------------------------------------------------------

-- Employé ayant suivi la formation
ALTER TABLE employee_training
ADD CONSTRAINT fk_employee_training_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id);

-- Formation suivie
ALTER TABLE employee_training
ADD CONSTRAINT fk_employee_training_training
FOREIGN KEY (training_id)
REFERENCES training (training_id);

---------------------------------------------------------
-- REVIEW
---------------------------------------------------------

-- Entretien annuel d'un employé
ALTER TABLE review
ADD CONSTRAINT fk_review_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id);

---------------------------------------------------------
-- SALARY_HISTORY
---------------------------------------------------------

-- Historique des salaires d'un employé
ALTER TABLE salary_history
ADD CONSTRAINT fk_salary_history_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id);