*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem



*** Variables ***

${base_url}         https://gorest.co.in/public/v2
${bearerToken}      Bearer  b7bdc0485c1046c5906b92d052bd56f906a9e3120ccfc9c80682958325668fb3


*** Test Cases ***
Obter pedido sobre a sessão existente
    [Tags]    get
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ##Requisição Get
    ${response}=  GET On Session   mysession  ${endpoint}   headers=${headers}
    #validação
    Status Should Be    200    ${response}
    Should Be Equal As Strings  OK  ${response.reason}

Obter pedido deve ter obtido método

    [Tags]    get
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ##Requisição Get
    ${response}=  GET On Session   mysession  ${endpoint}   headers=${headers}
    #validação
    #Should Be Equal As Strings    ${response.json()}[method]    GET
Obter Pedido Com Url Params Como Dicionário
    [Tags]    get
    Create Session   mysession  ${base_url}  verify=true
    ${endpoint}  Set Variable   /users
    ${headers}=  Create dictionary    Authorization=${bearerToken}  Content-Type=application/json
    ${params}=    Create Dictionary    param1=981617    
    ##Requisição Get
    ${response}=  GET On Session   mysession  ${endpoint}   headers=${headers}
    #validação
   
    Status Should Be    200    ${response}
    #Dictionaries Should Be Equal    ${params}    ${response.json()}[args]

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

   
