-- ############################################################################
-- ############################################################################
-- ############################################################################

BEGIN
    DBMS_OUTPUT.PUT_LINE('Bonjour PL/SQL');
END;
/

-- ############################################################################

DECLARE
    v_nom VARCHAR2(50);
BEGIN
    v_nom := 'Jean';
    DBMS_OUTPUT.PUT_LINE('Bonjour, ' || v_nom ||'.');
END;
/

-- ############################################################################

DECLARE
    v_nom_nullable VARCHAR2(50);
BEGIN
    IF v_nom_nullable IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('v_nom est null');
    END IF;
END;
/

-- ############################################################################

DECLARE
    v_date DATE;
BEGIN
    v_date := SYSDATE;
    DBMS_OUTPUT.put_line(v_date);
END;
/

-- ############################################################################

DECLARE 
    v_nom employee.first_name%TYPE;
BEGIN
    v_nom := 'jean';
    dbms_output.put_line(INITCAP(v_nom));
END;
/

--##########################################################################

DECLARE
    v_row employee%ROWTYPE;
BEGIN
    SELECT * 
    INTO v_row
    FROM employee
    WHERE employee_id=1;
    
    dbms_output.PUT_LINE(v_row.first_name);
END;
/

--##########################################################################

DECLARE
    v_booltest BOOLEAN := true;
    v_truc NUMBER(10,2) := 10.23;
BEGIN
    dbms_output.put_line('result : ' || NVL2(v_truc,'pasnull','null'));
END;
/

--##########################################################################

DECLARE
    v_salaire employee.salary%TYPE;
BEGIN
    SELECT salary
    INTO v_salaire
    FROM employee
    WHERE employee_id = 5;
    
    IF v_salaire> 50000 AND v_salaire < 60000 THEN
        dbms_output.put_line('son salaire est elevé mais pas trop');
    ELSIF v_salaire > 60000 AND v_salaire < 100000 THEN
        dbms_output.put_line('mouais');
    ELSE
        dbms_output.put_line('il est soit très gros, soit petit');
        dbms_output.put_line('Pour vérifier :'|| v_salaire);
    END IF;
END;
/

--##########################################################################
DECLARE
    v_compteur NUMBER(3) := 1;
BEGIN
    dbms_output.put_line('Start Compteur : ' || v_compteur);
    LOOP
        v_compteur := v_compteur +1;
        dbms_output.put_line('Compteur : ' || v_compteur);
        IF v_compteur >= 10 THEN
            dbms_output.put_line('end !');    
        END IF;
        EXIT WHEN v_compteur >=10;
    END LOOP;
END;
/

--##########################################################################
/*
    Passe à la boucle suivante si la condition est respectée (true)
    En l'occurence, si i est divisible par 2, alors la boucle passe a l'iteration suivante
*/
BEGIN
    FOR i IN 1..20 LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        dbms_output.put_line(i);
    END LOOP;
END;
/

--##########################################################################

BEGIN
    FOR i IN REVERSE 1..20 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/

--##########################################################################

DECLARE
    v_result_firstName employee.first_name%TYPE;
BEGIN
    SELECT DISTINCT first_name
    INTO v_result_firstName
    FROM employee;
    
    dbms_output.put_line(v_result_firstName);
END;
/

--##########################################################################

DECLARE
    v_result_firstName employee.first_name%TYPE;
    
    CURSOR c_firstname IS
        SELECT DISTINCT first_name
        FROM employee;
    
BEGIN
    OPEN c_firstname;
    
    LOOP 
        FETCH c_firstname
        INTO v_result_firstName;
        
        EXIT WHEN c_firstname%NOTFOUND;
        dbms_output.put_line(v_result_firstName);
    END LOOP;
    
    CLOSE c_firstname;
END;
/


--#########################################################################

BEGIN
    FOR firstname IN
    (   
        SELECT DISTINCT first_name
        FROM employee
    )
    LOOP
        dbms_output.put_line(firstname.first_name);
    END LOOP;
END;
/

--#########################################################################

DECLARE
    CURSOR c_firstnames IS
        SELECT DISTINCT first_name
        FROM employee;
BEGIN
    FOR fn IN c_firstnames 
    LOOP
        dbms_output.put_line(fn.first_name);
    END LOOP;

END;
/

--#########################################################################


DECLARE
    CURSOR c_fn(dpt_id NUMBER) IS
        SELECT e.first_name AS fn, e.last_name AS ln, d.department_name AS dn
        FROM employee e
        INNER JOIN department d ON d.department_id = e.department_id
        WHERE e.department_id = dpt_id;
BEGIN
    FOR i IN  1..5 LOOP
    
        FOR fn IN c_fn(i)
        LOOP
            dbms_output.put_line(fn.fn || ' ' || UPPER(fn.ln) || ' ' || fn.dn );
        END LOOP;
        dbms_output.put_line('##############');
    
    END LOOP;
END;
/

