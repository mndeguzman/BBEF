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

Scenario: a sponsor needs a first name
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      |                       |
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
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "first_name" of "sponsor" needs to be corrected


Scenario: a sponsor needs a last name
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       |                       |
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
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "last_name" of "sponsor" needs to be corrected


Scenario: a sponsor needs an address
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       |                       |
     | Current Balance | 3.50                  |
     | Date Paid       | 30/12/2012            |
     | Address         |                       |
     | City            | Boulder               |
     | State           | NSW                   |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "address" of "sponsor" needs to be corrected


Scenario: a sponsor needs an city
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       |                       |
     | Current Balance | 3.50                  |
     | Date Paid       | 30/12/2012            |
     | Address         | address               |
     | City            |                       |
     | State           | NSW                   |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "city" of "sponsor" needs to be corrected


Scenario: a sponsor needs an state
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       |                       |
     | Current Balance | 3.50                  |
     | Date Paid       | 30/12/2012            |
     | Address         | address               |
     | City            | city1                 |
     | State           |                       |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "state" of "sponsor" needs to be corrected

Scenario: a sponsor needs an postcode
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3                |
     | Last Name       |                       |
     | Current Balance | 3.50                  |
     | Date Paid       | 30/12/2012            |
     | Address         | address               |
     | City            | city1                 |
     | State           | NSW                   |
     | Postcode        |                       |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |
    And 0 sponsors should exist
    And I should see a message indicating that i have errors on page
    And I should see that the "postcode" of "sponsor" needs to be corrected
