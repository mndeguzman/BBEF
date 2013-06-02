Feature: i can add a student

Scenario: i can add a student to the database
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

 Scenario: i can cancel adding a student to the database
    When I view the list of students
    And I choose to add a student   
    And I choose to cancel the current action  
    And I should be viewing the student list

Scenario: a student needs to have a first name
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | DOB        | 20/04/2009 |
     | Grade      | third      |
     | Institute  | school3    |
    And 0 students should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "last_name" of "student" needs to be corrected 




  


