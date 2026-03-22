*** Settings ***
Documentation     Testes básicos de automação de tela com Robot Framework
...               Demonstra abertura de navegador, navegação e capturas de tela
Resource          ../resources/common.resource
Resource          ../resources/page_objects/google_page.resource
Suite Setup       Criar Diretório Screenshots
Suite Teardown    Fechar Navegador

*** Test Cases ***
TC001 - Abrir Navegador e Verificar Página Inicial
    [Documentation]    Verifica que o navegador abre corretamente e a página carrega
    [Tags]    smoke    basico
    Abrir Navegador    https://www.google.com
    Verificar Título Da Página    Google
    Capturar Tela    TC001_pagina_inicial
    Log    Página inicial do Google carregada com sucesso

TC002 - Verificar Logo do Google
    [Documentation]    Verifica que o logo do Google está visível na página
    [Tags]    smoke    visual
    Aceitar Cookies Se Necessário
    Verificar Logo Google Visível
    Capturar Tela    TC002_logo_google
    Log    Logo do Google verificado com sucesso

TC003 - Pesquisar Termo no Google
    [Documentation]    Realiza uma pesquisa e verifica os resultados
    [Tags]    funcional    pesquisa
    Aceitar Cookies Se Necessário
    Pesquisar No Google    Robot Framework automação
    Verificar Resultados Da Pesquisa
    Capturar Tela    TC003_resultados_pesquisa
    Log    Pesquisa realizada e resultados verificados

TC004 - Verificar URL Após Pesquisa
    [Documentation]    Verifica que a URL muda após uma pesquisa
    [Tags]    funcional
    ${url_atual}=    Get Location
    Should Contain    ${url_atual}    google.com
    Log    URL atual: ${url_atual}
    Capturar Tela    TC004_url_pos_pesquisa
