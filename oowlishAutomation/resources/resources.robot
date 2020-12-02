*** Settings ***
Library             SeleniumLibrary
Library             String

*** Variables ***
${BROWSER}    chrome
${URL}        https://supertracker-app.herokuapp.com/login


*** Keywords ***
#### Setup e Teardown
Open
  Open Browser     about:blank   ${BROWSER}


#Close browser
#  Close Browser


### Ações
Given I am at the login screen
  Go To   ${URL}
  wait until Element is Visible   css=#root > div.app.d-flex.flex-column > main > div > form > h1
  Title Should Be   Login | SuperTracker

Give that I am logged in
  Given I am at the login screen
  When insert a valid email and a valid password
  And I click on login
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div[1]/div/div/button
  Title Should Be                   Timesheet | SuperTracker

Given I am at the register screen
  Given I am at the login screen
  When I click on register




When insert a an email
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div/form
  Element Text Should Be            xpath=//*[@class="h3 mb-3 text-center font-weight-normal"]    Create your account
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input Text                        xpath=//*[@id="authEmail"]                    ${EMAIL}@oolish.com
  Input Text                        xpath=//*[@id="authConfirmEmail"]             ${EMAIL}@oolish.com

When insert an email and a password
  insert an email
  insert a password

When insert a valid email and a password
  insert a valid email
  insert a password

When insert a valid email and a valid password
  insert a valid email
  insert a valid password

When I click on register
  Click Element    xpath=//*[@id="responsive-navbar-nav"]/div/a[2]

When I fill all inputs exist
  Set Test Variable                 ${EMAIL}                                      gabriel
  Input Text                        xpath=//*[@id="authEmail"]                    ${EMAIL}@oowlish.com
  Input Text                        xpath=//*[@id="authConfirmEmail"]             ${EMAIL}@oowlish.com
  Set Test Variable                 ${PASSWORD}                                   123456
  Input Text                        xpath=//*[@id="authPassword"]                 ${PASSWORD}
  Input Text                        xpath=//*[@id="authConfirmPassword"]          ${PASSWORD}

When I click on Add in/out
  Click Button    xpath=//*[@id="root"]/div[1]/main/div[1]/div/div/button

When I am logged in
  When I fill all inputs exist
  When I click on register

When I am registered
  And I fill all inputs '.com'
  And click on the register button

When record all events
  Then you will be logged in
  When I click on Add in/out
  And select activity Arrival
  And click on submit
  When I click on Add in/out
  And select activity Lunch Out
  And click on submit
  When I click on Add in/out
  And select activity Lunch In
  And click on submit
  When I click on Add in/out
  And select activity Exit
  And click on submit

When I insert a email different than email confirmation
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div/form
  Element Text Should Be            xpath=//*[@class="h3 mb-3 text-center font-weight-normal"]    Create your account
  insert an email
  insert confirmation email

When I insert a password different than password confirmation
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div/form
  Element Text Should Be            xpath=//*[@class="h3 mb-3 text-center font-weight-normal"]    Create your account
  insert a password
  insert a confirmation password




And I click on login
  Click Button    xpath=//*[@id="root"]/div[1]/main/div/form/button

And I fill all inputs '${.COM}'
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div/form
  Element Text Should Be            xpath=//*[@class="h3 mb-3 text-center font-weight-normal"]    Create your account
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input Text                        xpath=//*[@id="authEmail"]                    ${EMAIL}@${EMAIL}${.COM}
  Input Text                        xpath=//*[@id="authConfirmEmail"]             ${EMAIL}@${EMAIL}${.COM}
  ${PASSWORD}                       Generate Random String
  Set Test Variable                 ${PASSWORD}
  Input Text                        xpath=//*[@id="authPassword"]                 ${PASSWORD}
  Input Text                        xpath=//*[@id="authConfirmPassword"]          ${PASSWORD}

And fill passwords
  ${PASSWORD}                       Generate Random String
  Set Test Variable                 ${PASSWORD}
  Input text                        xpath=//*[@id="authPassword"]           ${PASSWORD}
  Input text                        xpath=//*[@id="authConfirmPassword"]     ${PASSWORD}

