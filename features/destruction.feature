Feature: Page destruction
  In order to have only cool pages
  As a user
  I want to desdroy the ugly one

  Scenario: without autentication
    Given I have a page called "ugly-duck"
    When I visit the home
    And I follow "destroy" in "ugly-duck-links"
    Then I should not see "ugly-duck"
