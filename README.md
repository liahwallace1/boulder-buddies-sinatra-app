# Boulder Buddies Sinatra App

Boulder Buddies is a web app, built on Sinatra, that is a crowdsourcing tool to gather data on boulder problems in the U.S. Anyone can view the data added to the site, but a user needs to create an account and log in to add or edit content.

Without Account:
  - View list of Bouldering locations
  - View list of climbs at each location
  - View more detail on each climb
  - View the user profile of the user that uploaded the climb
  - View comments on climb from other users

With Account:
  - Have all the views of non-account holders
  - Add or edit a location
  - Add a climb
  - Edit climbs you have added
  - Add comments to climbs posted by other users

## Video walkthrough
[![IMAGE ALT TEXT](https://img.youtube.com/vi/1Jolb1kO7mQ/0.jpg)](https://youtu.be/1Jolb1kO7mQ "Boulder Buddies")

## Installation
Clone the repository, then execute:
```
$ bundle
```

## Usage

To start the server, run:
```
$ shotgun
```
Then navigate to ```localhost:9393``` or run:
```
$ open http://localhost:9393
```
Note: *You can also use ```rackup``` then go to ```localhost:9292``` as an alternative to ```shotgun```*
Note: *If using Learn IDE, navigate to the url given when ```shotgun``` starts*

### Tech

Boulder Buddies uses a number of open source projects to work properly:
* [Sinatra] - A DSL for quickly creating web applications in Ruby with minimal effort.
* [Active Record] - Connects classes to relational database tables.
* [Bcrypt] - A sophisticated and secure hash algorithm designed by The OpenBSD project.


And Boulder Buddies itself is open source with a [public repository][boulder-buddies]
 on GitHub.


### To Dos

 - Allow photo uploads for climbs
 - Adding map to location
 - Add account personalization
 - Add additional styling

## Contributing

Bug reports and pull requests are welcome on GitHub at [this project's repository][boulder-buddies]. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

This Web Application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


   [boulder-buddies]: <https://github.com/liahwallace1/boulder-buddies-sinatra-app>
   [bcrypt]: <https://rubygems.org/gems/bcrypt/versions/3.1.11>
   [Active Record]: <https://github.com/rails/rails/tree/master/activerecord>
   [Sinatra]: <https://github.com/sinatra/sinatra>
