@javascript
Feature: User edits trainee

  Scenario:
    Given there is a valid user
    And I am authenticated
    And the company has metadata
    And the company has a trainee
    And I am on the people page
    When I search for that trainee
    And I edit that trainee's details
    Then I see a confirmation that the trainee was saved
    And I see that trainee in search results
