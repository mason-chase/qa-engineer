Feature: Update Customer

  Background:
    Given exists Customers with the following attributes
      | firstName | LastName | DateOfBirth | phoneNumber  | Email                | bankAccountNumber | amountDue |
      | Rachel    | Green    | 1990-01-01  | 092399939392 | rachel.green@fs.com  | 1234567890123456  | 100.50    |
      | John      | smaith   | 1990-01-01  | 092124339392 | john.smitheen@fs.com | 5555567890123456  | 100.50    |

    When user creates the new customer 'WITH ALL REQUIRED FIELDS'
    Then the create 'Is Successful'

  Scenario Outline: <testCase> <expectedResult>

    Given user wants to update the Customer 'rachel.green@fs.com' with the following attributes
      | firstName   | LastName   | DateOfBirth   | phoneNumber   | email   | bankAccountNumber   | amountDue   |
      | <firstName> | <lastName> | <dateOfBirth> | <phoneNumber> | <email> | <bankAccountNumber> | <amountDue> |

    When user saves the Customer '<testCase>'
    Then the save '<expectedResult>'

    Examples:
      | testCase                 | expectedResult | firstName | lastName | dateOfBirth | email                | AmountDue |
      | WITHOUT FIRST NAME       | FAILS          |           | Green    | 1990-01-01  | rachel.green@fs.com  | 100.5     |
      | WITHOUT LAST NAME        | FAILS          | Rachel    |          | 1990-01-01  | rachel.green@fs.com  | 200       |
      | WITHOUT DATE OF BIRTH    | FAILS          | Rachel    | Green    |             | rachel.green@fs.com  | 1500      |
      | WITHOUT EMAIL            | FAILS          | Rachel    | Green    | 1990-01-01  |                      | 32000     |
      | WITH DUPLICATED EMAIL    | FAILS          | Rachel    | Green    | 1990-01-01  | john.smitheen@fs.com | 1000      |
      | WITH ALL REQUIRED FIELDS | IS SUCCESSFUL  | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com  | 100.50    |


  Scenario: All fields are filled and editable

    Given  customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When the customer with email 'john.doe@email.com' is updated with the following details:
      | FirstName   | LastName   | DateOfBirth | PhoneNumber  | Email                  | BankAccountNumber | AmountDue |
      | UpdatedJohn | UpdatedDoe | 1995-05-05  | 987-654-3210 | updated.john@email.com | 6543210987654321  | 150.75    |

    Then the update 'IS SUCCESSFUL'
    And attempting to retrieve and display updated information for the customer should match the expected details


  Scenario Outline: <testCase> <expectedResult>
    Given customers with the following details exists:
      | firstName | LastName | DateOfBirth | phoneNumber  | Email                | bankAccountNumber | amountDue |
      | Rachel    | Green    | 1990-01-01  | 092399939392 | rachel.green@fs.com  | 1234567890123456  | 100.50    |
      | John      | smaith   | 1990-01-01  | 092124339392 | john.smitheen@fs.com | 5555567890123456  | 100.50    |

    When the customer is updated with the following details in '<testCase>' by email 'rachel.green@fs.com'
      | UpdatedFirstName | UpdatedLastName | UpdatedDateOfBirth | UpdatedPhoneNumber | UpdatedEmail | UpdatedBankAccountNumber | UpdatedAmountDue |
      | <NewFirstName>   | <NewLastName>   | <NewDateOfBirth>   | <NewPhoneNumber>   | <NewEmail>   | <NewBankAccountNumber>   | <NewAmountDue>   |

    Then the save '<expectedResult>'

    Examples:
      | testCase              | expectedResult | NewFirstName | NewLastName | NewDateOfBirth | NewPhoneNumber | NewEmail               | NewBankAccountNumber | NewAmountDue |
      | WITHOUT FIRST NAME    | IS SUCCESSFUL  | UpdatedJohn  | UpdatedDoe  | 1995-05-05     | 987-654-3210   | updated.john@email.com | 6543210987654321     | 150.75       |
      | WITHOUT LAST NAME     | IS SUCCESSFUL  | Alice        | Wonderland  | 1987-12-15     | 555-123-4567   | alice.wonderland@email | 9876543210123456     | 200.00       |
      | WITHOUT DATE OF BIRTH | IS SUCCESSFUL  | Bob          | Marley      | 1975-02-06     | 333-999-8888   | bob.marley@email.com   | 5555555555555555     | 75.25        |
      | DUPLICATED 3 FIELDS   | FAILS          | John         | smaith      | 1990-01-01     | 987-654-3210   | rachel.green@fs.com    | 9876543210123456     | 150.75       |


  Scenario: Update Customer Information with Valid Email

    Given  customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When customeris updated with the following details:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email            | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | marley@gmail.com | 1234567890123456  | 100.50    |

    Then the update 'IS SUCCESSFUL'


  Scenario: Update Customer Information with Valid Bank Account Number

    Given a customer with the following details exists:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 1234567890123456  | 150.00    |

    When customeris updated with the following details:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | NewBankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 9876543210123456     | 150.00    |

    Then if the customer exists, the should validate the updated bank account number format
    And if the bank account number is valid, 'the  should successfully update the customer with'


  Scenario Outline: Update Customer Information with  Name, Surname, and Date of Birth

    Given customer with the following details exists:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 1234567890123456  | 150.00    |

    When  the customer is updated with the following details:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 1234567890123456  | 150.00    |
    Then 'Display error'


