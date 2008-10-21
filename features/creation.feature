Feature: Page creation
  In order to have more and more pages
  As a user
  I want to create a new one

  Scenario: witout autentication
    When I visit /brand-new
    And I fill in "body" with "This is my brand new wiki page!"
    And I press "send"
    Then I should see "brand-new"
    And I should see "This is my brand new wiki page!"
