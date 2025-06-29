
/*-- DDL SCRIPTS: CREATE BRONZE TABLES
-- SCRIPT PURPOSE: This script creates tables in the 'bronze' schema, dropping exsiting tables if they already exist. Run this script to re-define the DDL structure of 'bronze' tables*/




USE DW;

CREATE OR REPLACE TABLE BRONZE.crm_cust_info (

cust_id INT,
cst_key VARCHAR(50),
cst_firstname VARCHAR(50),
cst_lastname VARCHAR(50),
cst_material_status VARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE

);


CREATE OR REPLACE TABLE BRONZE.crm_prod_info (

prd_id INT,
prd_key VARCHAR(50),
prd_nm VARCHAR(50),
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);


CREATE OR REPLACE TABLE BRONZE.crm_sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


CREATE OR REPLACE TABLE BRONZE.erp_loc_a101 (

cid VARCHAR(50),
cntry VARCHAR(50)

);


CREATE OR REPLACE TABLE BRONZE.erp_loc_az12 (

cid VARCHAR(50),
bdate DATE,
gen VARCHAR(50)

);


CREATE OR REPLACE TABLE BRONZE.erp_px_cat_glv2 (

id VARCHAR(50),
cat VARCHAR(50),
subcat VARCHAR(50),
maintenance VARCHAR(50)
);
