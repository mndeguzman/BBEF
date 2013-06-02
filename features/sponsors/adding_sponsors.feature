@sponsor
Feature: i can add sponsors to the website

Scenario: i can add sponsor to the sponsors database
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       | last3                 |
     | Current Balance | 3.50                  |
     | Date Paid       | 30/12/2012            |
     | Address         | 719 Castle Rd         |
     | City            | Boulder               |
     | State           | NSW                   |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |

    Then I shall see the following sponsors
    | Name         | Current Balance | Date Paid  |
    | first3 last3 | $3.50           | 30/12/2012 |
    When I choose to view the sponsor "first3 last3"
    Then I see the following details of a sponsor
    | Name            | first3 last3          |
    | Current Balance | $3.50                 |
    | Date Paid       | 30/12/2012            |
    | Address         | 719 Castle Rd         |
    | City            | Boulder               |
    | State           | NSW                   |
    | Postcode        | 2257                  |
    | Home Phone      | 632 5231              |
    | Mobile          | 0400 123 456          |
    | Email           | first3.last3@test.com |
    | Contact Method  | email                 |