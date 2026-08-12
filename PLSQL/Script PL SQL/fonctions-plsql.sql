-- ############################################################################
/*
    Syntaxe générale : 
    CREATE OR REPLACE FUNCTION nom_fonction
    (
        paramètres
    )
    RETURN type_retour
    IS
    BEGIN
    
        ...
    
        RETURN valeur;
    
    END;
    /
*/

CREATE OR REPLACE FUNCTION prime
(
    p_salaire NUMBER
)
RETURN NUMBER
IS
BEGIN

    RETURN p_salaire * 0.10;

END;
/

-- Appel depuis une requête sql
select prime(salary) from employee;

-- appel depuis un bloc pl sql
DECLARE
    v_prime NUMBER;
BEGIN
    v_prime := prime(3000);
    dbms_output.put_line(v_prime);
END;
/
