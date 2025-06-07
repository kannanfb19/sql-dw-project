/*
================================================================================================
Create Database and Schema
================================================================================================
Script purpose:

    This script creates a new dattabase name 'Datawarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Addtionally, the script sets up three schemas 
    within the database: 'bronze','silver','gold.'

Warning:
    Running this script will drop the entire 'Datawarehouse' database if it it exists.
    All data in the database will be permantntly deleted. Proceed with caution
    and ensure you haove proper backups before running scripts.
*/




CREATE DATABASE Datawarehouse;

USE  Datawarehouse;



CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

