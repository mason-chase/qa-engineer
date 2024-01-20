
Feature: Customer Management for CRM Solution

  # Scenario: Create a New Customer
  Scenario: Successfully creating a new customer
    Given I am an authorized user
    When I submit a new customer with valid details
      | Firstname | Lastname | DateOfBirth | PhoneNumber   | Email                | BankAccountNumber | AmountDue |
      | John      | Doe      | 1990-01-01  | 123-456-7890  | john.doe@example.com | 1234567890        | 100.00    |
    Then the customer should be successfully created in the system

  Scenario: Create a customer with invalid email format
    Given I am an authorized user
    When I submit a new customer with an invalid email format
      | Email           |
      | john.doe@.com   |
    Then I should receive an error message about invalid email format

  # Scenario: Read Customer Information
  Scenario: Successfully retrieving a customer's details
    Given I am an authorized user
    And a customer with email "john.doe@example.com" exists
    When I request the details for customer with email "john.doe@example.com"
    Then I should receive the customer's details

  # Scenario: Update Existing Customer
  Scenario: Successfully updating a customer's details
    Given I am an authorized user
    And a customer with email "john.doe@example.com" exists
    When I update the customer's phone number to "987-654-3210"
    Then the customer's phone number should be updated in the system

  Scenario: Updating a customer with invalid bank account number
    Given I am an authorized user
    And a customer with email "john.doe@example.com" exists
    When I update the customer's bank account number to "invalid123"
    Then I should receive an error message about invalid bank account number

  # Scenario: Delete a Customer
  Scenario: Successfully deleting a customer
    Given I am an authorized user
    And a customer with email "john.doe@example.com" exists
    When I delete the customer with email "john.doe@example.com"
    Then the customer should no longer exist in the system
