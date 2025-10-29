*** Settings ***
Library    Browser
Suite Setup    New Browser    chromium    No

*** Test Cases ***
Has title
    New Page    https://playwright.dev/
    Get Title    contains    Playwright
    Take Screenshot
    Close Page

Get Started Link
    New Page    https://playwright.dev/
    ${element}=    Get Element By Role    LINK    name=Get started
    Click    ${element}
    ${heading}=    Get Element By Role    HEADING    name=Installation
    Get Element States    ${heading}    contains    visible
    Take Screenshot
    Close Page

Get Started Link [Alternative]
    New Page    https://playwright.dev/
    Click    a >> "Get started"
    Get Element States    h1 >> "Installation"    contains    visible
    Close Page

Playwrite test
    New Page    https://playwright.dev/
    Get Title    matches    Playwright
    Get Attribute    "Get started"    href    ==    /docs/intro
    Click    "Get started"
    Get Url    matches    .*intro
    Close Page 