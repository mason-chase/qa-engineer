Feature: Credit Card Payments

  Background:
    Given the user is logged in to the platform with valid credentials

  Scenario: Successful Payment
    When the user enters valid credit card details
    And confirms the payment
    Then the system should process the payment successfully
    And the user should receive a confirmation of the successful payment
    And the AmountDue for the customer should be updated accordingly

  Scenario: Failed Payment
    When the user enters invalid credit card details
    And confirms the payment
    Then the system should display an error message indicating a failed payment
    And the user should receive a notification about the failed payment
    And the AmountDue for the customer should remain unchanged

  Scenario: Cancel Payment
    When user has initiated the payment process
    And the user decides to cancel the payment
    Then the system should prompt the user for confirmation
    When the user confirms the cancellation
    Then the payment process should be canceled
    And the user should see a confirmation message about the canceled payment
    And the AmountDue for the customer should remain unchanged

  Scenario: Delayed Payment
    When the user has initiated the payment process
    And there is a delay in processing the payment
    Then the system should display a message indicating the delay
    And the user should be informed about the delay and advised to wait
    And the AmountDue for the customer should remain unchanged

