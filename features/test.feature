Feature: test feature

  Scenario: Test
    Given I go to "http://www.sky.com"
    And I fill in the text field "query" with "tester"
    And I click the "Search" button
    Then I should be on 'Search Results (tester)'




