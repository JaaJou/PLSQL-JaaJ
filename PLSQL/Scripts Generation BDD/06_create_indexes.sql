-- =====================================================
-- Base de données RH
-- Script 06 - Création des index
-- =====================================================

---------------------------------------------------------
-- COUNTRY
---------------------------------------------------------

-- Recherche des pays par région
CREATE INDEX idx_country_region
ON country (region_id);

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

-- Recherche des sites par pays
CREATE INDEX idx_location_country
ON location (country_id);

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

-- Recherche des départements par site
CREATE INDEX idx_department_location
ON department (location_id);

---------------------------------------------------------
-- EMPLOYEE
---------------------------------------------------------

-- Recherche des employés par département
CREATE INDEX idx_employee_department
ON employee (department_id);

-- Recherche des employés par poste
CREATE INDEX idx_employee_job
ON employee (job_id);

-- Recherche des collaborateurs d'un manager
CREATE INDEX idx_employee_manager
ON employee (manager_id);

-- Recherche rapide par nom
CREATE INDEX idx_employee_last_name
ON employee (last_name);

-- Recherche rapide par prénom
CREATE INDEX idx_employee_first_name
ON employee (first_name);

-- Recherche des employés par date d'embauche
CREATE INDEX idx_employee_hire_date
ON employee (hire_date);

---------------------------------------------------------
-- LEAVE_REQUEST
---------------------------------------------------------

-- Recherche des congés d'un employé
CREATE INDEX idx_leave_employee
ON leave_request (employee_id);

-- Recherche par type de congé
CREATE INDEX idx_leave_type
ON leave_request (leave_type_id);

-- Recherche par date de début
CREATE INDEX idx_leave_start_date
ON leave_request (start_date);

---------------------------------------------------------
-- EMPLOYEE_TRAINING
---------------------------------------------------------

-- Recherche des formations d'un employé
CREATE INDEX idx_employee_training_employee
ON employee_training (employee_id);

-- Recherche des participants à une formation
CREATE INDEX idx_employee_training_training
ON employee_training (training_id);

---------------------------------------------------------
-- REVIEW
---------------------------------------------------------

-- Recherche des entretiens d'un employé
CREATE INDEX idx_review_employee
ON review (employee_id);

-- Recherche par date d'entretien
CREATE INDEX idx_review_date
ON review (review_date);

---------------------------------------------------------
-- SALARY_HISTORY
---------------------------------------------------------

-- Recherche de l'historique d'un employé
CREATE INDEX idx_salary_history_employee
ON salary_history (employee_id);

-- Recherche par date de modification
CREATE INDEX idx_salary_history_date
ON salary_history (change_date);