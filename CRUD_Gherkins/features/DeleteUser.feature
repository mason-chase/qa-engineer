
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth


Scenario 1: Delete a Customer
  Given the user is on the CRM solution
  When the user deletes the customer with Email "john.doe@email.com"
  Then the customer should be successfully deleted from the system



Scenario 2: Delete a Customer
  Given the user is on the CRM solution
  When the user tries to delete a non-existent customer with Email "test@email.com"
  Then the system should display an error indicating that the customer does not exist

