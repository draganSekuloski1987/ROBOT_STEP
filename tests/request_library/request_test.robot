*** Settings ***
Library     RequestsLibrary


*** Test Cases ***
Quick Get Request Test
    [Documentation]    get data
    ${response}=    GET    https://www.google.com
    Log    ${response}

Quick Get Request With Parameters
    [Documentation]    With parameters
    ${response}=    GET    https://www.google.com    params=query=ciao    expected_status=200
    Log    ${response}

Quick Get a JSON Body test
    [Documentation]    my test
    ${response}=    GET    https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1    ${response.json()}[id]
    Should Be Equal As Strings    1    ${response.json()}[userId]
    ${json}=    Set Variable    ${response.json()}
    Should Contain    ${json['title']}    sunt
