# ABOUT THIS FILE
# This file provides the $db global variable and sets
# any options for the database connection

gem 'sqlite3'
require 'sqlite3'

database_file = "address_book.sqlite3"
$db = SQLite3::Database.new(database_file)
$db.results_as_hash = true
