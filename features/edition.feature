Feature: Page edition
  In order to keep the wiki pages updated
  As a user
  I want to change them easily

  Scenario: without change nothing changes
    Given authentication is disabled
    And I have a page called "readme" with "Thanks!"
    When I visit /readme
    And I follow "Edit"
    And I press "send"
    Then I should see "readme"
    And I should see "Thanks!"
    
  Scenario: with change something changes
    Given authentication is disabled
    And I have a page called "readme" with "Thanks!"
    When I visit /readme
    And I follow "Edit"
    And I fill in "body" with "This is my changed wiki page!"
    And I press "send"
    Then I should see "readme"
    And I should NOT see "Thanks!"
    And I should see "This is my changed wiki page!"

  Scenario: without authentication
    Given authentication is enabled
    And I have a page called "readme" with "Thanks!"
    When I visit /readme
    And I try to follow "Edit"
    Then I get a 401 error
    
    

