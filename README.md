
# Birthday Reminder

Application to send a happy birthday message to users on their birthday at exactly 9am on their local time.

# Description
This application will check the user's birthday on this day every hour using Sidekiq Scheduler. If a user has a birthday, the application will run a Sidekiq job to check the location and get the user's local timezone. If the time is match, the application will run Sidekiq Job asynchronously to hit the Hookbin API.

You can adjust birthday message and reminder time via admin dashboard on:
 
http://localhost:3000/admin/setting

notes:
| Parameter                  | Type     | Description                |
| :------------------------- | :------- | :------------------------- |
| `REMINDER_TIME`            | `int`    | Hour in 24 Hour format     |
| `HOOKBIN_MESSAGE_TEMPLATE` | `text`   | Hookbin message template<br>{first_name}: User first name<br>{last_name}: User last name<br>{location}: User Location<br>{country}: User country   |

## Tech Stack

- Ruby 3.1.1
- Rails 7.0.3
- Sidekiq
- Postgresql
- Redis


## Documentation

[Documentation](https://documenter.getpostman.com/view/1487291/Uz5NjDV9)


## Run Server

Clone the project

```bash
  git clone git@github.com:Akise17/birthday-reminder.git
```

Go to the project directory

```bash
  cd birthday-reminder
```

Copy .env file to root directory

#### Using Rails Server
Migrate Database

```bash
  rails db:migrate
```
```bash
  rails db:seed
```

Install dependencies

```bash
  bundle install
```

Start the server

```bash
  foreman start
```

Server running on port 3000


#### Using Docker
To run this app using docker simply run this command

```bash
  docker-compose --env-file .env.production up --build -d
```

Server running on port 3000

## Running Tests

To run tests you need to setup test database env

```bash
  RAILS_ENV=test rails db:migrate
```
```bash
  RAILS_ENV=test rails db:seed
```
and run the following command

```bash
  rspec
```
