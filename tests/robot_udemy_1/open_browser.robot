*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${LOGIN_URL}            https://www.google.com/
${SELENIUM_BROWSER}     chrome
${HEADLESS_MODE}        No


*** Test Cases ***
First Selenium Test
    [Documentation]    My first selenium test
    Open Browser    ${LOGIN_URL}    ${SELENIUM_BROWSER}    ${HEADLESS_MODE}
    Set Browser Implicit Wait    5
    Input Text    name:q    Automation Step By Step
    Press Keys    name:q    ENTER
    Sleep    2
    Log    Test Completed
    [Teardown]    Close Browser
