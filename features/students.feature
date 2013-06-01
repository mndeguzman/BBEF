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


Scenario: i can see list of students from the database
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | Last Name  | last3      |
     | DOB        | 20/04/2009 |
     | Grade      | third      |
     | Institute  | school3    |

    Then I shall see the following students
    | Name         | DOB        | Grade | Institute |
    | first3 last3 | 20/04/2009 | third | school3   |

