Feature: Admin adds user

  Scenario:
    Given there is a valid user
    And I am authenticated
    And I am on the admin page
    When I follow "Create New User"
    And I add details for a new user
    Then I should see that user in the list
