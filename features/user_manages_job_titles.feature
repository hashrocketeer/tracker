Feature: User manages job titles

  Background:
    Given there is a valid user
    And the following job titles:
     | Job Title Name  | Company Name       |
     | Bureaucrat      | Planet Express     |
     | Scientist       | Applied Cryogenics |
     | Captain         | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Job Titles"

  Scenario: View a list of job titles
    Then I should see the following table:
     | Job Titles      |
     | Bureaucrat      |
     | Captain         |

  Scenario: Add a new job title
    When I complete the new job title form
    Then I should see the following table:
     | Job Titles    |
     | Bureaucrat    |
     | Captain       |
     | New job title |
