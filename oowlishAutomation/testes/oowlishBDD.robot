*** Settings ***
Resource            ../resources/resources.robot
Test Setup          Open
#Test Teardown       Close browser


*** Test Case ***

######## ACCOUNTS ########
Scenario 01: Invalid login
  Given I am at the login screen
  When insert an email and a password
  And I click on login
  Then receive notification 'There is no user record corresponding to this identifier. The user may have been deleted.'

Scenario 02: Invalid password
  Given I am at the login screen
  When insert a valid email and a password
  And I click on login
  Then receive notification 'The password is invalid or the user does not have a password.'

Scenario 03: Login success
  Given I am at the login screen
  When insert a valid email and a valid password
  And I click on login
  Then you will be logged in

Scenario 04: Register user with any email
  Given I am at the login screen
  When I click on register
  And I fill all inputs '.com'
  And click on the register button
  Then you will be logged in

Scenario 05: Account already exist
  Given I am at the register screen
  When I fill all inputs exist
  And click on the register button
  Then receive notification 'The email address is already in use by another account.'

Scenario 06: Badly formatted email
  Given I am at the login screen
  When I click on register
  And I fill all inputs 'nothing'
  And click on the register button
  Then receive notification 'The email address is badly formatted.'

Scenario 07: Password less than 6 characters
  Given I am at the register screen
  When insert a an email
  And a password less than 6 characters
  And click on the register button
  Then receive notification 'Password should be at least 6 characters'

Scenario 08: User different than user verification
  Given I am at the register screen
  When I insert a email different than email confirmation
  And fill passwords
  And click on the register button
  Then you will be logged in

Scenario 09: Password different than Password verification
  Given I am at the register screen
  When I insert a password different than password confirmation
  And fill emails
  And click on the register button
  Then you will be logged in

Scenario 10: Many logins failed
  Given I am at the login screen
  When insert a valid email and a password
  And I try to login many times
  Then receive notification 'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.'




######## EVENTS ########
Scenario 11: Registering events arrival
  Give that I am logged in
  When I click on Add in/out
  And select activity Arrival
  And click on submit
  Then I will see the arrival time

Scenario 12: Registering events lunch out
  Give that I am logged in
  When I click on Add in/out
  And select activity Lunch Out
  And click on submit
  Then I will see the lunch out time

Scenario 13: Registering events lunch in
  Give that I am logged in
  When I click on Add in/out
  And select activity Lunch In
  And click on submit
  Then I will see the lunch in time

Scenario 14: Registering events exit
    Give that I am logged in
    When I click on Add in/out
    And select activity Exit
    And click on submit
    Then I will see the exit time

Scenario 15: Registering exit first
  Given I am at the register screen
  When I am registered
  And choose the activity Exit
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 16: Registering lunch in first
  Given I am at the register screen
  When I am registered
  And choose the activity Lunc In
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 17: Registering lunch out first
  Given I am at the register screen
  When I am registered
  And choose the activity Lunch Out
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 18: Update event 'arrival' after all registered events
  Give that I am logged in
  When record all events
  And record events Arrival again
  Then I will see the actual worked hours
