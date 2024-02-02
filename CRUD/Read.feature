Feature: Customer Read Operation
  The goal for this feature is to ensure that when reading customer data is performed correctly the customer data be shown, and appropriate error handling is in place when its occurs.
  
  Background:
    Given the operator is logged in the CRM search page
    And there are existing customers in the system

  Scenario: Read an existing customer successfully
    When the operator requests the customer data for a valid customer
      |FirstName   | LastName       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      |Mohammad    | Shirmohammady  | 23-06-1996     | +989377690068   | mhd.shd702@gmail.com        | 35194682576458     | 1000      |
    Then the system must return the customer details successfully.

  Scenario: Attempt to read a non-existing customer
    When the operator requests the customer data for a non-existing customer by specifying unique details
      | FirstName      | LastName   | DateOfBirth    | PhoneNumber     | Email                      | BankAccountNumber  | AmountDue |
      | NonExistent    | Customer   | 01-01-2000     | +741234569878   | nonexistent.user@email.com | 123412341234123    | 0         |
    Then the system must return an error message indicating that the customer does not exist.   

  Scenario Outline: Attempt to read customer data with invalid details
    When the operator requests customer data with invalid details
      | FirstName          | LastName          | DateOfBirth          | PhoneNumber          | Email                  | BankAccountNumber          | AmountDue |
      | <FirstNameValue>   | <LastNameValue>   | <DateOfBirthValue>   | <PhoneNumberValue>   | <EmailValue>           | <BankAccountNumberValue>   | 500       |
    Then the system must return an error message indicating <ErrorMessage> and no user must show up.

    Examples:
      | FirstNameValue    | LastNameValue    | DateOfBirthValue    | PhoneNumberValue    | EmailValue             | BankAccountNumberValue    | ErrorMessage                                           |
      | /*132             | akbari           | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | FirstName is invalid and no user must show up.         |
      | majid             |                  | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | LastName is invalid and no user must show up.          |
      | majid             | akbari           | 99-99-9999          | +989485464655       | majid.akbari@mail.com  | 12345478491634            | DateOfBirth is invalid and no user must show up.       |
      | majid             | akbari           | 01-01-2000          | 846546*465454       | majid.akbari@mail.com  | 12345478491634            | PhoneNumber is invalid and no user must show up.       |
      | majid             | akbari           | 01-01-2000          | +989485464655       | majid.akbari           | 12345478491634            | Email is invalid and no user must show up.             |
      | majid             | akbari           | 01-01-2000          | +989485464655       | majid.akbari@mail.com  | 546547879                 | BankAccountNumnber is invalid and no user must show up.|

   
  Scenario: Attempt to read customer data with invalid fields
    When the operator requests customer data with invalid details
      | FirstName    | LastName       | DateOfBirth    | PhoneNumber       | Email                  | BankAccountNumber  | AmountDue |
      | /*132        | 654            | 99-99-9999     | +9891*2456/89     | invalidmail            | 1234s68#90123.     |           |
    Then the system must return an error message indicating all fields are invalid and no user must show up.     

  Scenario: Attempt to read customer data without specifying details
    this Scenario is highly dependent on the system as such it can be impelemented like when operator navigates to this page all the customers be shown by deafult but i approached it-
    that the operator has to add info to get the Customer details in mind
    When the operator requests customer data without specifying any details
    Then the system must return an error message indicating that customer details are required for the request.

  Scenario Outline: Attempt to read customer data with a customer ID
    assuming that the customer gets assigned a uniqe id in the table its stored
    When the operator requests customer data with a customer ID
      | CustomerID  |
      | <ValidCustomerID>   |
      | <InvalidCustomerID> |
      | <NonExistentCustomerID> |
    Then the system must return <ExpectedResult>.

    Examples:
      | ValidCustomerID     | ExpectedResult                                                                       |
      | 1                   | The system must return customer details successfully.                                |
      | abcdefg             | The system must return an error message indicating an invalid customer ID.           |
      | 9999                | The system must return an error message indicating that the customer does not exist. |
 
  Scenario: Search for customer data by PhoneNumber
    When the operator searches for customer data using a specific phone number
      | PhoneNumber       |
      | +989377690068     |
    Then the system must return the details of all customers with the specified phone number, as it is not a unique field. 

  Scenario: Search for customer data by BankAccountNumber
    When the operator searches for customer data using a specific BankAccountNumber
      | BankAccountNumber  |
      | 35194682576458     |
    Then the system must return the details of all customers with the specified BankAccountNumber, as it is not a unique field.

  Scenario: Search for customer data by FirstName, LastName, and DateOfBirth
    When the operator searches for customer data using specific FirstName, LastName, and DateOfBirth
      | FirstName   | LastName       | DateOfBirth    |
      | Mohammad    | Shirmohammady  | 23-06-1996     |
    Then the system must return the details of customers with the specified FirstName, LastName, and DateOfBirth if not, a message must indicated that this customer does not exist.

  Scenario: Search for customer data by Email
    When the operator searches for customer data using a specific Email
      | Email                       |
      | mhd.shd702@gmail.com        |
    Then the system must return the details of customers with the specified Email if not, a message must indicated that this customer does not exist.