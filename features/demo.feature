Feature: As as Sky TV customer, I want to search for Sky+ HD

  Scenario: Sky Search
    Given I visit Sky homepage
    And I search for 'Sky+ HD'
    Then I should be on search results page


    Scenario: As a new customer, I want to look at different Sky TV packages
      Given  I visit Sky homepage
      And I goto sky shop
      Then I should be on sky shop page
      And I select Sky TV
      Then I should see different Sky TV packages






