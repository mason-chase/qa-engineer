
# Acceptance Criteria for CRM Application

## General Criteria:
- All functionalities should meet the requirements as specified.
- The system should handle data securely and ensure user privacy.

## Validations:
1. **Phone Number Validation:**
   - The phone number must be in a valid format (e.g., country code followed by number).
   - It should only contain numbers and permissible symbols (like +, -).
   - The system should reject invalid phone numbers with an appropriate error message.

2. **Email Validation:**
   - Email addresses must follow standard email formatting (e.g., user@example.com).
   - The system should check for the presence of '@' and '.' in the correct positions.
   - Invalid email addresses should not be accepted, and an error message should be displayed.

3. **Bank Account Number Validation:**
   - The bank account number must meet the criteria set by the product owner (e.g., specific length, numeric only).
   - It should be validated against a standard or algorithm if provided.
   - Invalid bank account numbers should not be accepted, and an error message should be displayed.

## Uniqueness Constraints:
1. **Unique by Email:**
   - No two customers can have the same email address.
   - Attempting to create or update a customer with an email that already exists should result in an error.

2. **Unique by Combination of Firstname, Lastname, and DateOfBirth:**
   - A combination of Firstname, Lastname, and DateOfBirth must be unique for each customer.
   - The system should prevent the creation of duplicate records based on these three fields.

## Customer Record Management:
- The system should allow creation, reading, updating, and deletion of customer records following the specified rules and validations.
- All changes should be correctly reflected in the database.
- The user interface should be intuitive and user-friendly.

By adhering to these acceptance criteria, the application will ensure data integrity, provide a good user experience, and meet the business requirements.
