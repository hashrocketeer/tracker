Feature: User manages job titles

  Scenario: 
    Given there is a valid user
    And the following job titles:
     | Job Title Name  | Company Name       |
     | Bureaucrat      | Planet Express     |
     | Scientist       | Applied Cryogenics |
     | Captain         | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Job Titles"
    Then I should see the following table:
     | Job Titles      |
     | Bureaucrat      |
     | Captain         |
