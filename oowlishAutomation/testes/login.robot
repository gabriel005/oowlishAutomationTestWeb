*** Settings ***
Resource            ../resources/resources.robot
Test Setup          Open
Test Teardown       Close



*** Test Case ***

######## ACCOUNTS ########
Scenario 01: Invalid login
  [Tags]    Login     low
  Given I am at the login screen
  When insert an 'email' and a 'password'
  And I click on login
  Then receive notification 'There is no user record corresponding to this identifier. The user may have been deleted.'

Scenario 02: Invalid password
  [Tags]    Login     low
  Given I am at the login screen
  When insert an 'gabriel' and a 'password'
  And I click on login
  Then receive notification 'The password is invalid or the user does not have a password.'

Scenario 03: Login success
  [Tags]    Login     high
  Given I am at the login screen
  When insert an 'gabriel' and a '123456'
  And I click on login
  Then you will be logged in

Scenario 04: Many logins failed
  [Tags]    Login       low
  Given I am at the login screen
  When insert an 'teste' and a 'password'
  And I try to login many times
  Then receive notification 'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.'
