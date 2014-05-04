@javascript
Feature: User adds trainee

  Scenario:
    Given there is a valid user
    And I am authenticated
    And the company has metadata
    And I am on the people page
    When I follow "Create New Trainee"
    And I submit the trainee details
    Then I see a confirmation that the trainee was added
    And I see that trainee in search results
