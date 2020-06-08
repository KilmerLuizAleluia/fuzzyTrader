# README

This system help user selecting assets to invest. To do this, shows high value assets based on self historic in last 52 weeks.
Also shows inverse value - low value assets based on same criteria. 

Things you may want to cover:

* Ruby version: 2.7.1;

* Rails version: 6.0.3;

* How to run the test suite: `$ bundle exec rspec`;

* How to run rubocop: `$ bundle exec rubocop --require rubocop-rails`;

* Heroku address: https://fuzzy-trader.herokuapp.com.


### TODO

* create `BitcoinQuotationService` and `StockQuotationService` to remove requests references from models;

* change `models/portfolio#dollar_value` to make one API call;

* change API - World Trading Data was returning `null` for any symbol;

* allow user to sell assets;

* add confirmation modal on buying asset. 
