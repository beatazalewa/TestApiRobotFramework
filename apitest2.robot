*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}    https://reqres.in/
${page}        api/users?page=2

*** Test Cases ***
GetAllUsers
    Create Session    session1    ${base_url}
    ${response}=    GET On Session    session1    ${page}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${response_body}=    Convert To String    ${response.content}
    Should Contain    ${response_body}    lindsay.ferguson@reqres.in

    ${content_type}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Contain    ${content_type}    application/json

