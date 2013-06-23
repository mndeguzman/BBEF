@sponsor
Feature: i can see the sponsors pages

Background:
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance | address       | city    | state | postcode | home_phone | mobile       | email                 | contact_method |
    | first2     | last2     | 12/12/2012 | 12.00           |  address1             | city1        | state1      | postcodce1         |            |              |                       |                |
    | first1     | last1     | 30/12/2012 | -3.00           | 719 Castle Rd | Boulder | NSW   | 2257     | 632 5231   | 0400 123 456 | first3.last3@test.com | email          |

Scenario: i can see list of sponsors from the database
    When I view the list of sponsors
    Then I shall see the following sponsors
    | Name         | Current Balance | Date Paid  |
    | first1 last1 | -$3.00          | 30/12/2012 |
    | first2 last2 | $12.00          | 12/12/2012 |

Scenario: i can see a sponsor
    When I view the list of sponsors
    And I choose to view the sponsor "first1 last1"
    Then I see the following details of a sponsor
     | Name            | first1 last1          |
     | Current Balance | -$3.00                |
     | Date Paid       | 30/12/2012            |
     | Address         | 719 Castle Rd         |
     | City            | Boulder               |
     | State           | NSW                   |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |

Scenario: i can edit a sponsor
    When I view the list of sponsors
    And I choose to view the sponsor "first1 last1"
    And I choose to edit the current sponsor
    Then I see prepopulated the details of a sponsor
     | First Name      | first1                |
     | Last Name       | last1                 |
     | Current Balance | -3.00                 |
     | Date Paid       | 30/12/2012            |
     | Address         | 719 Castle Rd         |
     | City            | Boulder               |
     | State           | NSW                   |
     | Postcode        | 2257                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | email                 |

    When I enter and save the following details of a sponsor
     | First Name     | bob   |
     | Postcode       | 2000  |
     | Contact Method | phone |
    Then I see the following details of a sponsor
     | Name            | bob last1             |
     | Current Balance | -$3.00                |
     | Date Paid       | 30/12/2012            |
     | Address         | 719 Castle Rd         |
     | City            | Boulder               |
     | State           | NSW                   |
     | Postcode        | 2000                  |
     | Home Phone      | 632 5231              |
     | Mobile          | 0400 123 456          |
     | Email           | first3.last3@test.com |
     | Contact Method  | phone                 |

Scenario: if the disired details of a sponsor are incorrect when edited , the yser is infomred
    When I view the list of sponsors
    And I choose to view the sponsor "first1 last1"
    And I choose to edit the current sponsor
    When I enter and save the following details of a sponsor
     | First Name     |    |
    And I should see a message indicating that i have errors on page
    And I should see that the "first_name" of "sponsor" needs to be corrected


Scenario: I can edit a Sponsor from the Sponsor list view
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance |
    | first1     | last1     | 30/12/2012 | -3.00           |
    When I view the list of sponsors
    And I choose to edit the sponsor "first1 last1"
    Then I see the edit page for sponsor "first1 last1"
