*** Settings ***
Test Tags       sanity regression


*** Test Cases ***
Test 1 Log user
    [Documentation]    test
    [Tags]    -sanity    smoke
    Log    hello
    ${user}    Create Dictionary    name=Dragan    surname=Sekuloski
    Log    ${user["name"]} ${user["surname"]}

Test 2 Log user 2
    [Documentation]    test
    Log    hello
    ${user}    Create Dictionary    name=Ana    surname=Sekuloski
    Log    ${user["name"]} ${user["surname"]}

Test 3 Log user 3
    [Documentation]    test
    Log    hello
    ${user}    Create Dictionary    name=Jovanka    surname=Sekuloski
    Log    ${user["name"]} ${user["surname"]}
