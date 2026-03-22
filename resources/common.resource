*** Settings ***
Library     SeleniumLibrary
Library     ScreenCapLibrary
Library     OperatingSystem
Library     String
Library     Collections

*** Variables ***
${BROWSER}          chrome
${BASE_URL}         https://www.google.com
${TIMEOUT}          10s
${IMPLICIT_WAIT}    5s
${SCREENSHOTS_DIR}  results/screenshots

*** Keywords ***
Abrir Navegador
    [Documentation]    Abre o navegador e maximiza a janela
    [Arguments]    ${url}=${BASE_URL}    ${browser}=${BROWSER}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Timeout    ${TIMEOUT}

Fechar Navegador
    [Documentation]    Fecha o navegador
    Close All Browsers

Capturar Tela
    [Documentation]    Tira screenshot com nome descritivo
    [Arguments]    ${nome}=screenshot
    ${timestamp}=    Get Time    epoch
    ${arquivo}=    Set Variable    ${SCREENSHOTS_DIR}/${nome}_${timestamp}.png
    Capture Page Screenshot    ${arquivo}
    [Return]    ${arquivo}

Verificar Elemento Visível
    [Documentation]    Verifica se um elemento está visível na tela
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Element Should Be Visible    ${locator}

Aguardar E Clicar
    [Documentation]    Aguarda elemento ficar clicável e clica
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Click Element    ${locator}

Aguardar E Digitar
    [Documentation]    Aguarda campo e digita texto
    [Arguments]    ${locator}    ${texto}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${texto}

Verificar Título Da Página
    [Documentation]    Verifica o título da página
    [Arguments]    ${titulo_esperado}
    ${titulo_atual}=    Get Title
    Should Contain    ${titulo_atual}    ${titulo_esperado}

Criar Diretório Screenshots
    [Documentation]    Cria o diretório para screenshots se não existir
    Create Directory    ${SCREENSHOTS_DIR}
