Feature: create a judge account

  As an admin user
  I want to create a judge account

Background: users in database

  Given the following users exist:
  | email               | password     | password_confirmation    | name          | user_type    |
  | admin1@gmail.com    | 123          | 123                      | Lance         | Admin        |

  Given the following contests exist:
  | contest_name        |
  | Lonestar            |

Scenario: create a judge account
  Given I am on the login page
  And  I fill in "Email" with "admin1@gmail.com"
  And  I fill in "Password" with "123"
  And  I press "Log In"
  And  I follow "Setup"
  And  I follow "Judge"
  And  I fill in "Name" with "Donghwa Shin"
  And  I fill in "Email" with "sdhpekr@gmail.com"
  And  I fill in "Password" with "1231"
  And  I fill in "Password confirmation" with "1231"
  And  I select "Lonestar" from "contest[contest_name]"
  And  I press "Register Judge"
  Then I should be on the new judge page