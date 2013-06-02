@sponsor
Feature: i can see the sponsors pages

Scenario: i can see list of sponsors from the database
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance |
    | first2     | last2     | 12/12/2012 | 12.00           |
    | first1     | last1     | 30/12/2012 | -3.00           |
    When I view the list of sponsors
    Then I shall see the following sponsors
    | Name         | Current Balance | Date Paid  |
    | first1 last1 | -$3.00          | 30/12/2012 |
    | first2 last2 | $12.00          | 12/12/2012 |

Scenario: i can add sponsor to the sponsors database
    When I view the list of sponsors
    And I choose to add a sponsor
    And I attempt to create a sponsor with the following values
     | First Name      | first3        |
     | Last Name       | last3         |
     | Current Balance | 3.50          |
     | Date Paid       | 30/12/2012    |
     | Address         | 719 Castle Rd |                    
     | City            | Boulder       |            
     | State           | NSW           |          
     | Postcode        | 2257          |             

    Then I shall see the following sponsors
    | Name         | Current Balance | Date Paid  |
    | first3 last3 | $3.50           | 30/12/2012 |
    When I choose to view the sponsor "first3 last3"
    Then I see the following details of a sponsor
    | Name            | first3 last3  |
    | Current Balance | $3.50         |
    | Date Paid       | 30/12/2012    |
    | Address         | 719 Castle Rd |
    | City            | Boulder       |
    | State           | NSW           |
    | Postcode        | 2257          |

Scenario: i can see a sponsor
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance | address       | city    | state | postcode | 
    | first2     | last2     | 12/12/2012 | 12.00           |               |         |       |          |
    | first1     | last1     | 30/12/2012 | -3.00           | 719 Castle Rd | Boulder | NSW   | 2257     |
    When I view the list of sponsors
    And I choose to view the sponsor "first1 last1"
    Then I see the following details of a sponsor
     | Name            | first1 last1  |
     | Current Balance | -$3.00        |
     | Date Paid       | 30/12/2012    |
     | Address         | 719 Castle Rd |
     | City            | Boulder       |
     | State           | NSW           |
     | Postcode        | 2257          |

Scenario: i can edit a sponsor
    Given the following sponsors exist
    | first_name | last_name | date_paid  | current_balance | address       | city    | state | postcode |
    | first2     | last2     | 12/12/2012 | 12.00           |               |         |       |          |
    | first1     | last1     | 30/12/2012 | -3.00           | 719 Castle Rd | Boulder | NSW   | 2257     |
    
    When I view the list of sponsors
    And I choose to view the sponsor "first1 last1"
    And I choose to edit the current sponsor
    Then I see prepopulated the details of a sponsor
     | First Name      | first1        |
     | Last Name       | last1         |
     | Current Balance | -3.00         |
     | Date Paid       | 30/12/2012    |
     | Address         | 719 Castle Rd | 
     | City            | Boulder       | 
     | State           | NSW           | 
     | Postcode        | 2257          | 

    When I enter and save the following details of a sponsor
     | First Name | bob  |
     | Postcode   | 2000 |
    Then I see the following details of a sponsor
     | Name            | bob last1     |
     | Current Balance | -$3.00        |
     | Date Paid       | 30/12/2012    |
     | Address         | 719 Castle Rd |
     | City            | Boulder       |
     | State           | NSW           |
     | Postcode        | 2000          |