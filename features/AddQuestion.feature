Feature: create a question

  As an admin user
  I want to create a question

Background: users in database

  Given the following users exist:
  | email               | password     | password_confirmation    | name          | user_type    |
  | admin1@gmail.com    | 123          | 123                      | Lance         | Admin        |

Scenario: create a question
  Given I am on the login page
  And  I fill in "Email" with "admin1@gmail.com"
  And  I fill in "Password" with "123"
  And  I press "Log In"
  And  I follow "Setup"
  
  And  I follow "Contest"
  Then I should see "Add New Contest"
  And  I should see "Current Contests"
  And  I fill in "Contest name" with "AAA"
  And  I fill in "Divisions" with "A:1"
  And  I press "Submit"
  
  And  I follow "Questions"
  And  I follow first "Show"
  And  I follow "+ Add New Questions"
  And  I press "+ Add question"
  And  I fill in first with "I"
  And  I press "DONE"
  
  And  I follow first "Delete"
  
  And  I follow "+ Add New Questions"
  And  I press "+ Add question"
  And  I fill in first with "S"
  And  I press "DONE"
  
  Then I should see "Qsheet was successfully updated."