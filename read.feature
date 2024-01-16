Feature: Get Customer

  Scenario: GET BY Email

    Given customer with the following details exists:
      | firstName | lastName | dateOfBirth | email               | phoneNumber  | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com | 123-456-7890 | 1234567890123456  | 20000     |
    When user wants to get customer by email 'rachel.green@fs.com'
    Then the get 'IS SUCCESSFUL'
    And following customer is returned
      | firstName | lastName | dateOfBirth | email               | phoneNumber  | bankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com | 123-456-7890 | 1234567890123456  | 20000     |

  Scenario: GET BY Firstname, Lastname, and BirthDate

    Given customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When user wants to get customer by 3 fields 'John', 'Doe', '1990-01-01'
    Then the get 'IS SUCCESSFUL'
    And following customer is returned
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

  Scenario: DIAPLAYE CUSTOMER INFORMATION

    Given doesn't have any customer with 'john.doe@email.com'
    When user wants to get customer by email 'john.doe@email.com'
    Then the display 'FAILS'





