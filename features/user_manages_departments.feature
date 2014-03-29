Feature: User manages departments

  Background:
    Given there is a valid user
    And the following departments:
     | Department Name | Company Name       |
     | Business        | Planet Express     |
     | Cryogenics      | Applied Cryogenics |
     | Engineering     | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Departments"

  Scenario: View a list of departments
    Then I should see the following table:
     | Department Name |
     | Business        |
     | Engineering     |

  Scenario: Add a new department
    When I complete the new department form
    Then I should see the following table:
     | Department Name |
     | Business        |
     | Engineering     |
     | New department  |

  @javascript
  Scenario: Edit an existing department
    When I click "Edit" for a department
    And I complete the edit department form
    Then I should see the following table:
     | Department Name  |
     | Business         |
     | Edit Engineering |
