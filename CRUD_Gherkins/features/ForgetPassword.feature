
Requirements:
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number --> Assuming that we use an API to set the country code
- Customers are unique by Email --> Email should have the specific format (XXXX@mail.com) (gmail, yahoo, ...)
- Customers are also unique by FirstName, LastName and DateOfBirth

Scenario 1: Successful password recovery
  Given a user has forgotten their password
  When they request a password recovery
  Then they should receive an email with password reset instructions



Scenario 2: Password recovery with invalid email
  Given a new user wants to register
  When they provide an invalid email address
  Then the registration should fail
  And an appropriate error message should be displayed
