Feature: Show customers / a customer information
    Rule: user should be permitted to read information

        Scenario Outline: Successfully show all customers information
            Given user wants to see all customers information
            When user is in display customer page
            Then a table with the "<Field>" should be displayed
            And this table should be sortable and filterable
            Examples:
                | Field             |
                | Firstname         |
                | Lastname          |
                | DateOfBirth       |
                | PhoneNumber       |
                | Email             |
                | BankAccountNumber |
                | AmountDue         |

        Scenario Outline: Successfully show a specific customers information
            Given user wants to see a customer information with its "<Firstname>","<Lasstname>","<Email>"
            When user is in display customer page
            And  user types the customer's "<Firstname>" or "<Lasstname>" or "<Email>" in a search field
            Then a table related to the customer should be displayed
            And this table should be sortable and filterable
            Examples:
                | Firstname | Lastname | Email                |
                | Mehdi     | Mojaradi | m.mojaradi@gmail.com |

        Scenario Outline: Failed show a specific customers information
            Given user wants to see a non-existing customer information with its "<Firstname>","<Lasstname>","<Email>"
            When user is in display customer page
            And  user types the customer's "<Firstname>" or "<Lasstname>" or "<Email>" in a search field
            Then the message "Cutomer does not exist" should be displayed
            Examples:
                | Firstname | Lastname | Email                 |
                | John      | Lennon   | john.lennon@email.com |
