-- ############################################################################
/*
    Le Package SPECIFICATION
*/

CREATE OR REPLACE PACKAGE pkg_employee
IS

    PROCEDURE create_employee;

    PROCEDURE delete_employee;

    FUNCTION employee_count
        RETURN NUMBER;

END pkg_employee;
/

/*
    Le Package BODY
*/
CREATE OR REPLACE PACKAGE BODY pkg_employee
IS

    PROCEDURE create_employee
    IS
    BEGIN
        dbms_output.put_line('create');
    END;

    PROCEDURE delete_employee
    IS
    BEGIN
       dbms_output.put_line('delete');
    END;

    FUNCTION employee_count
        RETURN NUMBER
    IS
    BEGIN

        RETURN 15;

    END;

END pkg_employee;
/


-- UTILISATION : 
-- pkg_employee.create_employee;
-- pkg_employee.employee_count();


