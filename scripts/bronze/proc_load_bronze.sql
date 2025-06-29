/* Stored Preocedure: Load Bronze layer (Source-> Bronze)

Script purpose:

This stroed procedure loads data into the 'Bronze' schema from external csv files. 
It performs the following actions:
   Truncates the bronze tables before loading data.
   Uses the 'BULK INSERT' command the load from csv files to bronze tables.

   Parameter: NONE
   This stored procedure does not accept any paramters or return any values.

   Ex: call  LOAD_BRONZE() */


CREATE OR REPLACE TABLE bronze_load_log (
    step_name STRING,
    status_msg STRING,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);






CREATE OR REPLACE PROCEDURE LOAD_BRONZE()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN

    -- Logging start
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('START', 'Truncating tables...');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.erp_loc_az12';
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.erp_loc_az12');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.erp_loc_a101';
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.erp_loc_a101');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.erp_px_cat_glv2';
     INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.erp_px_cat_glv2');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.crm_cust_info';
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.crm_cust_info');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.crm_prod_info';
     INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.crm_prod_info');

    EXECUTE IMMEDIATE 'TRUNCATE TABLE BRONZE.crm_sales_details';
     INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('TRUNCATE', 'Truncated BRONZE.crm_sales_details');

    -- Load each file
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.erp_loc_az12');
    COPY INTO BRONZE.erp_loc_az12
    FROM @my_stage/CUST_AZ12.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.erp_loc_az12');

    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.erp_loc_a101');
    COPY INTO BRONZE.erp_loc_a101
    FROM @my_stage/LOC_A101.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.erp_loc_a101');

    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.erp_px_cat_glv2');
    COPY INTO BRONZE.erp_px_cat_glv2
    FROM @my_stage/PX_CAT_G1V2.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.erp_px_cat_glv2');

    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.crm_cust_info');
    COPY INTO BRONZE.crm_cust_info
    FROM @my_stage/cust_info.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.crm_cust_info');

    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.crm_prod_info');
    COPY INTO BRONZE.crm_prod_info
    FROM @my_stage/prd_info.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.crm_prod_info');

    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loading BRONZE.crm_sales_details');
    COPY INTO BRONZE.crm_sales_details
    FROM @my_stage/sales_details.csv.gz
    FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
    INSERT INTO bronze_load_log(step_name, status_msg) VALUES ('LOAD', 'Loaded BRONZE.crm_sales_details');

    RETURN 'All steps completed successfully. Check log table for progress.';

END;
$$;
