# ABOUT THIS FILE
# This file establishes the initial schema and any seed data.
# It should be run directly from the command line *once*.
# Rerunning it will destroy the existing database.
#

gem 'sqlite3'
require 'sqlite3'
require 'fileutils'

database_file = "address_book.sqlite3"
FileUtils.rm(File.expand_path('./'+database_file)) rescue nil
$db = SQLite3::Database.new(database_file)

# TODO: set up your schema here

# TODO: set up any initial data here


