# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

login curl

curl -d '{"user": {"email":"test@surrey.ac.uk", "password":"123456"}}' -H "Content-Type: application/json" -X POST localhost:3000/api/login -i