And fill emails
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input Text                        xpath=//*[@id="authEmail"]                    ${EMAIL}@${EMAIL}.com
  Input Text                        xpath=//*[@id="authConfirmEmail"]             ${EMAIL}@${EMAIL}.com


And click on the register button
  Click Button    xpath=//*[@id="root"]/div[1]/main/div/form/button

And select activity Arrival
  Click Element    xpath=//*[@id="formBasicEmail"]/option[1]

And select activity Lunch Out
  Click Element    xpath=//*[@id="formBasicEmail"]/option[2]

And select activity Lunch In
  Click Element    xpath=//*[@id="formBasicEmail"]/option[3]

And select activity Exit
  Click Element    xpath=//*[@id="formBasicEmail"]/option[4]

And click on submit
  Click Button    xpath=//html/body/div[3]/div/div/div[2]/form/div[2]/button

And choose the activity Exit
  Then you will be logged in
  When I click on Add in/out
  And select activity Exit
  And click on submit

And choose the activity Lunc In
  Then you will be logged in
  When I click on Add in/out
  And select activity Lunch In
  And click on submit

And record events Arrival again
  When I click on Add in/out
  And select activity Arrival
  And click on submit

And choose the activity Lunch Out
  Then you will be logged in
  When I click on Add in/out
  And select activity Lunch Out
  And click on submit

And a password less than 6 characters
  Input text                        xpath=//*[@id="authPassword"]                 123
  Input Text                        xpath=//*[@id="authConfirmPassword"]          123

And I try to login many times
  Repeat Keyword    6x    Login many times

Login many times
  Click Button                      xpath=//*[@id="root"]/div[1]/main/div/form/button
  Sleep                     3s


insert an email
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input text                        xpath=//*[@id="authEmail"]              ${EMAIL}@oowlish.com

insert confirmation email
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input Text                        xpath=//*[@id="authConfirmEmail"]       ${EMAIL}@oowlish.com

insert a password
  ${PASSWORD}                       Generate Random String
  Set Test Variable                 ${PASSWORD}
  Input text                        xpath=//*[@id="authPassword"]           ${PASSWORD}

insert a confirmation password
  ${PASSWORD}                       Generate Random String
  Set Test Variable                 ${PASSWORD}
  Input text                        xpath=//*[@id="authConfirmPassword"]     ${PASSWORD}

insert a valid email
  Set Test Variable                 ${EMAIL}                        gabriel@oowlish.com
  Input text                        xpath=//*[@id="authEmail"]      ${EMAIL}


insert a valid password
  Set Test Variable                 ${PASSWORD}                     123456
  Input text                        xpath=//*[@id="authPassword"]   ${PASSWORD}






### Conferências

Then receive notification '${MSG}'
  wait until Element is Visible     xpath=//*[@class="Toastify__toast-body"]
  Element Text Should Be            xpath=//*[@class="Toastify__toast-body"]        ${MSG}

Then you will be logged in
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div[1]/div/div/button
  wait until Element is Visible     xpath=//*[@id="root"]/div[1]/main/div[2]/div/div/div[1]
  Title Should Be                   Timesheet | SuperTracker

Then I will see the arrival time
  wait until Element is Visible   xpath=//*[@id="root"]/div[1]/main/div[1]/div/table/tbody/tr[1]/td[3]

Then I will see the lunch out time
  wait until Element is Visible   xpath=//*[@id="root"]/div[1]/main/div[1]/div/table/tbody/tr[2]/td[3]

Then I will see the lunch in time
  wait until Element is Visible   xpath=//*[@id="root"]/div[1]/main/div[1]/div/table/tbody/tr[3]/td[3]

Then I will see the exit time
  wait until Element is Visible   xpath=//*[@id="root"]/div[1]/main/div[1]/div/table/tbody/tr[4]/td[3]

Then I will see the actual worked hours
  wait until Element is Visible   xpath=//*[@id="root"]/div[1]/main/div[2]/div/div/div[1]
