Feature: i can assign a sponser to a student


@current
Scenario: i can associate a student with a sponser
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance |
    | first2     | sponsor2  | 12/12/2012 | 12.00           |
    | first1     | sponsor1  | 30/12/2012 | -3.00           |
    And the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | student2  | second | school1   | 20/01/2011 |
    | first1     | student1  | first  | school2   | 20/03/2010 |
    | first3     | student3  | first  | school2   | 20/03/2010 |
    And I view the list of students
    And I choose to view the student "first1 student1"
    When I choose to associate the sponsor "first2 sponsor2" with the current student
    Then the current student is associated with "first2 sponsor2"
    And I choose to view the students
    Then I shall see the following students
    | Name            | DOB        | Grade  | Institute | Sponsor         |
    | first1 student1 | 20/03/2010 | first  | school2   | first2 sponsor2 |
    | first2 student2 | 20/01/2011 | second | school1   |                 |
    | first3 student3 | 20/03/2010 | first  | school2   |                 |



Scenario: i can navigate from the list of studnets to thier sponsor
    Given the following sponsors exist
    | sponsor | first_name | last_name | date_paid  | current_balance | 
    | spon2   | first2     | sponsor2  | 12/12/2012 | 12.00           | 
    | spon1   | first1     | sponsor1  | 30/12/2012 | -3.00           | 
    And the following students exist
    | sponsor          | first_name | last_name | grade  | institute | dob        |
    | sponsor: "spon1" | first2     | student2  | second | school1   | 20/01/2011 |
    |                  | first1     | student1  | first  | school2   | 20/03/2010 |
    |                  | first3     | student3  | first  | school2   | 20/03/2010 |
    And I view the list of students
    When I choose to view the sponsor of "first2 student2"
    Then I am viewing the sponsor "first1 sponsor1"

Scenario: i can see a list of sponsors to asscoiated with the students
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance | postcode    |
    | first2     | sponsor2  | 12/12/2012 | 12.00           |  2000       |
    | first1     | sponsor1  | 30/12/2012 | -3.00           |  1589       |
    And the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | student2  | second | school1   | 20/01/2011 |
    | first1     | student1  | first  | school2   | 20/03/2010 |
    | first3     | student3  | first  | school2   | 20/03/2010 |
    And I view the list of students
    And I choose to view the student "first1 student1"
    When I can associate the student with 
    |sponsor                |
    |first1 sponsor1 (2000) |   
    |first2 sponsor2 (1589) |    



