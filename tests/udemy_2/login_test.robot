*** Settings ***
Documentation       Validate login page

Library             SeleniumLibrary

Suite Setup         Open Browser    ${MY_URL}    chrome
Test Setup          Set Selenium Timeout    15
Test Teardown       Close All Browsers


*** Variables ***
${MY_URL}       https://rahulshettyacademy.com/loginpagePractise/


*** Test Cases ***
Validate UnSuccesfull Login
    [Documentation]    Icorecct User and password given to check the error message
    Populate And Submit Login Form    test@test.com    pass
    Validate Error Message    Incorrect username/password.


*** Keywords ***
Populate And Submit Login Form
    [Documentation]    Populate input login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    name:password    ${password}
    Click Button    id:signInBtn

Validate Error Message
    [Documentation]    Error message check
    [Arguments]    ${message}
    VAR    ${error_locator}    css:form .alert-danger
    Wait Until Element Is Visible    ${error_locator}
    Element Text Should Be
    ...    ${error_locator}
    ...    ${message}
    ...    message=Wrong error message present
    ...    ignore_case=True
