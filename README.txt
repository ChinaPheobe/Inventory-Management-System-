XAMPP
===================================
This portable application is used to host the following application used in the completion of the this project.
- Mysql
- Apache Server
- php

Our Inventory Web Application
===============
EIMS_webapp folder -> This folder container the framework used to build all our web applications.
See list of files in the folde and what they do
 - index page.php     -> This is used to launch our main page
 - connections.php    -> This is where we setup our connections
 - inventorypage.php  -> This where we implemented out ten business questions
 - Loginpage.php      -> This page only user authenticated user to login into our web Application

  NOTE -> To use the view our webpage user must ensure the database query below is loaded before trting to open this webpage on the web brower
          Put the EIMS_webapp into the htdocs folder 

Mysql Queries
=============
EIMS_db_creation.sql   -> This is master SQL script used for the following operations;
  - This is used for the creation of the database and tables nd records inserted
  - it also containes sql code that we used for the creation of view to answer the ten business questions    
  NOTE -> To use the script user can either exceute the from the command line mysql> Source homedir/EIMS_db_creation.sql
          Alternatively user can upload directly from the import section of xampp

Trigger_and_stored_procedure.sql
===============================
   - This scripts contains the 3 stored procedure implemented  and the three Triggers implemented as well.
     NOTE -> To use the script user have to individually execute the stored procedure and the trigger from the command line or directly from the 
            mypgpadmin web user interface. We observer running this as a full script will only exceute last procedure on the list.

EIMS -Technical report.
======================
 This contains comprehensive deatils about our project 
 -  Table of Contents
 -  Abstract
 -  Introduction
 -  Overview of the System
 -  ER Diagrams
 -  Implementation 
 -  Queries and Execution
-   Conclusion