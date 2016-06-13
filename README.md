# Address Book Db From Schema

##Learning Competencies

* Use sqlite gem to create a database using Ruby commands
* Use sqlite gem to perform CRUD operations on tables in a database using Ruby commands

## Summary

 Let's build an address book so we can keep track of all the awesome programmers we know.

Revisit (**or do if you have not already**) the [Address Book Schema]( ../../../db-drill-address-book-schema-challenge) and write a ruby program to create Objects to represent the address book and create the database  `address_book.db`

##Releases

###Release 0 : Create the address_book database

Create the SQL Schema that represents your database tables.  Then, create a file called  `setup.rb` which you will run only once and will create your database.  All other parts of your code will assume that the database has already been created.

Next, load some initial records into this database from hardcoded SQL statements.  This code should also be in `setup.rb`.

**Extra Credit**: Instead of hardcoding your insert statements, create a csv/YAML/JSON file with the data and import it.

###Release 1 : Build the Contact class

You'll find a spec file for the `Contact` class that corresponds to the newly-created `contacts` table in `source/contacts_spec.rb`. To start, they have all been marked as pending. Working one spec at a time, create methods that pass the specs.

The given specs may be missing things that you consider important; add any specs you need to feel comfortable that your code works as intended.

You will need the global variable in `source/db.rb` to interact with the database.

###Release 2 : Build the Group class

You'll find a spec file for the `Group` class corresponding to the `groups` table in `source/groups_spec.rb`. As before, they have all been marked pending.

Pay particular attention to what happens when you destroy a group - what should happen to records that refer to that group?

###Release 3 :  Data validation
Input from users is "Dangerous".  What if they give you a phone number with 17 digits? How about an address without a state? How does your database handle this?  How does your Ruby code handle this?

These are complex questions.  Come up with a plan to work with phone numbers (must have a valid format) and email addresses (must have a valid format and be unique).

Start by writing some specs to describe your plan, then implement the needed functionality.

##Resources

* [Ruby gem for SQLite](https://github.com/sparklemotion/sqlite3-ruby)
* [SQLite3 Rdoc](http://rdoc.info/github/sparklemotion/sqlite3-ruby)
* [SQLite3 SQL Syntax](http://www.sqlite.org/lang.html)
