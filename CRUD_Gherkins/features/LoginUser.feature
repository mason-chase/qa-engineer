
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth

Scenario 1: Successful user login
  Given a registered user wants to log in
  When they provide valid login credentials
  Then the user should be successfully logged in





Scenario 2: User login with incorrect credentials
  Given a registered user wants to log in
  When they provide incorrect login credentials
  Then the login should fail
  And an appropriate error message should be displayed

