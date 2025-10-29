*** Settings ***
Library         Browser

Suite Setup     New Browser    ${SPEC_BROWSER}    ${SPEC_HEADLESS}
Test Setup      New Page    ${SPEC_URL}


*** Variables ***
${SPEC_URL}         http://robotframework.org
${SPEC_BROWSER}     chromium
${SPEC_HEADLESS}    No


*** Test Cases ***
Veryfy Foundation Link
    [Documentation]    Test doc
    Click    .navbar >> a[href="/foundation"]
    Get Title    should be    Foundation | Robot Framework
    Get Url    equal    https://robotframework.org/
