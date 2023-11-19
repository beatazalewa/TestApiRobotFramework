*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}                 https://reqres.in/
${create_single_user}       api/users


*** Test Cases ***
CreateSingleUser
    Create Session    session1    ${base_url}
    ${body}=    Create Dictionary    name=Beata    job=SupremeLeader
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    session1    ${create_single_user}    data=${body} headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Validations
    ${status}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status}    201



