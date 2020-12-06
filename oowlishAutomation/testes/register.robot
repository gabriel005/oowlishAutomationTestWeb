*** Settings ***
Resource            ../resources/resources.robot
Test Setup          Open
Test Teardown       Close


*** Test Case ***

######## ACCOUNTS ########
Scenario 05: Register user with any email
  [Tags]    Register      Critical
  Given I am at the login screen
  When I click on register
  And I fill all inputs '.com'
  And click on the register button
  Then you will be logged in

Scenario 06: Account already exist
  [Tags]    Register      low
  Given I am at the register screen
  When I fill all inputs exist
  And click on the register button
  Then receive notification 'The email address is already in use by another account.'

Scenario 07: Badly formatted email
  [Tags]    Register      medium
  Given I am at the login screen
  When I click on register
  And I fill all inputs 'nothing'
  And click on the register button
  Then receive notification 'The email address is badly formatted.'

Scenario 08: Password less than 6 characters
  [Tags]    Register      low
  Given I am at the register screen
  When insert a an email
  And a password less than 6 characters
  And click on the register button
  Then receive notification 'Password should be at least 6 characters'

Scenario 09: User different than user verification
  [Tags]    Register      high
  Given I am at the register screen
  When I insert a email different than email confirmation
  And fill passwords
  SeleniumLibrary.Capture Page Screenshot      user_different.png
  And click on the register button
  Then you will be logged in

Scenario 10: Password different than Password verification
  [Tags]    Register      high
  Given I am at the register screen
  When I insert a password different than password confirmation
  And fill emails
  SeleniumLibrary.Capture Page Screenshot      password_different.png
  And click on the register button
  Then you will be logged in
