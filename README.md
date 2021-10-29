# SMS-Rails

## About this Project
An Alert notification service is an application which can receive alerts from certain alerting systems like System_X and System_Y and send these alerts to developers in the form of SMS and emails. Holds basic template for teams of developers to be created and sent messages to. Built with [Ruby on Rails](https://rubyonrails.org/).

## Getting Started
To run this project locally requires a few prerequisites to be met.

### Prerequisites
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html)
* [PostgreSQL](https://www.postgresql.org/download/)

### Working
The structure of the project is divided into three different models: `team`, `developer` and `message`. `team` and `developer` both house teams and developers that can be created by the user, indexed, edited and deleted if necessary. `message` houses all the messages sent to the various teams through the `trigger_notification` route. 

### Installation
After cloning the git project and setting up the prerequisites, run:

```ruby
bundle install
```
This will install all the necessary gems needed that can be found in the Gemfile. 

After creating a local database using Postgres, run the rails server using this command in the terminal:
```ruby
rails s
```
Now, all the requests can be run for the app to process.

The available routes and how to access them can be found here in this [Postman Documentation](https://documenter.getpostman.com/view/12592433/UV5c9EqE)

### Running on Docker
The app is also available to use with [Docker](https://docs.docker.com/engine/install/) and can be used either locally or on a service like [Docker Playground](https://labs.play-with-docker.com/). The image for the app can be found [here](https://hub.docker.com/r/fiddler46/sms-rails) and comes with existing records within the database.

Simply pull:

```
docker pull fiddler46/sms-rails:<tag>
```

and then run:

```
docker run fiddler46/sms-rails:<tag>
```
and that should start the rails server. The same [Postman](https://documenter.getpostman.com/view/12592433/UV5c9EqE) routes still follow.


