# ABOUT THIS FILE
# This file provides some helper functions to directly insert
# records in the database for testing purposes.
#
# Each of these functions returns the id of the newly-created record
#

require_relative 'config'

def create_contact(params={})
  sql = <<-SQL
    INSERT INTO contacts (first_name, last_name, company, phone_number, email_address)
    VALUES (?, ?, ?, ?, ?)
  SQL
  $db.execute(sql, [params[:first_name], params[:last_name], params[:company], params[:phone_number], params[:email_address]])
  $db.last_insert_row_id
end

def create_group(params={})
  sql = <<-SQL
    INSERT INTO groups (name)
    VALUES (?)
  SQL
  $db.execute(sql, [params[:name]])
  $db.last_insert_row_id
end
