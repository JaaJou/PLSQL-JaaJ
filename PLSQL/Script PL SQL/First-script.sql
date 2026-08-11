-- ############################################################################
SELECT *
FROM employee e
WHERE e.last_name like 'A%'
ORDER BY e.employee_id;

SELECT e.last_name AS nom
FROM employee e
WHERE e.last_name like 'D%'
ORDER BY e.employee_id;

SELECT DISTINCT e.last_name AS nom
FROM employee e
WHERE e.last_name like 'D%';

-- ############################################################################

-- =====================================================
-- Exercice : Afficher les employés appartenant à certains
-- départements et dont le salaire est compris entre
-- 40 000 € et 50 000 €.
--
-- Cette requête illustre plusieurs notions importantes :
-- - les jointures (INNER JOIN) ;
-- - les alias de tables ;
-- - le calcul d'une colonne dérivée ;
-- - l'opérateur BETWEEN ;
-- - l'opérateur IN.
-- =====================================================

SELECT  e.employee_id, 
        e.first_name, 
        e.salary, 
        e.salary / 12 AS "Salaire brut mensuel", 
        d.department_name
FROM employee e
INNER JOIN department d 
ON e.department_id = d.department_id
WHERE 
    (e.salary BETWEEN 40000 AND 50000) 
    AND e.department_id IN ('1','4');

-- ############################################################################

SELECT  e.employee_id, 
        e.first_name, 
        e.salary, 
        e.salary / 12 AS "Salaire brut mensuel", 
        d.department_name
FROM employee e
LEFT JOIN department d 
ON e.department_id = d.department_id
WHERE (e.salary BETWEEN 40000 AND 50000);

-- ############################################################################

SELECT *
FROM employee 
WHERE salary > 
(
    SELECT AVG(salary)
    FROM employee
);

-- ############################################################################

WITH "Salaire moyen" AS
(
    SELECT e.department_id, AVG(salary) as avg_salary
    FROM employee e
    GROUP BY e.department_id
)
SELECT * 
FROM "Salaire moyen";

-- ############################################################################

Select e.first_name, e.last_name, d.department_name
FROM employee e
JOIN department d ON e.department_id = d.department_id;

Select d.department_name, e.first_name, e.last_name
FROM department d
LEFT JOIN employee e ON e.department_id = d.department_id;

-- ############################################################################

SELECT e.first_name, e.last_name, e.salary, d.department_name FROM employee e
LEFT JOIN department d ON d.department_id = e.department_id
WHERE e.salary >
(
    SELECT AVG(salary) FROM employee e
);

-- ############################################################################

-- =====================================================
-- Exercice : Afficher les employés dont le salaire est
-- supérieur à la moyenne de leur département.
--
-- Cette version utilise une CTE (Common Table Expression),
-- définie grâce au mot-clé WITH.
--
-- L'objectif est de calculer une seule fois le salaire
-- moyen de chaque département, puis de réutiliser ce
-- résultat dans la requête principale.
--
-- Cette approche améliore la lisibilité de la requête et
-- évite de répéter le même calcul plusieurs fois.
-- =====================================================

-- Création d'une CTE contenant le salaire moyen de
-- chaque département.
WITH salaire_moyen_par_departement AS (
    SELECT d.department_id AS id_departement, 
    d.department_name as nom_departement, 
    AVG(e.salary) AS salaire_moyen
    FROM employee e
    INNER JOIN department d ON d.department_id = e.department_id
    GROUP BY d.department_id, d.department_name
    ORDER BY d.department_id
)
-- Requête principale
SELECT e.first_name, e.last_name, e.salary, d.department_name 
FROM employee e
INNER JOIN department d ON d.department_id = e.department_id
-- On conserve uniquement les employés dont le salaire
-- est supérieur à la moyenne calculée pour leur
-- département.
WHERE e.salary > ( 
    SELECT salaire_moyen
    FROM salaire_moyen_par_departement
    where id_departement = d.department_id
    );

-- ############################################################################

SELECT e.first_name, e.last_name, e.salary, d.department_name 
FROM employee e
INNER JOIN department d ON d.department_id = e.department_id
WHERE e.salary > ( 
    SELECT AVG(salary) 
    FROM employee emp
    WHERE emp.department_id = e.department_id
    );

-- ############################################################################

