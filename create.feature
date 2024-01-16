Feature: Create Customer

  Scenario: WITH ALL REQUIRED FIELDS IS SUCCESSFUL

    Given user wants to create a customer with the following attributes
      | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john.smith@customer.com | 09334566575 | 1000000121314     | 1000      |

    When user creates the new customer 'WITH ALL REQUIRED FIELDS'
    Then the create 'IS SUCCESSFUL'


  Background:
    Given user wants to create a customer with the following attributes
      | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john.smith@customer.com | 09334566575 | 1000000121314     | 1000      |

    When the create 'IS SUCCESSFUL'

  Scenario: SHOW DUPLACATE EMAIL ERROR

    Given user wants to create a customer with the following attributes
      | firstName | lastName | dateOfBirth | email              | phoneNumber | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john2@customer.com | 0933334567  | 1000000122214     | 2000      |

    When user creates the new customer 'WITH ALL REQUIRED FIELDS'
    Then the create 'Faild for duplicating'

  Scenario: ERROR DISPLY WHEN THE "fristName", "LastName" and "DateOfBirth" FIELDS ARE THE duplicated

    Given user wants to create a customer with the following attributes
      | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john.smith@customer.com | 09334566575 | 1000000121314     | 1000      |

    When The fields are filled and an error is displayed if 'the fields are duplicated'
    Then 'Display the error to the Customer'

  Scenario: THE MPBILE  NUMBER IS   UNACCEPTABLE

    Given
      | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john.smith@customer.com | 7000048888  | 1000000121314     | 1000      |

    When Enter the information and the mobile number is not acceptable, 'the error is displayed'
    Then the create 'FAILS'

  Scenario: THE LENGTH OF THE MOBILE NUMBER MUST BE 11 AND MUST BE IN A VALID FORMAT

    Given user wants to create a customer with the following attributes
      | firstName | lastName | dateOfBirth | email                   | phoneNumber        | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | john.smith@customer.com | e.g., ###-###-#### | 1000000121314     | 1000      |

    When user creates the new customer 'WITH ALL REQUIRED FIELDS'
    Then the create 'IS SUCCESSFUL'


  Scenario:  EMAILMUST BE IN A VALID FORMAT

    Given  user wants to create a customer with the following attributes

    When 'a new customer' is added with the following details:
      | firstName | lastName | dateOfBirth | email          | phoneNumber        | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | invalid.email@ | e.g., ###-###-#### | 1000000121314     | 1000      |

    Then should display an error message indicating that the email must be in a valid format
  'And the new customer should not be created'


  Scenario: VALIDATE BANK ACCOUNT  NUMBER FORMAT

    Given user wants to create a customer with the following attributes

    When  'a new customer' is added with the following details:
      | firstName | lastName | dateOfBirth | email          | phoneNumber        | bankAccountNumber        | amoutnDue |
      | John      | Smith    | 2000-01-01  | invalid.email@ | e.g., ###-###-#### | invalidBankAccountNumber | 1000      |

    Then should display an error message indicating that the bank account number must be in a valid format (e.g., 10 numbers)
  'And the new customer should not be created'


  Scenario: THE CUSTOMER SHOULD NOT HAVE A COMBINAION OF EMAIL AND ACCOUNT NUMBER

    Given Enter client information

    When a customer with the following details already exists:
      | firstName | lastName | dateOfBirth | email          | phoneNumber  | bankAccountNumber | amoutnDue |
      | John      | Smith    | 2000-01-01  | invalid.email@ | 111-222-3333 | 1234567890123456  | 1000      |

    And  And a new customer is added with the following details:
      | firstName | lastName | dateOfBirth | email              | phoneNumber  | bankAccountNumber | amoutnDue |
      | John      | Doe      | 1990-01-01  | existing@email.com | 123-456-7890 | 7890123456789012  | 2000      |

    Then should display an error message indicating that the combination of email and bank account number must be unique
    And 'the new customer should not be created'
