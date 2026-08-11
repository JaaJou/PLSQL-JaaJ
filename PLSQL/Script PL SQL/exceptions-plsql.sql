-- ############################################################################
/*
    EXCEPTION : NO_DATA_FOUND
*/
DECLARE
    v_nom employee.last_name%TYPE;
BEGIN

    SELECT last_name
    INTO v_nom
    FROM employee
    WHERE employee_id = 9999999;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Employé introuvable');
END;
/


-- ############################################################################
/*
    EXCEPTION : TOO_MANY_ROWS
*/

DECLARE
    v_nom employee.last_name%TYPE;
BEGIN
    SELECT last_name
    INTO v_nom
    FROM employee;
    dbms_output.put_line('nom : ' || v_nom);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Trop dligne');
    WHEN OTHERS THEN
        dbms_output.put_line('Erreur inconnue');
END;
/

-- ############################################################################
/*
    EXCEPTION CUSTOM
*/

DECLARE
    e_age_invalide EXCEPTION;
    v_age NUMBER := 15;
BEGIN
    IF v_age < 18 THEN
        RAISE e_age_invalide;
    END IF;
EXCEPTION
    WHEN e_age_invalide THEN
        dbms_output.put_line('Age invalide, mon ptit !');
END;
/


-- ############################################################################
/*
    RAISE APPLICATION ERROR
    Doit être comprit encore -20001 et -20999
*/

DECLARE
    e_age_invalide EXCEPTION;
    v_age NUMBER := 15;
BEGIN
    IF v_age < 18 THEN
        RAISE e_age_invalide;
    END IF;
EXCEPTION
    WHEN e_age_invalide THEN 
        dbms_output.put_line('Age invalide, mon ptit !');
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salaire invalide'
        );
END;
/

