Feature: create a judge account

  As an admin user
  I want to create a judge account

Scenario: create a judge account
  When I go to the sign_up page
  And  I fill in "Name" with "Sungkeun Kim"
  And  I fill in "Email" with "danguria@gmail.com"
  And  I fill in "Password" with "123456789"
  And  I fill in "Password confirmation" with "123456789"
  And  I press "Register"
  Then I should be on the admin page