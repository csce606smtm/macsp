Feature: access an user account

  As an/a admin/judge user
  I want to sign in with my admin/judge account

Background: users in database

  Given the following users exist:
  | email              | password     | password_confirmation    | name          | user_type  |
  | danguria@gmail.com | 123456789    | 123456789                | Sungkeun Kim  | Admin      |
  | tjeon90@gmail.com  | 1234567      | 1234567                  | Tae Jun Jeon  | Judge      |

Scenario: access an admin account and sign out successfully
  Given I am on the main page
  And  I fill in "Email" with "danguria@gmail.com"
  And  I fill in "Password" with "123456789"
  And  I press "Log In"
  Then I should be on the main page
  And  I should see "Sungkeun Kim"
  And  I follow "Log Out"
  Then I should be on the login page
  And  I should see "See you!"

Scenario: access a judge account and sign out successfully
  Given I am on the login page
  And  I fill in "Email" with "tjeon90@gmail.com"
  And  I fill in "Password" with "1234567"
  And  I press "Log In"
  Then I should be on the main page
  And  I should see "Tae Jun Jeon"
  And  I follow "Log Out"
  Then I should be on the login page
  And  I should see "See you!"

Scenario: access a judge account (sad path)
  Given I am on the login page
  And  I fill in "Email" with "tjeon90@gmail.com"
  And  I fill in "Password" with "123456789"
  And  I press "Log In"
  Then I should see "E-mail and/or password is incorrect"