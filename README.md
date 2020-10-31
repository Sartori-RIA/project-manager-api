# Sartori Project Manager api

# Requirements

+ With docker
    + Docker
    + Docker Compose

+ Without docker
    + Ruby 2.7.2
    + Rails 6
    + Bundler
    
# Quick start

+ `cp config/application.yml.example config/application.yml`  
    + if you going to run this project inside docker, please change:
        ````yaml
        database: &database
            DB_USERNAME: postgres
            DB_PASSWORD: postgres
            DB_HOST: localhost  
      ````
    
      to:
    
      ````yaml
      database: &database
        DB_USERNAME: postgres
        DB_PASSWORD: postgres
        DB_HOST: db
      
 + With docker
    + `docker-compose up -d`
    + `docker exec it twitter_api /bin/bash`
    + `bundle`
    + `rails db:create`
    + `rails db:migrate`
    + `rails db:populate`
    + `rails s`, open in `http://localhost`
    + to run spec tests: `rspec`
    
+ Without docker
    + `bundle`
    + `rails db:create`
    + `rails db:migrate`
    + `rails db:populate`
    + `rails s`, open in `http://localhost:3000`
    + to run spec tests: `rspec`
