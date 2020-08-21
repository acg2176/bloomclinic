# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    - I used Sinatra. This is in the gemfile.
- [x] Use ActiveRecord for storing information in a database
    - I used the gem sinatra-activerecord. This is in the gemfile.
- [x] Include more than one model class (e.g. User, Post, Category)
    - My models are Patient, Appointment, Therapy
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - Patient has_many Appointments
    - Therapist has_many Appointments
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Appointment belongs_to Patient
    - Appointment belongs_to Therapist
- [x] Include user accounts with unique login attribute (username or email)
    - New users need to sign up with a username and email.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - Appointments can be created, read, updated, and destroyed
- [x] Ensure that users can't modify content created by other users
    - Only users who are logged in can modify their own content.
- [x] Include user input validations
    - 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message