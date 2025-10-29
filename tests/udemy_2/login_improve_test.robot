*** Settings ***
Documentation       Validate login page

Resource            base.resource

Suite Setup         Set Selenium Timeout    15
Test Setup          Open Browser    ${MY_URL}    chrome
Test Teardown       Close All Browsers


*** Variables ***
# Valid user
${USER_NAME}            rahulshettyacademy
${VALID_PASSWORD}       learning
# invalid user
${INVALID_USERNAME}     test@test.com
${INVALID_PASSWORD}     pass


*** Test Cases ***
Validate UnSuccesfull Login
    [Documentation]    Icorecct User and password given to check the error message
    Populate And Submit Login Form    ${USER_NAME}    ${INVALID_PASSWORD}
    Validate Error Message    Incorrect username/password.

Validate Succesfull Login
    [Documentation]    Icorecct User and password given to check the error message
    Populate And Submit Login Form    ${USER_NAME}    ${VALID_PASSWORD}
    Shop Page Is Displayed


*** Keywords ***
Populate And Submit Login Form
    [Documentation]    Populate input login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    name:password    ${password}
    Click Button    id:signInBtn

Shop Page Is Displayed
    [Documentation]    Not needed :D
    Wait Until Element Is Visible    css:.navbar-fixed-top .nav-link
