*** Settings ***

Documentation    Fluxo completo de cotação de seguro de veículo no Tricentis Application.
...              Escrito com sintaxe Gherkin (Given/When/Then/And), suportado nativamente
...              pelo Robot Framework (BuiltIn ignora esses prefixos ao casar keywords),
...              com Page Objects representando cada aba do formulário.
...              Este arquivo é o ponto de entrada da execução (a "feature").

Library    Browser

Resource   ../resources/variables.resource
Resource   ../pages/vehicle_page.resource
Resource   ../pages/insurant_page.resource
Resource   ../pages/product_page.resource
Resource   ../pages/price_page.resource
Resource   ../pages/quote_page.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Tags         seguro    cotacao


*** Test Cases ***

Enviar cotação de Seguro de Veiculo com sucesso
    [Documentation]    Preenche todo o wizard de cotação e confirma a mensagem de sucesso do envio.
    Dado que acesso a aplicação de seguro de veículos
    Quando preencho os dados do veículo
    E preencho os dados do segurado
    E preencho os dados do produto
    E seleciono a opção de preço desejada
    E envio a solicitação de cotação
    Então a mensagem de sucesso deve ser exibida

*** Variables ***

${BASE_URL}    http://sampleapp.tricentis.com/101/app.php
${BROWSER}     chromium
${HEADLESS}    false
${HEADLESS}    ${True}
${SLOWMO}      0s

*** Keywords ***

Open Application
    New Browser    ${BROWSER}    headless=${HEADLESS}    slowMo=${SLOWMO}
    New Context    locale=en-GB    

Close Application
    Close Browser


Dado que acesso a aplicação de seguro de veículos
    New Page    ${BASE_URL}
