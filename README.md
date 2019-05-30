# README

This is in a work in progress towards implementing a realtime chat API.

* It is in Rails 5.2.3 and Ruby 2.6.3, with a PostgreSQL database.

* It includes User, Room, Membership (a join model between User and Room), and Message models towards implementing group messaging.  (Direct messaging will probably be implemented by adding a Room just for the two users who wish to chat.)

* It includes a user registration endpoint, UsersController#create.

* It includes an authentication endpoint, AuthenticationsController#create, by which a user can log in and receive a JWT authentication token.

* It will use ActionCable to implement a WebSockets streaming realtime API.  Message sending has not yet been implemented, but there is a Connection class that authorizes and finds the user by decoding the JWT token sent in a request header.

* It is unit tested with RSpec 3.8; [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers); FactoryBot; and [action-cable-testing](https://github.com/palkan/action-cable-testing), a gem for testing ActionCable which has been merged into Rails 6.0 and RSpec 4.

