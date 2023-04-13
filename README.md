# automacaorobotframeworkapi

### Introdução:
<p align = "justify">
Em API Automation using Robot Framework, usaremos várias bibliotecas python como Request Library, Json Library, Collections, etc. Essas são várias ferramentas usadas para executar operações em aplicativos da web. 
</p>

### Pré-requisitos: 
Instalar Robot Framework  
Biblioteca de solicitação de instalação 
Adicione RobotFramework-Requests, RobotFramework-Json e RobotFramework-SeleniumLibrary no painel do projeto do seu IDE.

### Instalação:

Verifique a versão do pip $ pip –version >> pip 20.0.2  
Instale o RobotFramework $ pip instale o robotframework 
Instale a biblioteca request usando o seguinte comando: $ pip install requests 

### Sintaxe:

${response}= entrar na sessão SessionName URL header=${header} 

${response}= postar na sessão SessionName URL header=${header} 

${response}= colocar na sessão SessionName URL header=${header} 

${response}= excluir na sessão SessionName URL header=${header} 

