*** Settings ***
Resource            ../resources/resources.robot
Test Setup          Open
Test Teardown       Close


*** Test Case ***


######## EVENTS ########
Scenario 11: Registering events arrival
  [Tags]    Events      low
  Give that I am logged in
  When I click on Add in/out
  And select activity Arrival
  And click on submit
  Then I will see the arrival time

Scenario 12: Registering events lunch out
  [Tags]    Events      low
  Give that I am logged in
  When I click on Add in/out
  And select activity Lunch Out
  And click on submit
  Then I will see the lunch out time

Scenario 13: Registering events lunch in
  [Tags]    Events      low
  Give that I am logged in
  When I click on Add in/out
  And select activity Lunch In
  And click on submit
  Then I will see the lunch in time

Scenario 14: Registering events exit
  [Tags]    Events      low
  Give that I am logged in
  When I click on Add in/out
  And select activity Exit
  And click on submit
  Then I will see the exit time

Scenario 15: Registering exit first
  [Tags]    Events      high
  Given I am at the register screen
  When I am registered
  And choose the activity Exit
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 16: Registering lunch in first
  [Tags]    Events      high
  Given I am at the register screen
  When I am registered
  And choose the activity Lunc In
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 17: Registering lunch out first
  [Tags]    Events      high
  Given I am at the register screen
  When I am registered
  And choose the activity Lunch Out
  Then receive notification 'PERMISSION_DENIED: Permission denied'

Scenario 18: Update event 'arrival' after all registered events
  [Tags]    Events      medium
  Give that I am logged in
  When record all events
  And record events Arrival again
  Then I will see the actual worked hours

Scenario 19: Display the balance of hours worked
  [Tags]    Events      low
  Given I am at the login screen
  When logging in a balanced user 'gabriel@gmail.com' and '123456'
  And I click on login
  Then I will see the actual worked hours
