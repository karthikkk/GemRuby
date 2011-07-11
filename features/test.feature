Feature: test feature

  Scenario: Test
    Given I go to 'https://myaccount.sky.com/portal/myaccount/'
    And I enter 'username' as 'prod.fulltierroi'
    And I enter 'password' as 'test1234'
    And I click 'Sign in'

  Scenario: Homepage
    Given I go to 'www.sky.com'
    And I enter 'query' as 'tester'
    And I click button 'sky-header-search-submit'
    Then I should be on 'balh'


      