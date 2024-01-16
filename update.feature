Feature: Update Customer

  Background:

    Given an Customer with the following attributes
      | firstName | lastName | dateOfBirth | email               |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |

    When Customer already exists


  Scenario Outline: <testCase> <expectedResult>

    Given user wants to update an Customer with the following attributes
      | firstName   | lastName   | dateOfBirth   | email   |
      | <firstName> | <lastName> | <dateOfBirth> | <email> |

    When user saves the Customer '<testCase>'
    Then the save '<expectedResult>'

    Examples:
      | testCase                 | expectedResult | id  | firstName | lastName | dateOfBirth | email               |
      | WITHOUT FIRST NAME       | FAILS          | 300 |           | Green    | 1990-01-01  | rachel.green@fs.com |
      | WITHOUT LAST NAME        | FAILS          | 300 | Rachel    |          | 1990-01-01  | rachel.green@fs.com |
      | WITHOUT DATE OF BIRTH    | FAILS          | 300 | Rachel    | Green    |             | rachel.green@fs.com |
      | WITHOUT EMAIL            | FAILS          | 300 | Rachel    | Green    | 1990-01-01  |                     |
      | WITH ALL REQUIRED FIELDS | IS SUCCESSFUL  | 300 | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com |


  Scenario: All fields are filled and editable

    Given  customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When the customer with email 'john.doe@email.com' is updated with the following details:
      | FirstName   | LastName   | DateOfBirth | PhoneNumber  | Email                  | BankAccountNumber | AmountDue |
      | UpdatedJohn | UpdatedDoe | 1995-05-05  | 987-654-3210 | updated.john@email.com | 6543210987654321  | 150.75    |

    Then the update 'IS SUCCESSFUL' 
    And attempting to retrieve and display updated information for the customer should match the expected details
    

  Scenario: If the phone number is updated, it must be in a valid format and not duplicate

    Given customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  |
      | John      | Doe      | 1990-01-01  | 123-456-7890 |

    When the customer is updated with the following details
      | UpdatedFirstName | UpdatedLastName | UpdatedDateOfBirth | UpdatedPhoneNumbe |
      | <NewFirstName>   | <NewLastName>   | <NewDateOfBirth>   | <NewPhoneNumber>  |

    Then  should check if the customer exists
    And if the customer exists, the  should validate the updated phone number format
    And if the phone number is valid and not a duplicate, the should successfully update the customer with
    And attempting to retrieve and display updated information for the customer should match the expected details

    Examples:
      | NewFirstName | NewLastName | NewDateOfBirth | NewPhoneNumber | NewEmail               | NewBankAccountNumber | NewAmountDue |
      | UpdatedJohn  | UpdatedDoe  | 1995-05-05     | 987-654-3210   | updated.john@email.com | 6543210987654321     | 150.75       |
      | Alice        | Wonderland  | 1987-12-15     | 555-123-4567   | alice.wonderland@email | 9876543210123456     | 200.00       |
      | Bob          | Marley      | 1975-02-06     | 333-999-8888   | bob.marley@email.com   | 5555555555555555     | 75.25        |



  Scenario Outline: Update Customer Information with Valid Email

    Given  customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | john.doe@email.com | 1234567890123456  | 100.50    |

    When customeris updated with the following details:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | UpdatedEmail | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890 | <NewEmail>   | 1234567890123456  | 100.50    |

    Then  And if the customer exists, the should validate the updated email format


  Scenario: Update Customer Information with Valid Bank Account Number

    Given a customer with the following details exists:
      | firstName | lastName | dateOfBirth | email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com | 3842927483        | 150.00    |

    When customeris updated with the following details:
      | firstName | lastName | dateOfBirth | email               | NewBankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | rachel.green@fs.com | 9876543210123456     | 150.00    |

    Then if the customer exists, the should validate the updated bank account number format
    And if the bank account number is valid, 'the  should successfully update the customer with'


  Scenario Outline: Update Customer Information with  Name, Surname, and Date of Birth

    Given customer with the following details exists:
      | firstName | lastName | dateOfBirth | PhoneNumber  | email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 3842927483        | 150.00    |

    When  the customer is updated with the following details:
      | firstName | lastName | dateOfBirth | PhoneNumber  | email               | BankAccountNumber | AmountDue |
      | Rachel    | Green    | 1990-01-01  | 123-456-7890 | rachel.green@fs.com | 3842927483        | 150.00    |
    Then 'Display error'


