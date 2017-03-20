Feature: access an user account

  As an/a admin/judge user
  I want to sign in with my admin/judge account

Scenario: access an admin account
  Given I am on the home page
  And  I fill in "Email" with "danguria@gmail.com"
  And  I fill in "Password" with "123456789"
  And  I press "Log In"
  Then I should be on the admin page
  And  I should see "Sungkeun Kim"

Scenario: access a judge account
  Given I am on the home page
  And  I fill in "Email" with "tjeon90@gmail.com"
  And  I fill in "Password" with "1234567"
  And  I press "Log In"
  Then I should be on the judge page
  And  I should see "Tae Jun Jeon"

Scenario: access a judge account (sad path)
  Given I am on the home page
  And  I fill in "Email" with "tjeon90@gmail.com"
  And  I fill in "Password" with "123456789"
  And  I press "Log In"
  Then I should see "E-mail and/or password is incorrect"