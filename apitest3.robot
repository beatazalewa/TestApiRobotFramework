*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}           https://reqres.in/
${single_user_url}    api/users/2

*** Test Cases ***
GetSingleUser
    Create Session    session1    ${base_url}
    ${response}=    GET On Session    session1    ${single_user_url}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${response_body}=    Convert To String    ${response.content}
    Should Contain    ${response_body}    Janet

    ${content_type}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Contain    ${content_type}    application/json

