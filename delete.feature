Feature: Delete Customer

  Background:  Delete and Attempt to Restore Customer Information

    Given a customer with the following attributes
      | firstName | lastName | dateOfBirth | email               |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |

    When customer already exists
    Then Then attempting to retrieve the deleted customer should result in an appropriate error

  Scenario: DELETE BY EMAIL

    When user wants to delete customer by email rachel.green@fs.com
    Then the delete 'IS SUCCESSFUL'