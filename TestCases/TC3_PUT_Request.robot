*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in
${userId}   2

*** Test Cases ***
Update_userInfo
    create session    mysession     ${base_url}
    ${body}=    create dictionary       name=dev    job=zion resident
    ${header}=  create dictionary    Content-Type=application/jsson
    ${response}=    put request    mysession    /api/users/${userId}    data=${body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${res_code}=       convert to string    ${response.status_code}
    should be equal    ${res_code}      200