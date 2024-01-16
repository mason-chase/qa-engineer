Feature: Get Customer

  Background:

  Scenario: Customer made There is no information to display

    Given an customer with the following attributes
      | firstName | lastName | dateOfBirth | email               |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |

    When customer already exists
    Then 'Display error'

  Scenario: GET BY Email

    When user wants to get customer by email check@gmail.com
    Then the get 'IS SUCCESSFUL'
    And following customer is returned
      | firstName | lastName | dateOfBirth | email               |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |

  Scenario: IS A CUSTOMER AND THE  REGISTERED INFORMATION  OF THE PREVIOUS DATA SHOULD BE DIPLAYED

    Given customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When Enter the specifications and 'DISPLAYE THE  PREVIOUS  DATA'
    Then 'DISPLAYE THE  PREVIOUS  DATA'


  Scenario: DIAPLAYE CUSTOMER INFORMATION

    Given an customer with the following attributes
      | firstName | lastName | dateOfBirth | email              |
      | John      | Doe      | 1990-01-01  | john.doe@email.com |

    When the customer with ID 1 is 'requested for display'
    Then the displayed customer information should match the expected format and contain all relevant details
    




