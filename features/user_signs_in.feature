Feature: User signs in

  Background:
    Given the following user:
      | Last Name             | Wong              |
      | First Name            | Amy               |
      | Email                 | awong@example.com |
      | Password              | password          |
    And I am on the home page

  Scenario:
    Given I follow "Sign In"
    When I submit valid credentials
    Then I should see "Welcome, Amy"

  Scenario: Signs out
    Given I am signed in
    When I follow "Sign Out"
    Then I should see "Sign In"
    And I should see "Register"

  Scenario: Invalid credentials
    Given I follow "Sign In"
    When I submit invalid credentials
    Then I should see "Email and password don't match. Please try again"
