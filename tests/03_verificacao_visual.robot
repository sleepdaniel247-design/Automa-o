*** Settings ***
Documentation     Testes de verificação visual de elementos na tela
...               Valida presença, visibilidade e estado de elementos
Resource          ../resources/common.resource
Suite Setup       Inicializar Suite Verificacao
Suite Teardown    Fechar Navegador

*** Keywords ***
Inicializar Suite Verificacao
    Criar Diretório Screenshots
    Abrir Navegador    https://www.google.com

*** Test Cases ***
TC010 - Verificar Elementos na Página Inicial do Google
    [Documentation]    Verifica todos os elementos principais da página inicial
    [Tags]    visual    smoke
    Go To    https://www.google.com
    # Verifica campo de pesquisa
    Verificar Elemento Visível    name:q
    # Verifica que a página carregou
    ${titulo}=    Get Title
    Should Not Be Empty    ${titulo}
    Capturar Tela    TC010_elementos_pagina_inicial
    Log    Todos os elementos principais verificados

TC011 - Verificar Texto na Página
    [Documentation]    Verifica a presença de texto na página
    [Tags]    visual    texto
    Go To    https://www.google.com
    ${conteudo}=    Get Text    xpath://body
    Should Not Be Empty    ${conteudo}
    Capturar Tela    TC011_texto_pagina
    Log    Conteúdo de texto verificado

TC012 - Verificar Responsividade
    [Documentation]    Verifica a página em diferentes tamanhos de tela
    [Tags]    responsivo    visual
    # Desktop
    Set Window Size    1920    1080
    Go To    https://www.google.com
    Capturar Tela    TC012_desktop_1920x1080

    # Laptop
    Set Window Size    1366    768
    Reload Page
    Capturar Tela    TC012_laptop_1366x768

    # Tablet
    Set Window Size    768    1024
    Reload Page
    Capturar Tela    TC012_tablet_768x1024

    Log    Testes de responsividade concluídos

TC013 - Verificar Estado dos Elementos
    [Documentation]    Verifica o estado (habilitado/desabilitado) dos elementos
    [Tags]    estado    visual
    Go To    https://www.google.com
    ${campo}=    Get WebElement    name:q
    Element Should Be Enabled    ${campo}
    Capturar Tela    TC013_estado_elementos
    Log    Estado dos elementos verificado

TC014 - Verificar Atributos de Elementos
    [Documentation]    Verifica atributos HTML de elementos
    [Tags]    atributos    visual
    Go To    https://www.google.com
    ${campo_pesquisa}=    Get WebElement    name:q
    ${tipo}=    Get Element Attribute    name:q    type
    Log    Tipo do campo de pesquisa: ${tipo}
    Capturar Tela    TC014_atributos_elementos
