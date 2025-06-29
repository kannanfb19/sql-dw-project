USE DW.SILVER;

CREATE OR REPLACE TABLE SILVER.crm_cust_info (

cust_id INT,
cst_key VARCHAR(50),
cst_firstname VARCHAR(50),
cst_lastname VARCHAR(50),
cst_material_status VARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE,
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP


);


CREATE OR REPLACE TABLE SILVER.crm_prod_info (

prd_id INT,
prd_key VARCHAR(50),
CAT_ID VARCHAR(50),

prd_nm VARCHAR(50),
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE,
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_DATE

);

--DESC TABLE SILVER.crm_sales_details
CREATE OR REPLACE TABLE SILVER.crm_sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT,
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_DATE

);


CREATE OR REPLACE TABLE SILVER.erp_loc_a101 (

cid VARCHAR(50),
cntry VARCHAR(50),
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP


);


CREATE OR REPLACE TABLE SILVER.erp_loc_az12 (

cid VARCHAR(50),
bdate DATE,
gen VARCHAR(50),
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP


);


CREATE OR REPLACE TABLE SILVER.erp_px_cat_glv2 (

id VARCHAR(50),
cat VARCHAR(50),
subcat VARCHAR(50),
maintenance VARCHAR(50),
dwh_create_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP

);







