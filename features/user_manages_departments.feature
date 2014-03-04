Feature: User manages departments

  Scenario: 
    Given there is a valid user
    And the following departments:
     | Department Name | Company Name       |
     | Business        | Planet Express     |
     | Cryogenics      | Applied Cryogenics |
     | Engineering     | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Departments"
    Then I should see the following table:
     | Department Name |
     | Business        |
     | Engineering     |