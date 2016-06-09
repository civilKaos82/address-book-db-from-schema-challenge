# Associating Groups and Contacts

## Summary
We're going to be working with two classes:  `Group` and `Contact`.  Each class is backed by our database.  The classes are provided with behaviors for persisting themselves in the database.  We can save new groups and contacts in our database, we can pull records out of the database, we can update records in the database, etc.

However, the classes are independent of each other.  We can't ask a group which contacts it has.  And conversely, we can't ask a contact to which group it belongs.

At least not yet.  That's the behavior we're going to add in this challenge.  We're going to write methods that allow us to associate groups and contacts with each other.  For example, we'll be able tell a group that it has a new contact and tell a contact that it belongs to a specific group.


## Releases
### Pre-release: Setup the Database
In order for our `Group` and `Contact` classes to work properly, we need a database with a `groups` table and a `contacts` table.  The file `setup.rb` will create this database for us; all we need to do is run the file:

```
$ ruby setup.rb
```

*Note:* If we somehow break our database, we can rerun this file to remove the old database file and create a new one.  We'll lose any data in the database, but it is an option.
