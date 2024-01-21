Feature: Update a customer information
    Rule: user should be permitted to update information

        Scenario Outline: Successfully update a customer information
            Given user wants to update a customer information
            When user is in display customer page
            And user selects a customer's "<Field>" to update
            And user enters new value for "<Field>"
            Then the "<Field>" should be updated
            And the successful "<Field> is updated" should be displayed
            Examples:
                | Field             |
                | Firstname         |
                | Lastname          |
                | DateOfBirth       |
                | PhoneNumber       |
                | Email             |
                | BankAccountNumber |

        Scenario Outline: Failed update a customer information
            Given user wants to update a customer information
            When user is in display customer page
            And user selects a customer's "<Field>" to update
            And user enters new value for "<Field>"
            And the update is impossible for some reasons
            Then the message "Update is failed" should be displayed
            Examples:
                | Field             |
                | Firstname         |
                | Lastname          |
                | DateOfBirth       |
                | PhoneNumber       |
                | Email             |
                | BankAccountNumber |