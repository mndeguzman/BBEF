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