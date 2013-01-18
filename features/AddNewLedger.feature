Feature: Add New Ledger to System
   I need the ability to add new Ledgers to the system when
   a new account needs to be tracked

   Scenario: Add New Ledger
      When I run `ledgeradd bill 'Test Account'`
      Then the output should contain exactly:
        """
        Account Created Successfully

        """

   Scenario: Ledger Add responds to help
      When I run "ledgeradd -h"
      Then the output should contain:
         """
         Usage:
         """

   Scenario: Ledger Add responsd to version
      When I run "ledgeradd -v"
      Then the output should contain:
      """
      ledgeradd 1.0
      """
