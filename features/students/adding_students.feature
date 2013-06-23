Feature: i can add a student

Scenario: i can add a student to the database
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | Last Name  | last3      |
     | DOB        | 20/04/2008 |
     | Grade      | third      |
     | Institute  | school3    |
    Then I shall see the following students
    | Name         | DOB        | Grade | Institute |
    | first3 last3 | 20/04/2008 | third | school3   |

 Scenario: i can cancel adding a student to the database
    When I view the list of students
    And I choose to add a student   
    And I choose to cancel the current action  
    And I should be viewing the student list

Scenario: a student needs to have a last name
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | DOB        | 20/04/2008 |
     | Grade      | third      |
     | Institute  | school3    |
     | Sex        | Male       |
    And 0 students should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "last_name" of "student" needs to be corrected 

Scenario: a student needs to have a first name
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | Last Name  | last3      |
     | DOB        | 20/04/2008 |
     | Grade      | third      |
     | Institute  | school3    |
     | Sex        | Male       |
    And 0 students should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "first_name" of "student" needs to be corrected 


Scenario: a student needs to have be in grade
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | Last Name  | last3      |
     | DOB        | 20/04/2008 |
     | Institute  | school3    |
     | Sex        | Male       |
    And 0 students should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "grade" of "student" needs to be corrected 

Scenario: a student needs to have be in a institute
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | Last Name  | last3      |
     | Grade      | third      |
     | DOB        | 20/04/2008 |
     | Sex        | Male       |
    And 0 students should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "institute" of "student" needs to be corrected 

Scenario: student's age can be more less than 5 year
    When I view the list of students
    And I choose to add a student
    When I attempt to create a student with the following values
     | First Name | first3     |
     | Last Name  | last3      |
     | Grade      | third      |
     | DOB        | 20/4/2008 |
     | Institute  | school3    |
    And 1 students should exist
    And I should be viewing the student list


  


