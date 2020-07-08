# README

Rocket_Elevators_Information_System

CodeBoxx Odyssey project, week 4

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

![alt text](https://github.com/alex07L/Rocket_Elevators_Information_System/blob/Ange/Capture.PNG)

 - Category: 
    it has many quote
    _category id
    _name has the same name in Type
    _contains three distinct product lines: Standard, Premium or Excelium caraterized by the price
    _the prices fees
 - Type :
    it has many quote
    _type id
    _bulding type : Residential, Commercial, Corporate and Hybrid caracterized by name
 - Quote :
    belongs to both above
    _quote id
    _ contains all the parts of the bulding
 - User :
    _ user get an email, password and token
 - Employee :
    _it belongs to user and have fristname, lastname and his title

START SERVER

cd Rocket_Elevators_Information_System
rake db:create
rails s

