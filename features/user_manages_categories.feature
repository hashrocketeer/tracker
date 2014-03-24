Feature: User manages categories

  Background:
    Given there is a valid user
    And the following categories:
     | Category Name   | Company Name       |
     | Business        | Planet Express     |
     | Cryogenics      | Applied Cryogenics |
     | Engineering     | Planet Express     |
    And I am authenticated
    And I am on the utilities page
    When I follow "Categories"

  Scenario: View a list of categories
    Then I should see the following table:
     | Categories   |
     | Business     |
     | Engineering  |

  Scenario: Add a new category
    When I complete the new category form
    Then I should see the following table:
     | Categories   |
     | Business     |
     | Engineering  |
     | New category |

  @javascript
  Scenario: Edit an existing category
    When I click edit for a category
    And I complete the edit category form
    Then I should see the following table:
     | Categories       |
     | Business         |
     | Edit Engineering |

  @javascript
  Scenario: Category can't be blank
    When I click edit for a category
    And I blank out the edit category form
    Then I should see "Category name can't be blank"
    When I blank out the new category form
    Then I should see "Category name can't be blank"
