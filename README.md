# README

WEEK 7 : ROCKET ELEVATORS API'S

Implementation different API into our website for Rocket Elevators

TEAM MEMBERS

* Thierry Harvey

* Alexandre Lévesque

* John Freud

API IMPLEMENTED

* Google Maps API

* Twilio API

* Slack API

* Dropbox API

* Sendgrid API

* IBM Watson API

* Zendesk API

BONUSES

* Weather API

* Star Wars API

* Recaptcha API

* Rapid API

WEBSITE URL: rocket3levators.com

Google Maps API

In the admin panel, you will be able to see all the customers on a single map. 
When you press on a dropped pin on the map you will be able to see the details of those buildings

Twilio

In order to receive a message from Twilio, you will have to update the status of the elevator to "intervention".
To do this you need to access the elevator panel in the admin page. You then edit the elevator's staus. 
This will send a text message to the technician.

Zendesk

To receive a message from Zendesk, you will have to send a Contact Us request via our Homepage, or to request a quote via the "get a quote" page.
Theses tickets will be sent to the Sales representative via email and in the zendesk dashboard.

IBM Watson

The IBM Watson works by gathering the text data, converting it to an audio file wich can be played in the admin panel pressing the "play" button.
Every time the user is changed, the audio will be updated to say the user's name. 
If the database is changed, the audio will also be updated.

Slack

In order to receive a slack notification in the channel "#elevator_operations", you will have to change the status of an elevator on
the elevator panel in the admin page. Once you edited the status, this will send a message via slack.

SendGrid

Everytime a Contact Us request via the Homepage is submitted, the user will receive a greeting email in his mailbox.
Just make sure that the email is valid, otherwise nothing will be sent.

Dropbox

This API will be triggered if a customer is created, all the leads connected to it will be transfered to his file.

BONUSES*

Weather API

When you get on the admin panel, you can click on any dropped pin to see the current temperature. 
ALSO, we added the weather forecast for every building. you can access this in the building panel in the admin section.
just click on the little sun on the right side of the building line.

Recaptcha API

Everytime you have to Submit a contact form, to log in, to create a user or to submit a quote form, 
you have to confirm that you are not a bot to be able to continue.

RapidAPI

RapidAPI is a nudity recognition filter for image. every time someone try to send nudity to the Rocket Elevator staff,
it will not send and the user will be sent a legal procedure to advise him that our legal team will be taking legal actions agains him.

Star Wars API

Using the IBM Watson API, once you are in the admin page, just press play to get over 500 different facts about Star Wars. 
This will update everytime you reload the admin page.

CONFIGURATION

* Ruby version: 2.6.5

* Rails version: 5.2.4.3


## USER
### Admin User:
admin have the full access
  ```
  nicolas.genest@codeboxx.biz 
  ```
  Ou courriel d'un coach
### Customer User:
customer can only see charts and building, building details.
this change from the video..
  ```
  customer@user.com
  ```
### Normal User:
normal user is a employee and can mange every building they are associate with.
this change from the video..
```
normal@user.com
```
### Pasword:
the password for every account on this app is:
```
password
```
