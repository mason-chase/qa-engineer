
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth

Scenario 1: Read a Customer
  Given the user is on the CRM solution
  When the user updates the customer with Email "john.doe@email.com" with the following details:
    | Firstname         | Lastname         | DateOfBirth   | PhoneNumber       | Email                    | BankAccountNumber       | AmoutnDue |
    | Jane              | Doe              | 1990-01-01    | +1234567890123    | jane.doe@email.com      | updated_bank_account    | 100       |
  Then the customer details should be successfully updated in the system



Scenario 2: Read a Customer which is not exist
  Given the user is on the CRM solution
  When the user tries to update a non-existent customer with Email "test@email.com"
  Then the system should display an error indicating that the customer does not exist



Scenario 3: Read a Customer
  Given the user is on the CRM solution
  When the user tries to update the customer's Email to an already existing Email "ssabadanaei@email.com"
  Then the system should display an error indicating that the Email is already in use
