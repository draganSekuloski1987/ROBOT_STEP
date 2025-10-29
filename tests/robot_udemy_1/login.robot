*** Settings ***
Library             SeleniumLibrary

Suite Setup         Open Browser    ${LOGIN_URL}    ${SELENIUM_BROWSER}    ${HEADLESS_MODE}
Suite Teardown      Close All Browsers
Test Setup          Set Selenium Timeout    15


*** Variables ***
${LOGIN_URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${SELENIUM_BROWSER}     chrome
${HEADLESS_MODE}        No
@{CREDENTIALS}          Admin    admin123
&{LOGIN_DATA}           username=Admin    password=admin123


*** Test Cases ***
Dictionary credentials login
    [Documentation]    Login test
    Login    ${LOGIN_DATA}[username]    ${LOGIN_DATA}[password]
    Sleep    5
    Location Should Contain    dashboard/index
    Click Element    class:oxd-userdropdown-name
    Wait Until Element Is Visible    css:a[href*=logout]
    Click Link    link:Logout
    Visible Element Should Contain    class:orangehrm-login-title    Login

List Credentials Login
    [Documentation]    Login test
    Login    ${CREDENTIALS}[0]    ${CREDENTIALS}[1]
    Sleep    5
    Location Should Contain    dashboard/index
    Click Element    class:oxd-userdropdown-name
    Wait Until Element Is Visible    css:a[href*=logout]
    Click Link    link:Logout
    Visible Element Should Contain    class:orangehrm-login-title    Login


*** Keywords ***
Visible Element Should Contain
    [Documentation]    Keyword documentation
    [Arguments]    ${selector}    ${text}
    Wait Until Element Is Visible    ${selector}
    Element Should Contain    ${selector}    ${text}

Login
    [Documentation]    Keyword documentation
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    name:username
    Input Text    name:username    ${username}
    Input Password    name:password    ${password}
    Click Button    css:button[type="submit"]
