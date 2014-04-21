@javascript
Feature: User searches for a trainee

  Scenario:
    Given there is a valid user
    And the following trainees:
     | First Name | Last Name | Phone    | Badge Id | Employee Number | Department  | Category | Job Title    | Company Name   |
     | Philip     | Fry       | 555-1212 | 1        | 001             | Delivery    | Cat 1    | Delivery Boy | Planet Express |
     | Turanga    | Leela     | 555-1111 | 2        | 002             | Delivery    | Cat 1    | Captain      | Planet Express |
     | Amy        | Wong      | 555-1112 | 3        | 003             | Engineering | Cat 2    | Intern       | Planet Express |  
     | Kif        | Kroker    | 556-1113 | 2001     | 200             | Space Navy  | Cat 3    | Lieutenant   | Democratic Order of Planets |
     | Hermes     | Conrad    | 555-1113 | 4        | 004             | Accounting  | Cat 3    | Bureaucrat   | Planet Express |  
    And I am authenticated
    And I am on the people page
    When I search for trainees by "Last name" with "Fry"
    Then only that trainee is displayed
