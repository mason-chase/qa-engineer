
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth




Scenario 1: Create a Customer with correct information
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaei@gmail.com      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system


Scenario 2: Create a Customer with incorrect information --> Wrong phone number,number of digit is incorrect
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 910461668    | ssabadanaei@gmail.com      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system


Scenario 3: Create a Customer with incorrect information --> Wrong email format, missing @
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaeigmail.com      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system


Scenario 4: Create a Customer with incorrect information --> Wrong email format, missing "."
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaei@gmailcom      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system


Scenario 5: Create a Customer with incorrect information --> Wrong email format, missing "com"
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaei@gmail.      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system


Scenario 6: Create a Customer with incorrect information --> Wrong email format, missing "com"
  Given the user is on the CRM solution
  When the user creates a new customer with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaei@gmail.      | A_Valid_Bank_Account  | 100         |
  Then the customer should be successfully created in the system



Scenario 7: Create a Customer with existing information
  Given the user is on the CRM solution
  When the user tries to create a customer with the same Email "ssabadanaei@gmail.com"
  Then the system should display an error indicating that the Email is already in use



Scenario 8: Create a Customer with incorrect information --> Wrong BankAccountNumber
  Given the user is on the CRM solution
  When the user tries to create a customer with an invalid BankAccountNumber
  Then the system should display an error indicating that the BankAccountNumber is invalid