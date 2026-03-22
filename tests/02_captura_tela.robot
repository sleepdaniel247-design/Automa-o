*** Settings ***
Documentation     Testes focados em captura e verificação de tela
...               Demonstra o uso avançado de screenshots
Resource          ../resources/common.resource
Suite Setup       Inicializar Suite
Suite Teardown    Fechar Navegador

*** Variables ***
${URL_TESTE}    https://www.google.com

*** Keywords ***
Inicializar Suite
    Criar Diretório Screenshots
    Abrir Navegador    ${URL_TESTE}

*** Test Cases ***
TC005 - Captura de Tela Completa
    [Documentation]    Tira screenshot da tela completa
    [Tags]    screenshot    visual
    ${arquivo}=    Capturar Tela    TC005_tela_completa
    File Should Exist    ${arquivo}
    Log    Screenshot salvo em: ${arquivo}

TC006 - Captura de Elemento Específico
    [Documentation]    Captura screenshot de um elemento específico
    [Tags]    screenshot    elemento
    ${elemento}=    Get WebElement    xpath://body
    Capture Element Screenshot    ${elemento}    results/screenshots/TC006_elemento.png
    File Should Exist    results/screenshots/TC006_elemento.png
    Log    Screenshot do elemento salvo

TC007 - Verificar Dimensões da Janela
    [Documentation]    Verifica as dimensões da janela do navegador
    [Tags]    janela    visual
    ${tamanho}=    Get Window Size
    Log    Largura: ${tamanho}[0]    console=True
    Log    Altura: ${tamanho}[1]    console=True
    Should Be True    ${tamanho}[0] > 0
    Should Be True    ${tamanho}[1] > 0
    Capturar Tela    TC007_dimensoes_janela

TC008 - Scroll e Captura
    [Documentation]    Realiza scroll na página e captura screenshots
    [Tags]    scroll    visual
    Go To    ${URL_TESTE}
    Capturar Tela    TC008_topo_pagina
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Capturar Tela    TC008_rodape_pagina
    Execute Javascript    window.scrollTo(0, 0)
    Log    Scroll e capturas realizados com sucesso

TC009 - Múltiplas Capturas Durante Interação
    [Documentation]    Captura tela em diferentes momentos de uma interação
    [Tags]    screenshot    interacao
    Go To    ${URL_TESTE}
    Capturar Tela    TC009_01_antes_digitar
    ${campo}=    Set Variable    name:q
    Wait Until Element Is Visible    ${campo}
    Input Text    ${campo}    Robot Framework
    Capturar Tela    TC009_02_durante_digitacao
    Press Keys    ${campo}    RETURN
    Sleep    2s
    Capturar Tela    TC009_03_apos_pesquisa
    Log    Fluxo de múltiplas capturas concluído
