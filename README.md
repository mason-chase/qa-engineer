# QA Engineer CRUD Test 

Please read each note very carefully!

Your team is building a simple CRM solution for an operator that needs CRUD operation based on below customer model:
```
Customer {
	Firstname
	Lastname
	DateOfBirth
	PhoneNumber
	Email
	BankAccountNumber
  AmoutnDue
}
```

Your job as QA engineer is to create test script and scenario before the work begins and verify that with product owner,
You are then assigned a task to make sure automated testing and manual testings are made and delivered after product owner approved delivered
based on "definition of done".

## Automated Testing Script

- Gherkins format for for testing each CRUD operation (Create, Read, Update, Delete).
- Bank account number must be valid according to product owner's criteria.
- Phone Number must be a valid mobile number
- Customers are unique by Email
- Customers are also unique by FirstName, LastName and DateOfBirth
  
## Manual Test Script

Assuming platform customer has its credential to make payment for `AmountDue`,
Create test script for user credit card payment scenarios for:
1. Successful payment
2. Failed payment
3. Cancel payment
4. Delayed payment


### Acceptance Criteria
Define clear and concise acceptance criteria for each functionality of the application. This should cover:
Validations for each field (phone number, email, bank account number).
Uniqueness constraints for customer records.

### Delivery (Must)
- Please clone this repository in a new github repository in private mode and share with ID: `mason-chase` in private mode on github.com, make sure you do not erase my commits and then create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) (code review).
- Clean git commits that shows your work progress.

## Nice to do:
- Create a CRUD application using your fluent language and framework.
