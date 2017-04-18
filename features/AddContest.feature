Feature: add a contest

  As an admin user
  I want to add a contest

Background: users in database

  Given the following users exist:
  | email               | password     | password_confirmation    | name          | user_type    |
  | admin1@gmail.com    | 123          | 123                      | Lance         | Admin        |

Scenario: add an auctioneer
  Given I am on the login page
  And  I fill in "Email" with "admin1@gmail.com"
  And  I fill in "Password" with "123"
  And  I press "Log In"
  And  I follow "Setup"
  And  I follow "Contest"
  Then I should see "Add New Contest"
  And  I should see "Current Contests"
  And  I fill in "Name" with "Test contest"
  And  I fill in "Date" with "2017/05/05"
  And  I fill in "Divisions" with "Rookie:2, Veteran:3"
  And  I press "Submit"
  Then I should see "Successfully added division"