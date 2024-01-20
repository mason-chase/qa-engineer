
# Manual Test Script for Credit Card Payment Scenarios

## Test Scenario: Successful Payment
### Objective: 
To verify that the payment process completes successfully with valid credit card details.

### Steps:
1. Log in with valid customer credentials.
2. Navigate to the payment section.
3. Enter valid credit card details and the amount due.
4. Submit the payment.
5. Verify that a success confirmation message is displayed.
6. Check if the AmountDue is updated accordingly in the customer's record.

### Expected Result: 
- Payment is processed successfully.
- A success message is displayed.
- Customer’s AmountDue is updated in the system.

## Test Scenario: Failed Payment
### Objective: 
To validate the system's response when the payment fails due to invalid credit card details.

### Steps:
1. Log in with valid customer credentials.
2. Navigate to the payment section.
3. Enter invalid credit card details (e.g., incorrect number).
4. Attempt to submit the payment.
5. Observe the response.

### Expected Result: 
- Payment is not processed.
- An error message regarding invalid credit card details is displayed.

## Test Scenario: Cancel Payment
### Objective: 
To ensure that customers can cancel the payment process before completion.

### Steps:
1. Log in with valid customer credentials.
2. Navigate to the payment section.
3. Enter credit card details.
4. Initiate the payment process.
5. Cancel the payment before submission.
6. Observe the response and check if the transaction is halted.

### Expected Result: 
- Payment process is canceled successfully.
- No changes are made to the customer's AmountDue.

## Test Scenario: Delayed Payment
### Objective: 
To test the system's behavior in case of a delayed payment response (e.g., due to network issues).

### Steps:
1. Log in with valid customer credentials.
2. Navigate to the payment section.
3. Enter credit card details and the amount due.
4. Submit the payment.
5. Simulate a delayed response (this might need coordination with the development team).
6. Observe the system's handling of the delay.

### Expected Result:
- The system should handle the delay gracefully.
- Appropriate message or status should be displayed to the user.
- The payment should either complete successfully or fail without causing issues in the system.
