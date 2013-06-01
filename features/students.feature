Feature: i can see the students pages

Scenario: i can see list of students from the database
    Given the following students exist
    | first_name | last_name |
    | first2     | last2     |
    | first1     | last1     |
    When I view the list of students
    Then I shall see the following students
    | Name         |
    | first1 last1 |
    | first2 last2 |
