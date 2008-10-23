Feature: Page destruction
  In order to have only cool pages
  As a user
  I want to desdroy the ugly one

  Scenario: without authentication
    Given I have a page called "ugly-duck"
    And authentication is disabled
    When I visit the home
    And I follow "destroy" in "#ugly-duck-links"
    Then I should not see "ugly-duck"
    And the page "ugly-duck" does NOT exist
    

  Scenario: with authentication without credentials
    Given I have a page called "ugly-duck"
    And authentication is enabled
    When I visit the home
    Then I get a 401 error when I follow "destroy" in "#ugly-duck-links"
    And the page "ugly-duck" DOES exist
    
  Scenario: with authentication and good credentials
    Given authentication is enabled
    And username is set to foo and password is set to bar
    And I have logged in with username foo and password bar
    And I have a page called "ugly-duck"
    When I visit the home
    And I follow "destroy" in "#ugly-duck-links"
    Then I should not see "ugly-duck"
    And the page "ugly-duck" does NOT exist

