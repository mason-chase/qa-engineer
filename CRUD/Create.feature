Feature: Customer Create Operation
  the goal for this feature is to ensure that creating a unique customer can be achived and when-
  the creation process faces an issue in the process then correct erorr handling must be showed. 
  Bank account number must be valid (14 digits).
  Phone Number must be a valid mobile number and all the phone numbers must be covered in the CRM-
  system to ensure that every valid PhoneNumber will be accepted.
  all customers must have a unique email other wise duplication or invalid error message must be shown.
  Customers must be unique by FirstName, LastName and DateOfBirth if a customer has duplicate in one or two fields then the user can be created.

 Background: 
    Given the operator is loggedin the CRM page
    And the operator is creating a customer

  Scenario:  Create a new customer successfully  
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmoutnDue |
      | Mohammad    | shirmohammady  | 23-06-1996     | +989377690068   | mhd.shd702@gmail.com        | 35194682576458     | 1000      |
    Then the customer must be created successfully.

  Scenario Outline: Create a new customer with 2 duplicated fields in Firstname, Lastname and DateOfBirth.
    When the operator inserts the customer data with unique fields in mind except "<DuplicatedField1>" and "<DuplicatedField2>"
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmoutnDue |
      | Mahmud      | shirmohammady  | 23-06-1996     | +989121233456   | mahmud.shd802@gmail.com     | 84621654942135     | 500       |
      | Mohammad    | hashemi        | 23-06-1996     | +989131233456   | mahdi.shd902@gmail.com      | 64978563135223     | 20        |
      | Mohammad    | hashemi        | 23-06-2003     | +989131643456   | mhd.shd902@gmail.com        | 32156876878542     | 0         |
    Then the customer must be created even though the customer has a duplicate "<DuplicatedField1>" and "<DuplicatedField2>".

    Examples:
      | DuplicatedField1   | DuplicatedField2   |
      | Lastname           | DateOfBirth        |
      | Firstname          | DateOfBirth        |
      | Firstname          | Lastname           |

  Scenario: Attempt to create a duplicate Customer
    When the operator inserts valid customer data that already exists
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      | Mohammad    | shirmohammady  | 23-06-1996     | +989377690068   | mhd.shd702@gmail.com        | 35194682576458     | 1000      |
    Then an error message must be displayed indicating this customer already exists and the customer must not be created.

  Scenario: Attemp to create a Customer with duplicate Firstname, Lastname and DateOfBirth
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      | Mohammad    | shirmohammady  | 23-06-1996     | +989302154987   | mh.sh123@mail.com           | 88794635147165     | 20000     |
    Then an error message must be displayed indicating that this FirstName,LastName and DateOfBirth already exists and the user must not be created.

    Scenario: Attemp to create a Customer with duplicate PhoneNumber
    When the operator inserts valid customer data
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      | navid       | sadeghpour     | 13-09-1996     | +989377690068   | navid.sadeghpour@mail.com   | 95175365485213     | 90000     |
    Then the customer must be created.

    Scenario: Attemp to create a Customer with Invalid PhoneNumber
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber     | Email                       | BankAccountNumber  | AmountDue |
      | mahsa       | zarin          | 13-09-1996     | +6542*/-.       | mahsa.zarin@mail.com        | 98574321654984     | 648       |
    Then an erorr message must be displayed indicating that the PhoneNumber is Invalid and the user must not be created.

    Scenario: Attemp to create a Customer with Invalid BankAccountNumber 
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber       | Email                     | BankAccountNumber  | AmountDue |
      | marjan      | sarin          | 13-09-2000     | +989648945315     | marjan.sarin@mail.com     | */-545981..        | 123       |
    Then an erorr message must be displayed indicating that the BankAccountNumber is Invalid and the user must not be created.

    Scenario: Attemp to create a Customer with Duplicate BankAccountNumber 
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber       | Email                     | BankAccountNumber  | AmountDue |
      | sarvin      | ghaed          | 13-09-2001     | +988754612384     | sarvin.ghaed@mail.com     | 11111111111111     | 951       |
    Then the customer must be created.

    Scenario: Attemp to create a Customer with Duplicate Email 
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber       | Email                     | BankAccountNumber  | AmountDue |
      | ali         | sharif         | 13-09-1990     | +956135481233     | mhd.shd702@gmail.com      | 65843113594984     | 357       |
    Then an error must be displayed indicating that this email already exists.

    Scenario: Attemp to create a Customer with Invalid Email 
    When the operator inserts valid customer data 
      | Firstname   | Lastname       | DateOfBirth    | PhoneNumber       | Email                     | BankAccountNumber  | AmountDue |
      | ali         | sharif         | 13-09-1990     | +956135481233     | 123qwerty                 | 65843113594984     | 159       |
    Then an error must be displayed indicating that this email is invalid and the customer must not be created.

