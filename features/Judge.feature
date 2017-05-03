Feature: Judge a person

  As a judge user
  I want to judge an auctioneer

Background: users in database

  Given the following users exist:
  | email                | password     | password_confirmation    | name          | user_type  | id        |
  | auctioneer@gmail.com | 123456789    | 123456789                | Sungkeun Kim  | Auctioneer | 7777777   |
  | Judge@gmail.com      | 1234567      | 1234567                  | Tae Jun Jeon  | Judge      | 5555555   |
    
  Given the following contests exist:
  | contest_name        | id         |
  | AAA                 | 99999999   |

  Given the following divisions exist:
  | division_name       | round    | contest_id    | id        |
  | A                   | 1        | 99999999      | 99999999  |
  
  Given the following judges exist:
  | user_id        | contest_id | id        |
  | 5555555        | 99999999   | 99999999  |
  
  Given the following auctioneers exist:
  | user_id        | division_id | id        | done       | judge_id  |
  | 7777777        | 99999999    | 99999999  | false      | 99999999  |

  Given the following qsheets exist:
  | division_id       | id        |
  | 99999999          | 99999999  |
  
  Given the following questions exist:
  | qsheet_id     | dataType    | content     | id         |
  | 99999999      | S           | Hello?      | 99999999   |
  
  Given the following scoresheets exist:
  | auctioneer_id | judge_id    | id         | question_id  |
  | 99999999      | 99999999    | 99999999   | 99999999     |

Scenario: judge someone
  Given I am on the login page
  And  I fill in "Email" with "Judge@gmail.com"
  And  I fill in "Password" with "1234567"
  And  I press "Log In"
  And  I follow "Judge Page"
  And  I follow first "See Auctioneers"
  And  I follow first "Score this auctioneer"
  And  I fill in first with "He is really good"
  And  I press "Submit"
  Then I should see "Judge Page"