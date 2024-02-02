Feature: Customer Update Operation
  The goal for this feature is to ensure that updating customer data is performed correctly, and appropriate error handling is in place.
  with the consideration that AmountDue can't be updated by the operator

  Background:
    customer can also be located by FirstName, LastName and DateOfBirth
    Given the operator is logged in the CRM Update page
    And there are existing customers in the system

  Scenario: Update customer data successfully
    Given the customer is located based on email("mhd.shd702@gmail.com") 
    When the operator updates customer data with valid parameters
      | FirstName     | LastName        | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      | Aidin         | Shahmoradi      | 05-09-1993     | +985621348786   | aidin.Shahmoradi@gmail.com  | 11223344556699     | 10        |
    Then the customer data should be updated successfully.

  Scenario Outline: Attempt to Update customer data with valid details
    Given the customer is located based on email("aidin.Shahmoradi@gmail.com")
    When the operator updates customer data with valid details
      | FirstName          | LastName          | DateOfBirth          | PhoneNumber          | Email                  | BankAccountNumber          | AmountDue |
      | <FirstNameValue>   | <LastNameValue>   | <DateOfBirthValue>   | <PhoneNumberValue>   | <EmailValue>           | <BankAccountNumberValue>   | 500       |
    Then the system must return an error message indicating <SuccessMessage> and customer must be updated.

    Examples:
      | FirstNameValue    | LastNameValue    | DateOfBirthValue    | PhoneNumberValue    | EmailValue                   | BankAccountNumberValue    | SuccessMessage                                                          |
      | morteza           | Shahmoradi       | 05-09-1993          | +989485464655       | aidin.Shahmoradi@gmail.com   | 11223344556699            | success message must be shown and only FirstName must be updated        |
      | morteza           | shahvandi        | 05-09-1993          | +989485464655       | aidin.Shahmoradi@gmail.com   | 11223344556699            | success message must be shown and only LastName must be updated.        |
      | morteza           | shahvandi        | 01-01-2001          | +989485464655       | aidin.Shahmoradi@gmail.com   | 11223344556699            | success message must be shown and only DateOfBirth must be updated      |
      | morteza           | shahvandi        | 01-01-2001          | +989485464875       | aidin.Shahmoradi@gmail.com   | 11223344556699            | success message must be shown and only PhoneNumber must be updated      |
      | morteza           | shahvandi        | 01-01-2001          | +989485464875       | morteza.shahvandi@mail.com   | 11223344556699            | success message must be shown and only Email must be updated            |
      | morteza           | shahvandi        | 01-01-2001          | +989485464875       | morteza.shahvandi@mail.com   | 46587621513549            | success message must be shown and only BankAccountNumber must be updated|  

  Scenario Outline: Attempt to Update customer data with invalid details
    Given the customer is located based on email("morteza.shahvandi@mail.com")
    When the operator updates customer data with invalid details
      | FirstName          | LastName          | DateOfBirth          | PhoneNumber          | Email                  | BankAccountNumber          | AmountDue |
      | <FirstNameValue>   | <LastNameValue>   | <DateOfBirthValue>   | <PhoneNumberValue>   | <EmailValue>           | <BankAccountNumberValue>   | 500       |
    Then the system must return an error message indicating <ErrorMessage> and customer must not be updated.

    Examples:
      | FirstNameValue    | LastNameValue    | DateOfBirthValue    | PhoneNumberValue    | EmailValue             | BankAccountNumberValue    | ErrorMessage                                          |
      | /*132             | akbari           | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | FirstName is invalid and customer must not be updated.|
      | majid             |                  | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | LastName is invalid customer must not be updated.     |
      | majid             | akbari           | 99-99-9999          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | DateOfBirth is invalid customer must not be updated.  |
      | majid             | akbari           | 01-01-2000          | 846546*465454       | majid.akbari@mail.com  | 12345478491634            | PhoneNumber is customer must not be updated.          |
      | majid             | akbari           | 01-01-2000          | +989485464655       | majid.akbari           | 12345478491634            | Email is customer must not be updated.                |
      | majid             | akbari           | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 546547879                 | BankAccountNumnber is customer must not be updated.   |

  Scenario: Attempt to update customer data with a duplicate email
    Given the customer is located based on another email that exists
    When the operator attempts to update customer data with a duplicate email
      |Email                      |   
      |morteza.shahvandi@mail.com |  
    Then an error message should be displayed indicating that the email already exists.

  Scenario: Attempt to update customer data with a duplicate Firstname, Lastname, Dateofbirth
    Given the customer is located based on another email that exists
    When the operator attempts to update customer data with a duplicate email
      | FirstName         | LastName         | DateOfBirth         |
      | morteza           | shahvandi        | 01-01-2001          |
    Then an error message should be displayed indicating that this FirstName, LastName, DateOfBirth already exists.

  Scenario: Attempt to update customer data with a cellphone that already exists
    Given the customer is located based on another email that exists
    When the operator attempts to update customer data with a cellphone that already exists
      | PhoneNumber                     |   
      | +989485464875                   |  
    Then Success Message must be shown as it is not a unique field.

  Scenario: Attempt to update customer data with a BankAccountNumber that already exists
    Given the customer is located based on another email that exists
    When the operator attempts to update customer data with a BankAccountNumber that already exists
      |BankAccountNumber       |   
      |46587621513549          |  
    Then Success Message must be shown as it is not a unique field.
