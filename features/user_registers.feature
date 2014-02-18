Feature: New User Registers

  Scenario:
    Given I am on the home page
    And I follow "Register"
    When I submit the registration details
    Then I should see "Thank you for registering"

  Scenario: user exists
    Given the following user:
      | Last Name             | Wong              |
      | First Name            | Amy               |
      | Email                 | awong@example.com |
      | Password              | password          |
    And I am on the home page
    When I follow "Register"
    And I submit a duplicate email for registration
    Then I should see "User with that email already exists"
