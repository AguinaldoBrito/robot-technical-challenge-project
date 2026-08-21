*** Settings ***

Documentation    Page Object da aba "Select Price Option".
Library          Browser


*** Variables ***

${PRICE_OPTION_SILVER}    *css=label >> css=[value=Silver]
${BUTTON_NEXT_3}          id=nextsendquote


*** Keywords ***

E seleciono a opção de preço desejada
    [Documentation]    Seleciona a opção de preço "Silver" e avança para a próxima aba.
    Click    ${PRICE_OPTION_SILVER}
    Click    ${BUTTON_NEXT_3}