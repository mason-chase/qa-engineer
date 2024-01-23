
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth

Scenario 1: Update a Customer
  Given the user is on the CRM solution
  When the user updates the customer with Email "ssabadanaei@gmail.com" with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Saba              | Danaei              | 1995-05-09    | 9104616683    | ssabadanaei@gmail.com      | A_Valid_Bank_Account  | 100         |
  Then the customer details should be successfully updated in the system



Scenario 2: Update a Customer
  Given the user is on the CRM solution
  When the user tries to retrieve a non-existent customer with Email "test@email.com"
  Then the system should display an error indicating that the customer does not exist
