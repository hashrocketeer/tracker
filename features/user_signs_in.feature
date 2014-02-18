Feature: User signs in

  Scenario:
    Given the following user:
      | Last Name             | Wong              |
      | First Name            | Amy               |
      | Email                 | awong@example.com |
      | Password              | password          |
    And I am on the home page
    When I follow "Sign In"
    And I submit valid credentials
    Then I should see "Welcome, Amy"

  Scenario: Invalid credentials
    Given I am on the home page
    When I follow "Sign In"
    And I submit invalid credentials
    Then I should see "Email and password don't match. Please try again"
