Feature: Create a new customer
    Rule: user should be permitted to create a new customer
                """
                Bank account number must be valid according to PO's criteria
                Phone Number must be a valid mobile number
                Email, Firstname, Lastname and DateOfBirth must be unique
                """
        Scenario Outline: Successfully create a new customer
            Given user wants to create a new customer with the "<Firstname>","<Lastname>", "<DateOfBirth>", "<PhoneNumber>", "<Email>"
            And user wants to create bank account "<BankAccountNumber>", "<AmountDue>"
            When user saves the new customer
            Then successful message "A new customer is created" should be displayed
            Examples:
                | Firstname | Lastname | DateOfBirth | PhoneNumber  | Email                | BankAccountNumber | AmountDue |
                | Mehdi     | Mojaradi | 1980        | 989133035319 | m.mojaradi@gmail.com | 357159852         | 2024-02-01       |

        Scenario Outline: Failed create a new customer with a empty field
            Given user wants to create a new customer with an empty "<Field>"
            When user saves the new customer
            Then failing message "<Field> is empty" should be displayed'
            Examples:
                | Field             |
                | Firstname         |
                | Lastname          |
                | DateOfBirth       |
                | PhoneNumber       |
                | Email             |
                | BankAccountNumber |
                | AmountDue         |

        Scenario Outline: Failed create a new customer with a dulicated field
            Given user wants to create a new customer with a dulicated "<Field>"
            When user saves the new customer
            Then failing message "<Field> is duplicate" should be displayed'
            Examples:
                | Field       |
                | Firstname   |
                | Lastname    |
                | DateOfBirth |
                | Email       |

        Scenario Outline: Failed create a new customer with an invalid field
            Given user wants to create a new customer with an invalid "<Field>"
            When user saves the new customer
            Then failing message "<Field> is invalid" should be displayed'
            Examples:
                | Field             |
                | PhoneNumber       |
                | BankAccountNumber |
