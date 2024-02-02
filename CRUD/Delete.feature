Feature: Customer Delete Operation
  The goal for this feature is to ensure that deleting customer data is performed correctly, and appropriate error handling is in place.
  Deletation process must only occur on be half of location the Customer by Email, (FirstName, LastName and DateOfBirth as theese are uniqe together) and CustomerID as these fields are uniqe
  and we can make sure that only one of them is in the system
  
  Background:
    Given the operator is logged in the CRM Delete page
    And there are existing customers in the system

  Scenario Outline: Attempt to delete customer data by email
    Given the operator attempts to delete customer data with an email
      | Email                       |
      | <EmailValue>                |
    Then the system should return <ExpectedResult>.

    Examples:
      | EmailValue                     | ExpectedResult                                                 |
      | mhd.shd702@gmail.com           | The customer data  deleted successfully.                       |
      | invalid.email@mail.com         | An error message indicating that the email is not found.       |
      | non.existent.email@mail.com    | An error message indicating that the customer does not exist.  |



  Scenario Outline: Attempt to delete customer data with FirstName, LastName, and DateOfBirth
    Given the operator attempts to delete customer data with details
      | FirstName           | LastName           | DateOfBirth         |
      | <FirstNameValue>    | <LastNameValue>    | <DateOfBirthValue>  |
    Then a message must indicate that <DeletionStatus>.

    Examples:
      | FirstNameValue     | LastNameValue      | DateOfBirthValue   | DeletionStatus                                                                                      |
      | parisa             | emami              | 01-01-1988         | the existent Customer mut be deleted successfully.                                                  |
      | lkjlks             | test               | 01-01-1950         | the FirstName, LastName, and DateOfBirth of the customer is invalid, and no user must be deleted.   |
      | NonExistent        | Customer           | 04-04-2005         | the FirstName, LastName, and DateOfBirth of the customer is NonExistent and no user must be deleted.|
     

  Scenario Outline: Attempt to delete customer data with a customer ID
    assuming that the customer gets assigned a unique ID in the table it's stored
    When the operator attempts to delete customer data with a customer ID
      | CustomerID            |
      | <ValidCustomerID>     |
      | <InvalidCustomerID>   |
      | <NonExistentCustomerID>|
    Then the system must return <ExpectedResult>.

    Examples:
      | CustomerID          | ExpectedResult                                                                       |
      | 1                   | The system must Delete customer's details successfully and it                        |
      | abcdefg             | The system must return an error message indicating an invalid customer ID.           |
      | 9999                | The system must return an error message indicating that the customer does not exist. |
