Feature: i can see the students pages

Scenario: i can see list of students from the database
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | last2     | second | school1   | 20/01/2011 |
    | first1     | last1     | first  | school2   | 20/03/2010 |
    When I view the list of students
    Then I shall see the following students
    | Name         | DOB        | Grade  | Institute |
    | first1 last1 | 20/03/2010 | first  | school2   |
    | first2 last2 | 20/01/2011 | second | school1   |



Scenario: i can see a student
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | last2     | second | school1   | 20/01/2011 |
    | first1     | last1     | first  | school2   | 20/03/2010 |
    When I view the list of students
    And I choose to view the student "first1 last1"
    Then I see the following details of a student
     | Name      | first1 last1 |
     | DOB       | 20/03/2010   |
     | Grade     | first        |
     | Institute | school2      |

Scenario: i can edit a student
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | last2     | second | school1   | 20/01/2011 |
    | first1     | last1     | first  | school2   | 20/03/2010 |
    When I view the list of students
    And I choose to view the student "first1 last1"
    And I choose to edit the current student
    Then I see prepopulated the details of a student
     | First Name | first1     |
     | Last Name  | last1      |
     | DOB        | 20/03/2010 |
     | Grade      | first      |
     | Institute  | school2    |
    Then I enter and save the following details of a student
     | First Name | bob |
    Then I see the following details of a student
     | Name      | bob last1  |
     | DOB       | 20/03/2010 |
     | Grade     | first      |
     | Institute | school2    |

 Scenario: i can cancel adding a student to the database
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | last2     | second | school1   | 20/01/2011 |
    | first1     | last1     | first  | school2   | 20/03/2010 |
    When I view the list of students
    And I choose to view the student "first1 last1"
    And I choose to edit the current student
    And I choose to cancel the current action  
    And I should be viewing the student details  


  


