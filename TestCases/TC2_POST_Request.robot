*** Settings ***
Library     RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://reqres.in

*** Test Cases ***
Post_userRegistration
    create session    mysession     ${base_url}
    ${body}=    create dictionary    name=hasini    job=Test Automation Engineer
    ${header}=  create dictionary    Content-Type=application/jsson
    ${response}=    post request    mysession       /api/users      data=${body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${res_code}=    convert to string   ${response.status_code}
    should be equal     ${res_code}    201