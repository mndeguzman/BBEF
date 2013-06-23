Feature: i can see the students pages

Scenario: i can see list of students from the database
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        | sex    |
    | first2     | last2     | second | school1   | 20/01/2008 | MALE   |
    | first1     | last1     | first  | school2   | 20/03/2007 | FEMALE |
    When I view the list of students
    Then I shall see the following students
    | Name         | DOB        | Grade  | Institute |
    | first1 last1 | 20/03/2007 | first  | school2   |
    | first2 last2 | 20/01/2008 | second | school1   |

Scenario: i can see a student
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        | sex    | course_type | number_of_years_in_collage |
    | first2     | last2     | second | school1   | 20/01/2008 | MALE   | accounting  | 3                          |
    | first1     | last1     | first  | school2   | 20/03/2007 | FEMALE | consultancy | 2                          |
    When I view the list of students
    And I choose to view the student "first1 last1"
    Then I see the following details of a student
     | Name            | first1 last1         |
     | DOB             | 20/03/2007           |
     | Grade           | first                |
     | Institute       | school2              |
     | Sex             | Female               |
     | Course Type     | consultancy          |
     | Number Of Years | 2                    |

Scenario: i can edit a student
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |  sex    |course_type | number_of_years_in_collage |
    | first2     | last2     | second | school1   | 20/01/2008 |  MALE   |accounting  | 3                          |
    | first1     | last1     | first  | school2   | 20/03/2007 |  FEMALE |consultancy | 2                          |
    When I view the list of students
    And I choose to view the student "first1 last1"
    And I choose to edit the current student
    Then I see prepopulated the details of a student
     | First Name      | first1      |
     | Last Name       | last1       |
     | DOB             | 20/03/2007  |
     | Grade           | first       |
     | Institute       | school2     |
     | Course Type     | consultancy |
     | Number Of Years | 2           |
     | Sex             | 2           |
    Then I enter and save the following details of a student
     | First Name      | first1(changed)      |
     | Last Name       | last1(changed)       |
     | DOB             | 21/04/2008           |
     | Grade           | first(changed)       |
     | Institute       | school2(changed)     |
     | Course Type     | consultancy(changed) |
     | Number Of Years | 3                    |
     | Sex             | Male                 |
    Then I see the following details of a student
     | Name      | first1(changed) last1(changed) |
     | DOB       | 21/04/2008                     |
     | Grade     | first(changed)                 |
     | Institute | school2(changed)               |  
     | Course Type     | consultancy(changed) |
     | Number Of Years | 3                    |
     | Sex             | Male                 |     
    

 Scenario: i see vadliation errors if an edited value is not valid
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |  sex    |course_type | number_of_years_in_collage |
    | first2     | last2     | second | school1   | 20/01/2008 |  MALE   |accounting  | 3                          |
    | first1     | last1     | first  | school2   | 20/03/2007 |  FEMALE |consultancy | 2                          |
    When I view the list of students
    And I choose to view the student "first1 last1"
    And I choose to edit the current student
    Then I enter and save the following details of a student
     | First Name      |       |
    And I should see a message indicating that i have errors on page
    And I should see that the "first_name" of "student" needs to be corrected    

 Scenario: i can cancel editing a student
    Given the following students exist
    | first_name | last_name | grade  | institute | dob        |
    | first2     | last2     | second | school1   | 20/01/2008 |
    | first1     | last1     | first  | school2   | 20/03/2007 |
    When I view the list of students
    And I choose to view the student "first1 last1"
    And I choose to edit the current student
    And I choose to cancel the current action
    And I should be viewing the student details

Scenario: I can edit a Student from the Studnet list view
    Given the following students exist
    | first_name | last_name | 
    | first1     | last1     | 
    When I view the list of students
    And I choose to edit the student "first1 last1"
    Then I see the edit page for student "first1 last1"

  


