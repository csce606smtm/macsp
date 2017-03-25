Feature: create a judge account

  As an admin user
  I want to create a judge account

Background: users in database

  Given the following users exist:
  | email              | password     | password_confirmation    | name          | admin   |
  | admin@gmail.com    | 123          | 123                      | Lance         | 1       |

Scenario: create a judge account
  Given I am on the home page
  And  I fill in "Email" with "admin@gmail.com"
  And  I fill in "Password" with "123"
  And  I press "Log In"
  And  I follow "Sign Up"
  And  I fill in "Name" with "Donghwa Shin"
  And  I fill in "Email" with "sdhpekr@gmail.com"
  And  I fill in "Password" with "1231"
  And  I fill in "Password confirmation" with "1231"
  And  I press "Register"
  Then I should be on the admin page