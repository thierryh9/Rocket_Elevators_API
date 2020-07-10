# Rocket_Elevators_Information_System
Database creation :

![alt text](https://github.com/alex07L/Rocket_Elevators_Information_System/blob/Ange/Capture.PNG)

Category: 
  it has many quote
* category id
* name has the same name in Type
* contains three distinct product lines: Standard, Premium or Excelium caraterized by the price
* the prices fees

Type :
  it has many quote
* type id
* bulding type : Residential, Commercial, Corporate and Hybrid caracterized by name

Quote :
    belongs to both above
* quote id
* contains all the parts of the bulding

User :
* user get an email, password and token

Employee :
* it belongs to user and have fristname, lastname and his title

START SERVER

* cd Rocket_Elevators_Information_System
* rake db:create
* rails s
