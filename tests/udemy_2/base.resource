*** Settings ***
Documentation       A resiurce file with reusable keywords and variables.
...                 And more.

Library             SeleniumLibrary


*** Variables ***
${MY_URL}       https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
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
