*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in
${userId}       2

*** Test Cases ***
Get_userInfor
    create session    mysession  ${base_url}
    ${response}     get request    mysession    /api/users/${userId}
    log to console    ${response.status_code}
    log to console    ${response.content}
    log to console    ${response.headers}
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200
