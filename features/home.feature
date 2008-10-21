Feature: Wiki home
  In order to know which are the available pages
  As a user
  I want an index with all of them

  Scenario: home
    Given I have a file called "readme.txt"
    When I visit the home
    Then I should see a link to "readme"
