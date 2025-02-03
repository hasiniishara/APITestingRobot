*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in
${userId}   2

*** Test Cases ***
Delete_user
    create session    mysession     ${base_url}
    ${response}=    delete request    mysession     /api/users/${userId}
    log to console    ${response.status_code}
    log to console    ${response.content}