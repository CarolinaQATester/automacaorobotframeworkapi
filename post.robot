*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         OperatingSystem



*** Variables ***

${base_url}         https://gorest.co.in/public/v2
${bearerToken}      Bearer  b7bdc0485c1046c5906b92d052bd56f906a9e3120ccfc9c80682958325668fb3


*** Test Cases ***
Criar um usuario valido

    [Tags]  post
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ${response}=  Post On Session   mysession  ${endpoint}  data={"name": "teste de api com robotframework","email": "teste12345@teste123.com","gender": "male","status": "active"}  headers=${headers}

    log to console  ${response.headers}
    log to console  ${response.status_code} 
    log to console  ${response.content}

    #validacao
     ${status_code}=  convert to string   ${response.status_code} 
     Should Be Equal    ${status_code}  201

    ${res_body}=  convert to string      ${response.content}


   
