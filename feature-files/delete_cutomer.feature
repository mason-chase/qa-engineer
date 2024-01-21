Feature: Delete cutomers / a customer
    Rule: user should be permitted to delete a customer

        Scenario Outline: Successfully delete a  customer
            Given user wants to delete a customer 
            When user deletes the customer with the "<Firstname>","<Lastname>", "<Email>"
            Then successful message "A Customer with <Firstname> and <Lastname> and <Email> is deleted" should be displayed
            Examples:
                | Firstname | Lastname | Email                |
                | Mehdi     | Mojaradi | m.mojaradi@gmail.com |

        Scenario Outline: Failed delete a customer
            Given user wants to delete a customer information
            And user selects a customer's "<Firstname>","<Lastname>", "<Email>" to delete
            And the delete is impossible for some reasons
            Then the message "deletion is failed" should be displayed
            Examples:
                | Firstname | Lastname | Email                |
                | John     | Lennon | john.lennon@email.com |

