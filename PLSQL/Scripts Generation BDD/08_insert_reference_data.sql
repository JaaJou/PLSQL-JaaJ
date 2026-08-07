-- =====================================================
-- Base de données RH
-- Script 08 - Insertion des données de référence
-- =====================================================
--
-- Ce script insère les données de référence utilisées
-- dans l'ensemble des exercices de la formation.
-- =====================================================

---------------------------------------------------------
-- REGION
---------------------------------------------------------

INSERT INTO region (region_name) VALUES ('Europe');
INSERT INTO region (region_name) VALUES ('Amérique');
INSERT INTO region (region_name) VALUES ('Asie');
INSERT INTO region (region_name) VALUES ('Afrique');

---------------------------------------------------------
-- COUNTRY
---------------------------------------------------------

INSERT INTO country (country_id, country_name, region_id)
VALUES ('FR', 'France', 1);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('BE', 'Belgique', 1);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('DE', 'Allemagne', 1);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('ES', 'Espagne', 1);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('IT', 'Italie', 1);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('US', 'États-Unis', 2);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('CA', 'Canada', 2);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('BR', 'Brésil', 2);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('JP', 'Japon', 3);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('CN', 'Chine', 3);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('IN', 'Inde', 3);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('AU', 'Australie', 3);

INSERT INTO country (country_id, country_name, region_id)
VALUES ('ZA', 'Afrique du Sud', 4);

---------------------------------------------------------
-- LOCATION
---------------------------------------------------------

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('10 Rue de Rivoli', '75001', 'Paris', 'Île-de-France', 'FR');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('25 Rue Garibaldi', '69006', 'Lyon', 'Auvergne-Rhône-Alpes', 'FR');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('Grand Place', '1000', 'Bruxelles', NULL, 'BE');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('Alexanderplatz', '10178', 'Berlin', NULL, 'DE');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('Gran Via', '28013', 'Madrid', NULL, 'ES');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('Via Roma', '00100', 'Rome', NULL, 'IT');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('5th Avenue', '10001', 'New York', 'New York', 'US');

INSERT INTO location (street, postal_code, city, state_name, country_id)
VALUES ('Bay Street', 'M5J', 'Toronto', 'Ontario', 'CA');

---------------------------------------------------------
-- DEPARTMENT
---------------------------------------------------------

INSERT INTO department (department_name, location_id)
VALUES ('Direction', 1);

INSERT INTO department (department_name, location_id)
VALUES ('Ressources Humaines', 1);

INSERT INTO department (department_name, location_id)
VALUES ('Informatique', 2);

INSERT INTO department (department_name, location_id)
VALUES ('Finance', 2);

INSERT INTO department (department_name, location_id)
VALUES ('Support', 3);

INSERT INTO department (department_name, location_id)
VALUES ('Commercial', 4);

INSERT INTO department (department_name, location_id)
VALUES ('Marketing', 5);

INSERT INTO department (department_name, location_id)
VALUES ('Recherche & Développement', 6);

---------------------------------------------------------
-- JOB
---------------------------------------------------------

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Directeur Général', 90000, 150000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Responsable RH', 45000, 70000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Développeur Junior', 30000, 42000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Développeur Confirmé', 42000, 60000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Développeur Senior', 60000, 80000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Chef de Projet', 55000, 85000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Technicien Support', 28000, 45000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Comptable', 35000, 55000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Commercial', 30000, 70000);

INSERT INTO job (job_title, min_salary, max_salary)
VALUES ('Administrateur Système', 45000, 70000);

---------------------------------------------------------
-- LEAVE_TYPE
---------------------------------------------------------

INSERT INTO leave_type (leave_name)
VALUES ('Congés payés');

INSERT INTO leave_type (leave_name)
VALUES ('RTT');

INSERT INTO leave_type (leave_name)
VALUES ('Maladie');

INSERT INTO leave_type (leave_name)
VALUES ('Congé maternité');

INSERT INTO leave_type (leave_name)
VALUES ('Congé paternité');

INSERT INTO leave_type (leave_name)
VALUES ('Sans solde');

---------------------------------------------------------
-- TRAINING
---------------------------------------------------------

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Oracle SQL', 'Oracle University', 5);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('PL/SQL Avancé', 'Oracle University', 5);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Java', 'OpenClassrooms', 4);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Spring Boot', 'OpenClassrooms', 3);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Git', 'GitHub', 2);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Linux', 'Linux Foundation', 4);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Cybersécurité', 'ANSSI', 3);

INSERT INTO training (training_name, provider, duration_days)
VALUES ('Management', 'Cegos', 2);

---------------------------------------------------------
-- Validation
---------------------------------------------------------

COMMIT;