# Ruby on Rails Articles project

> This project emulates an article posting/sharing website. Functions implemented are constraint to register, login, post new article, read them, and vote for them.

## Built With

- Ruby v2.6.5
- Ruby on Rails v5.2.4

## Live Demo

`https://immense-plains-60294.herokuapp.com/`

## Getting Started

Local copy can be initialized following a few steps: 

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

Open `https://immense-plains-60294.herokuapp.com/` in your browser.

### Run tests

Unit test was used on this project for testing models and controllers
RSpec was used for testing login - account creation - article creation and 
vote action.

```
    run rails test for testing on console
    run rails test -v to see verbose version (shoing what is testing)
    run bundle exec rspec for running flow test written on RSpec
    run bundle exec rspec spec --format documentation to read the test that will
    be running for rspec.

    Small article creation integration test was also written in unit-test
```

### Known issue

Updated rails 6.0 version brought a warning showing during test which could not be fixed properly yet, regarding some autoloading feature not being remove either init configurations or inside app.

### Deployment

`https://immense-plains-60294.herokuapp.com/`

## Authors

Facundo Iglesias: `https://github.com/Fig77`

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!
