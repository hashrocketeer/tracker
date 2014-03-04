Feature: User manages categories

  Scenario: 
    Given there is a valid user
    And the following categories:
     | Category Name   | Company Name       |
     | Business        | Planet Express     |
     | Cryogenics      | Applied Cryogenics |
     | Engineering     | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Categories"
    Then I should see the following table:
     | Categories      |
     | Business        |
     | Engineering     |
