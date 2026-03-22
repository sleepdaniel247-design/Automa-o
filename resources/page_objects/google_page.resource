*** Settings ***
Resource    ../common.resource

*** Variables ***
# Locators - Google
${CAMPO_PESQUISA}       name:q
${BOTAO_PESQUISA}       name:btnK
${LISTA_RESULTADOS}     id:search
${LOGO_GOOGLE}          xpath://img[@alt='Google']
${BOTAO_ACEITAR}        id:L2AGLb

*** Keywords ***
Abrir Google
    [Documentation]    Navega até o Google
    Go To    https://www.google.com

Aceitar Cookies Se Necessário
    [Documentation]    Aceita o banner de cookies se aparecer
    ${existe}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BOTAO_ACEITAR}
    IF    ${existe}
        Click Element    ${BOTAO_ACEITAR}
    END

Pesquisar No Google
    [Documentation]    Realiza uma pesquisa no Google
    [Arguments]    ${termo}
    Aguardar E Digitar    ${CAMPO_PESQUISA}    ${termo}
    Press Keys    ${CAMPO_PESQUISA}    RETURN

Verificar Resultados Da Pesquisa
    [Documentation]    Verifica se os resultados de pesquisa aparecem
    Wait Until Element Is Visible    ${LISTA_RESULTADOS}    timeout=${TIMEOUT}
    Element Should Be Visible    ${LISTA_RESULTADOS}

Verificar Logo Google Visível
    [Documentation]    Verifica se o logo do Google está visível
    Wait Until Element Is Visible    ${LOGO_GOOGLE}    timeout=${TIMEOUT}
    Element Should Be Visible    ${LOGO_GOOGLE}
