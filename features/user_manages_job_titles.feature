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

  @javascript
  Scenario: Edit an existing job title
    When I click "Edit" for a job title
    And I complete the edit job title form
    Then I should see the following table:
     | Job Titles       |
     | Bureaucrat       |
     | Edit Engineering |

  @javascript
  Scenario: Job title can't be blank
    When I click "Edit" for a job title
    And I blank out the edit job title form
    Then I should see "Job Title name can't be blank"
    When I blank out the new job title form
    Then I should see "Job Title name can't be blank"
