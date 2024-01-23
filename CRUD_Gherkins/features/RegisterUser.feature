
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth

Scenario 1: Successful user registration
  Given a new user wants to register
  When they provide valid registration information
  Then the user should be successfully registered
  And they should receive a confirmation email




Scenario 2: User registration with invalid email
  Given a new user wants to register
  When they provide an invalid email address
  Then the registration should fail
  And an error message should be displayed
