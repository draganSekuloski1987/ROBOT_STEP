*** Settings ***
Library         Collections
Library         RequestsLibrary

Suite Setup     Autenticate As Admin


*** Variables ***
${BASE}         https://restful-booker.herokuapp.com
&{AUTH_BODY}    username=admin    password=password123
${ID}           None
${TOKEN}        None


*** Test Cases ***
Get Booking from Restful Booker
    [Documentation]    Some api
    ${body}    Create Dictionary    firstname=John
    ${response}    GET    ${BASE}/booking    ${body}
    Status Should Be    200

    # Turn the JSON (a list) into a Robot List varable and iterate items
    @{bookings}    Set Variable    ${response.json()}
    Log List    ${bookings}

    FOR    ${b}    IN    @{bookings}
        ${id}    Set Variable    ${b}[bookingid]
        ${detail}    GET    ${BASE}/booking/${id}

        # Guard against 404s in the wild sandbox
        IF    ${detail.status_code} == 200
            Log    ${detail.json()}
        ELSE
            Log    Skipping id ${id} (status ${detail.status_code})
        END
    END

Create Booking
    [Documentation]    Try to make second api calls
    &{booking_dates}    Create Dictionary    checkin=2025-12-31    checkout=2026-01-01
    ${price}    Convert To Integer    199
    &{body}    Create Dictionary
    ...    firstname=Dragan
    ...    lastname=Sekuloski
    ...    totalprice=${price}
    ...    depositpaid=${False}
    ...    bookingdates=${booking_dates}

    ${post_response}    POST    url=${BASE}/booking    json=${body}
    Status Should Be    200    ${post_response}
    ${post_json}    Set Variable    ${post_response.json()}
    ${ID}    Set Variable    ${post_json['bookingid']}
    Set Suite Variable    ${ID}

    ${get_response}    GET    ${BASE}/booking/${ID}
    Status Should Be    200    ${get_response}
    ${get_json}    Set Variable    ${get_response.json()}

    Dictionary Should Contain Value    ${get_json}    Dragan
    Should Be Equal    ${get_json['firstname']}    Dragan
    Should Be Equal    ${get_json['lastname']}    Sekuloski
    Should Be Equal As Numbers    ${get_json['totalprice']}    199

Delete Booking
    [Documentation]    Delete created booking
    ${header}    Create Dictionary    Cookie=token\=${TOKEN}
    ${response}    DELETE    ${BASE}/booking/${ID}    headers=${header}
    Status Should Be    201



*** Keywords ***
Autenticate As Admin
    [Documentation]    Try to make api calls
    ${response}    POST    ${BASE}/auth    json=${AUTH_BODY}
    Status Should Be    200    ${response}

    ${json}    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    token

    ${TOKEN}    Set Variable    ${json['token']}
    Log    Token:${TOKEN}
    Set Suite Variable    ${TOKEN}
