*** Settings ***
Library             SeleniumLibrary

# TS set up - will run once before test suite
Suite Setup         Log    I am inside Test suite setup
# TS tear down will run once after test suite
Suite Teardown      Log    I am inside Test suite Teardown
# TC setup - will run before each test
Test Setup          Log    I am insde the Test Setup
# TC teardown - will run after each test
Test Teardown       Log    I am insde the Case Teardown

Test Tags           regression


*** Variables ***
${LOGIN_URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${SELENIUM_BROWSER}     chrome
${HEADLESS_MODE}        No
&{LOGIN_DATA}           username=Admin    password=admin123


*** Test Cases ***
Dictionary credentials login 1
    [Documentation]    Login test
    Open Browser    ${LOGIN_URL}    ${SELENIUM_BROWSER}    ${HEADLESS_MODE}
    Set Browser Implicit Wait    5
    Login    ${LOGIN_DATA}[username]    ${LOGIN_DATA}[password]
    Close Browser

Dictionary credentials login 2
    [Documentation]    Login test
    Open Browser    ${LOGIN_URL}    ${SELENIUM_BROWSER}    ${HEADLESS_MODE}
    Set Browser Implicit Wait    5
    Login    ${LOGIN_DATA}[username]    ${LOGIN_DATA}[password]
    Close Browser


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
