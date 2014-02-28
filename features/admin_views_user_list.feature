Feature: Admin views user list

  Scenario:
    Given the following companies:
      | Company Name |
      | Company 1    |
      | Company 2    |
    And the following users:
      | First Name | Last Name | Email                  | Company Name |
      | John       | Smith     | john.smith@example.com | Company 1    |
      | Paul       | Jones     | paul.jones@example.com | Company 2    |
      | Jan        | Smith     | jan.smith@example.com  | Company 1    |
      | Amy        | Wong      | awong@example.com      | Company 1    |
    And I am authenticated
    When I follow "Admin"
    Then I should see the following table:
      | First Name | Last Name | Email Address          |
      | John       | Smith     | john.smith@example.com |
      | Jan        | Smith     | jan.smith@example.com  |
      | Amy        | Wong      | awong@example.com      |