-- =====================================================
-- Exercice : Afficher les employés dont le salaire est
-- supérieur à la moyenne de leur département.
--
-- Cette requête illustre l'utilisation de deux
-- sous-requêtes corrélées.
--
-- La première sous-requête (dans le SELECT) calcule
-- le salaire moyen du département afin de l'afficher
-- dans le résultat.
--
-- La seconde sous-requête (dans le WHERE) calcule
-- également la moyenne du département, mais cette fois
-- pour filtrer les employés.
--
-- Le terme "corrélée" signifie que la sous-requête
-- utilise une colonne de la requête principale
-- (ici : e.department_id).
--
-- Oracle exécute donc cette sous-requête pour chaque
-- employé traité par la requête principale.
-- =====================================================
SELECT e.first_name, e.last_name, e.salary, d.department_name,
(
    -- Sous-requête corrélée.
    -- Calcule le salaire moyen du département de
    -- l'employé courant.
    SELECT AVG(salary)
    FROM employee
    WHERE department_id = e.department_id
) AS Salaire_Moyen_Departement
FROM employee e
-- Jointure permettant de récupérer le nom du département
INNER JOIN department d 
ON d.department_id = e.department_id
-- On conserve uniquement les employés dont le salaire
-- est supérieur à la moyenne de leur département.
WHERE e.salary > ( 
    SELECT AVG(salary) 
    FROM employee emp
    WHERE emp.department_id = e.department_id
    );  

-- ############################################################################

SELECT first_name 
FROM employee
UNION
SELECT department_name
FROM department;

-- ############################################################################

SELECT first_name 
FROM employee
UNION ALL
SELECT department_name
FROM department;

-- ############################################################################

SELECT department_id
FROM employee
INTERSECT
SELECT department_id
FROM department;

-- ############################################################################

SELECT first_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) numero
FROM employee;

-- ############################################################################

SELECT first_name,
       salary,
       LAG(salary) OVER(ORDER BY salary) salaire_précédent
FROM employee;

-- ############################################################################

SELECT d.department_id, d.department_name, ROUND(AVG(e.salary)) as "SALAIRE_MOYEN"
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id, SALAIRE_MOYEN DESC;


SELECT e.first_name, e.last_name, e.salary, d.department_name, (SELECT ROUND(AVG(empp.salary)) FROM employee empp WHERE e.department_id = empp.department_id) as Salir_Moy
FROM employee e
INNER JOIN department d
ON d.department_id = e.department_id
WHERE e.salary > 
(
    SELECT AVG(emp.salary)
    FROM employee emp
    WHERE emp.department_id = e.department_id
) AND e.salary > 75000
ORDER BY d.department_name;

-- ##########################################################################

/*
    Exercice : analyse des salaires par département
    Écris une requête qui affiche, pour chaque département :
       - le nom du département ;
       - le nombre d'employés ;
       - le salaire moyen ;
       - le salaire maximum ;
       - le salaire minimum.
    Le résultat doit être trié par salaire moyen décroissant.
*/

SELECT 
    d.department_name AS "NOM DEPARTEMENT", 
    COUNT(e.employee_id) AS "NOMBRE EMPLOYÉS",
    ROUND(AVG(e.salary)) AS "SALAIRE MOYEN",
    MAX(e.salary) AS "SALAIRE MAX",
    MIN(e.salary) AS "SALAIRE MIN"
FROM department d
INNER JOIN employee e 
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING ROUND(AVG(e.salary)) > 
    (
        SELECT ROUND(AVG(salary))
        FROM employee
    )
ORDER BY "SALAIRE MOYEN" DESC;

-- ============================================================
-- Exercice : trouver les départements dont le salaire moyen
-- est supérieur au salaire moyen global de l'entreprise.
--
-- La requête calcule plusieurs statistiques pour chaque
-- département, puis ne conserve que les départements dont
-- le salaire moyen dépasse la moyenne de tous les employés.
--
-- Point important :
-- WHERE et HAVING n'ont pas le même rôle.
--
-- WHERE  -> filtre les lignes AVANT le GROUP BY
-- HAVING -> filtre les groupes APRÈS le GROUP BY
--
-- Comme nous voulons comparer une agrégation (AVG) par
-- département avec une autre agrégation (AVG globale),
-- nous devons utiliser HAVING.
-- ============================================================
SELECT  d.department_name,
        ROUND(AVG(e.salary)) AS Salaire_moyen,
        MAX(e.salary) AS Salaire_Max,
        MIN(e.salary) AS Salaire_min,
        COUNT(e.employee_id) AS Num_employee
FROM department d
INNER JOIN employee e
ON d.department_id = e.department_id
-- Création d'un groupe pour chaque département.
-- Toutes les fonctions d'agrégation du SELECT seront donc
-- calculées séparément pour chaque département.
GROUP BY d.department_id, d.department_name
-- HAVING intervient APRÈS le GROUP BY.
--
-- À ce stade, Oracle dispose déjà du salaire moyen de
-- chaque département.
--
-- On compare donc :
--
--     AVG(e.salary)
--         >
--     moyenne globale de tous les employés
--
-- La sous-requête retourne une seule valeur :
-- la moyenne de salaire de l'ensemble de la table EMPLOYEE.
HAVING AVG(e.salary) > 
    (
        SELECT AVG(salary) 
        FROM employee
    )
-- Tri des départements conservés du salaire moyen
-- le plus élevé au plus faible.
--
-- Contrairement au WHERE/HAVING, ORDER BY intervient
-- après le SELECT : l'alias Salaire_moyen peut donc
-- être utilisé ici.
ORDER BY Salaire_moyen DESC;


