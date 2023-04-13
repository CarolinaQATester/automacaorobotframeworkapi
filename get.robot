*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem



*** Variables ***

${base_url}         https://gorest.co.in/public/v2
${bearerToken}      Bearer  b7bdc0485c1046c5906b92d052bd56f906a9e3120ccfc9c80682958325668fb3


*** Test Cases ***
Get_BuscarTodosOsUsuarios

    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ${response}=  Get On Session   mysession  ${endpoint}   headers=${headers}

    log to console  ${response.headers}
    log to console  ${response.status_code} 
    log to console  ${response.content}

    #validacao
     ${status_code}=  convert to string   ${response.status_code} 
     Should Be Equal    ${status_code}  200

    ${res_body}=  convert to string      ${response.content}

   
