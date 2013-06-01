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
     | First Name      | first3     |
     | Last Name       | last3      |
     | Current Balance | 3.50       |
     | Date Paid       | 20/04/2009 |

    Then I shall see the following sponsors
    | Name         | Current Balance | Date Paid  | 
    | first3 last3 | $3.50           | 20/04/2009 | 