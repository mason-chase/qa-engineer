Feature: Delete Customer

  Background:

    Given a customer with the following attributes
      | firstName | lastName | dateOfBirth | email               |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |

    When customer already exists

  Scenario: DELETE BY EMAIL 

    When user wants to delete customer by email rachel.green@fs.com 
    Then the delete 'IS SUCCESSFUL'