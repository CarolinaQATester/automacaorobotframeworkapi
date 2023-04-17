*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         OperatingSystem



*** Variables ***

${base_url}         https://gorest.co.in/public/v2
${bearerToken}      Bearer  b7bdc0485c1046c5906b92d052bd56f906a9e3120ccfc9c80682958325668fb3



*** Test Cases ***
Post Request On Existing Session
    [Documentation]  Verificar se a sessão existe
    [Tags]    post
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json

    ##Requisição POST
    ${response}=  Post On Session   mysession  ${endpoint}  headers=${headers}  

    Status Should Be    OK    ${response}

Post Request Should Have Post Method
     [Documentation]  Verificar se está retornando o metodo corrego
    [Tags]    Post
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json

    ##Requisição POST
    ${response}=  Post On Session   mysession  ${endpoint}  headers=${headers}  
    ##Validacao
    Should Be Equal As Strings    ${response.json()}[method]    POST


Post Request With Json
    [Tags]    post
   
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ${body}=    Create Dictionary    name=teste de api com robotframework email=test123@teste123.com gender=male status=active"

    ##Requisição POST
    ${response}=  Post On Session   mysession  ${endpoint}  json=${body}  headers=${headers}  

    ##Validacao
    Status Should Be    OK    ${response}
    ${data}=    Evaluate    ${response.json()}[data]
    Dictionaries Should Be Equal    ${data}    ${body}

Post Request Create User

    [Documentation]    Criando usuario
    [Tags]  post
    Create Session   mysession  ${base_url} verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json

    ##Requisição POST
    ${response}=  Post On Session   mysession  ${endpoint}  json={"name": "teste de api com robotframework","email": "test123@teste123.com","gender": "male","status": "active"}  headers=${headers}  

    ##Requisição POST
    ${status_code}  convert to string  ${response.status_code}
    Should be Equal   ${status_code}    201

    ##Salvando a variável user_id, session globalmente para usar nos outros testes cases

    #Set Suite Variable                        ${user_id}        ${response.json()['user']}
    #Set Suite Variable                        ${session}        ${response.json()['session']}
    #Dictionaries Should Be Equal  

Post Request Expect An Error And Evaluate Response
    [Tags]    post
   
    Create Session   mysession  ${base_url} verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json

    ##Requisição POST
    ${response}=  Post On Session   mysession  ${endpoint} json={"name": "teste de api com robotframework","email": "test123@teste123.com","gender": "male","status": "active"}  headers=${headers}  
    Should be Equal   ${status_code}    422
    Should Be Equal As Strings    has already been taken    ${response.reason}

   
