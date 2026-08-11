-- #############################################################################
/*
    Creation d'une procedure
*/

CREATE OR REPLACE PROCEDURE hello_world
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/

-- Executer la procedure stockée
BEGIN
    hello_world;
END;
/

-- #############################################################################
/*
    Creation d'une procedure avec paramètres
*/

CREATE OR REPLACE PROCEDURE afficher_truc
(
    p_nom VARCHAR2
)
IS
BEGIN
    dbms_output.put_line(p_nom);
END;
/

BEGIN
    afficher_truc('truc');
END;
/

-- #############################################################################
/*
    Creation d'une procedure de calcul avec paramètres
    - en entrée IN (uniquement en lecture, ne peut pas être modifié) par défaut
    - en sortie OUT
*/

CREATE OR REPLACE PROCEDURE calcul_tva
(
    p_prix_ht IN NUMBER,
    p_prix_ttc OUT NUMBER
)
IS
BEGIN
    p_prix_ttc := p_prix_ht * 1.20;
END;
/

-- Utilisation : 
DECLARE
    v_prix_ttc NUMBER;
BEGIN
    calcul_tva(
        26.5,
        v_prix_ttc
        );
    dbms_output.put_line(v_prix_ttc);
END;
/

-- #############################################################################
/*
    Paremètre IN OUT pour prendre une valeur en entrée, la modifier et la renvoyer
*/
CREATE OR REPLACE PROCEDURE proced_increment
(
    p_num IN OUT NUMBER
)
IS
BEGIN
    p_num := p_num +1;
END;
/

-- Utilisation
DECLARE
    v_num NUMBER := 16;
BEGIN
    proced_increment(v_num);
    dbms_output.put_line(v_num);
END;
/

-- #############################################################################
/*
    EXEMPLE REALISTE de traitement par procédure
    RAPPEL : 
    - Procedure adapté aux trzaitement, et peut de rien retourner
    - Fonctiopn adapté aux calculs et doit retourner une valeur
*/

CREATE OR REPLACE PROCEDURE augmenter_salaire
(
    p_id      IN employee.employee_id%TYPE,
    p_montant IN employee.salary%TYPE
)
IS
BEGIN

    UPDATE employee

    SET salary = salary + p_montant

    WHERE employee_id = p_id;

END;
/

BEGIN

    augmenter_salaire(
        2,
        500
    );

END;
/

SELECT salary 
FROM employee
WHERE employee_id = 2;