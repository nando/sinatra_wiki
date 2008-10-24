Feature: Page creation
  In order to have more and more pages
  As a user
  I want to create a new one

  Scenario: without authentication
    Given authentication is disabled
    When I visit /brand-new
    And I fill in "body" with "This is my brand new wiki page!"
    And I press "send"
    Then the page brand-new DOES exist 
    And I should see "brand-new"
    And I should see "This is my brand new wiki page!"
    
  Scenario: with authentication without credentials
    Given authentication is enabled
    When I try to visit /brand-new
    Then I get a 401 error
    And the page "brand-new" does NOT exist
    
  Scenario: with authentication and good credentials
    Given authentication is enabled
    And username is set to foo and password is set to bar
    And I have logged in with username foo and password bar
    When I visit /brand-new
    And I fill in "body" with "This is my brand new wiki page!"
    And I press "send"
    Then the page brand-new DOES exist 
    And I should see brand-new
    And I should see "This is my brand new wiki page!"
    
    
