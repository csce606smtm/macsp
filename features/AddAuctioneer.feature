Feature: add an auctioneer

  As an admin user
  I want to add an auctioneer

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
  And  I follow "Auctioneer"
  And  I fill in "Name" with "Auction Doe"
  And  I fill in "Email" with "ebay@gmail.com"
  And  I press "Add Auctioneer"
  
  And  I follow first "Delete"
  
  Then I should be on the new auctioneer page