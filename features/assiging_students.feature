Feature: i can assign a sponser to a student

@current @wip
Scenario: i can associate a student with a sponser
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance |
    | first2     | sponsor   | 12/12/2012 | 12.00           |
    | first1     | sponsor   | 30/12/2012 | -3.00           |
    And the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | student2   | second | school1   | 20/01/2011 |
    | first1     | student1   | first  | school2   | 20/03/2010 |
    | first3     | student3   | first  | school2   | 20/03/2010 |
    And I view the list of students
    And I choose to view the student "first1 student1"
    When I choose to associate the sponsor "first2 sponsor" with the current student
    Then the student "first2 sponsor" is associated with student "first1 student1"



