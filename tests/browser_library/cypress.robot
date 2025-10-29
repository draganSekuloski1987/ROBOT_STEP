*** Settings ***
Library         Browser

Suite Setup     New Browser    chromium    No


*** Test Cases ***
My First Test
    [Documentation]    Gets, types and asserts
    New Page    https://example.cypress.io/
    Click    "type"
    Get Url    *=    /commands/actions
    Type Text    .action-email    fake@email.com
    Get Text    [id="email1"]    ==    fake@email.com
    Take Screenshot
    Close Page
