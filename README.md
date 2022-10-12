# Rails + StimulusReflex Demo

This repo contains the demo of StimulusReflex. It is a new way to craft modern, reactive web interfaces with Ruby on Rails. It simply aims to be an alternative way to write applications that are much more reactive and interactive.

Required things to setup this application :

* Ruby version :- ruby '2.7.0' and rails 6.1.4

* System dependencies :- I used PG for database.

Steps to build from scratch this :-  

1. Rails 6 has default webpacker
2. Run `bundle add stimulus_reflex` command, it adds gem stimulus_reflex in gemfile and download redis dependency in gemfile.lock
3. Run `bundle exec rails stimulus_reflex:install` command. It
  - Generate controllers folder inside Javascript folder  
  - Create app/javascript/controllers/index.js
  - Create app/javascript/controllers/hello_controller.js
  - Create app/reflexes/application_reflex.rb
  - Create app/javascript/controllers/application_controller.js
  - Create app/reflexes/example_reflex.rb
  - Create app/javascript/controllers/example_controller.js
  - Create config/initializers/stimulus_reflex.rb

4. Run scaffold command for generating User module

5. Add PG config(database.yml)

6. Add bootstrap 
  - follow this ans on stackoverflow
  https://stackoverflow.com/questions/64636601/why-does-my-bootstrap-in-rails-6-not-work
  then run `yarn add @popperjs/core` (Popper.js is a dependency of Bootstrap 4)

7. Add debouce
  https://github.com/hopsoft/debounced

8. Create UserReflex class and implement search feature