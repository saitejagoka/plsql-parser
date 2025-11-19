-- Sample PL/SQL Code for Testing

-- A procedure to calculate total sales
CREATE OR REPLACE PROCEDURE calculate_total_sales IS
    total_sales NUMBER := 0;
BEGIN
    FOR rec IN (SELECT amount FROM sales) LOOP
        total_sales := total_sales + rec.amount;
    END LOOP;

    IF total_sales > 10000 THEN
        DBMS_OUTPUT.PUT_LINE('High sales!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Normal sales.');
    END IF;
END calculate_total_sales;
/

-- A function to compute discount
CREATE OR REPLACE FUNCTION compute_discount(p_amount NUMBER) RETURN NUMBER IS
    discount NUMBER := 0;
BEGIN
    IF p_amount > 500 THEN
        discount := p_amount * 0.1;
    ELSE
        discount := p_amount * 0.05;
    END IF;

    RETURN discount;
END compute_discount;
/

-- Nested DECLARE block example
DECLARE
    v_total NUMBER := 0;
BEGIN
    v_total := 100;

    IF v_total > 50 THEN
        FOR i IN 1..5 LOOP
            v_total := v_total + i;
        END LOOP;
    END IF;
END;
/
