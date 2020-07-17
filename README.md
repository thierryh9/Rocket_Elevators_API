# README

WEEK 5 : MYSQL & POSTGRESQL DATABASES

Ruby On Rails project for RocketElevators.
Make the interactive website with the original static website of genesis 2 weeks and link it to a database to store "User" and "Employee" login data and the quote data in separate tables.
The website have a backoffice that employee can login to access the data from quote.

DEPENDENCIES 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Rails version 5.2.4.3

Database creation :

![alt text](https://github.com/alex07L/Rocket_Elevators_Information_System/blob/Ange/mysql-db-model.PNG)


Expansion of the relational database model. Creation of a decision database (DataWarehouse) with PostgreSQL and was also linked to our Rails app to stock the data harvested through MySQL from the website or the dashboard.
Restitution and visualization of the data used for answering the three questions.

1. How many contact requests are made per month?

2. How many bid solicitations are made per month?

3. How many elevators per customer do we have?


![alt text](https://github.com/alex07L/Rocket_Elevators_Information_System/blob/Ange/postgresql-db-model.PNG)

START SERVER

* cd Rocket_Elevators_Information_System
* rake db:create
* rails s
