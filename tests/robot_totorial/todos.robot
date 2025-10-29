*** Settings ***
Library         Collections
Library         Browser

Suite Setup     New Browser    ${BROWSER}    ${HEADLESS}
Test Setup      New Page    ${URL}
# Test Setup    New Page    https://todomvc.com/examples/emberjs/todomvc/dist/


*** Variables ***
${URL}          https://todomvc.com/examples/emberjs/todomvc/dist/
${BROWSER}      chromium
${HEADLESS}     Yes


*** Test Cases ***
Simple Todo
    [Documentation]    Test documentation
    Add Todo    Feed the cat
    Add Todo    Walk the dog
    Take Screenshot
    Get Text    .todo-count    contains    2
    Click    "Feed the cat" >> .. >> input.toggle
    VAR    ${count}    1
    Check Item Count    ${count}
    Get Style    "Feed the cat"    text-decoration    *=    line-through
    Close Page

Add A List Of Todos
    [Documentation]    Test documentation
    VAR    @{items}    Bread    Butter    Milk
    FOR    ${i}    IN    @{items}
        Add Todo    ${i}
    END
    Check Item Count    count=3
    Append To List    ${items}    Flowers
    Add Todo    Get From List${items}
    ${item}    Get From List    list_=${items}    index=-1
    Add Todo    ${item}
    Close Page


*** Keywords ***
Add Todo
    [Documentation]    Keyword documentation
    [Arguments]    ${text}
    Fill Text    .new-todo    ${text}
    Press Keys    .new-todo    Enter

Check Item Count
    [Documentation]    Keyword documentation
    [Arguments]    ${count}
    Get Text    .todo-count    matches    ${count} items? left*
