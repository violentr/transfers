# README

Rails 5 Application

 This Application has no UI
 in order to use it you need to be registerd.

 post request to http://localhost:3000/users/register

 To login:

 post request to http://localhost:3000/users/login

 Users

 Contstraints

 - first_name, string no longer than 20 chars, can't be empty
 - last_name, string no longer than 20 chars, can't be empty
 - address_line_1, string no longer than 50 chars, can't be empty
 - DOB, date, can't be empty
 each User has many Transfers

 Transfer

 Constraints:

 - account_number_from, string, exactly 18 chars, can't be empty

 - account_number_to, string, exactly 18 chars, can't be empty

 - amount_pennies, integer, not smaller than 0

 - country_code_from, string, exactly 3 chars, can't be empty (ISO
   standard)

 - country_code_to, string, exactly 3 chars, can't be empty (ISO
   standard)

 USER - CRUD, users json has "name" field (first and last names
 combined with a space) and an "age" (in years) field

 TRANSFERS - CRUD
 transfers reachable under RESTful API
 POST /users/:id/transfers
 GET /users/:id/transfers/:id
 DELETE /users/:id/transfers/:id
 PUT /users/:id/transfers/:id

 - authentication done : username + password that
 - if authentication was successful return auth token
 - access to transfers restricted by guest user
 - access to transfers granted to authenticated user

* To start application
   clone repo

   run bundlle

   run rake db:create:all

   run rake db:migrate

   run rails s
