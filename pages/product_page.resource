*** Settings ***

Documentation    Page Object da aba "Enter Product Data".
Library          Browser
Library          DateTime
Resource         ../resources/variables.resource


*** Variables ***

${START_DATE}       id=startdate
${INSURANCE_SUM}    id=insurancesum
${MERIT_RATING}     id=meritrating
${DAMAGE}           id=damageinsurance
${OPTIONALS}        text=Euro Protection
${COURTESY}         id=courtesycar
${NEXT_BUTTON_2}    id=nextselectpriceoption


*** Keywords ***

E preencho os dados do produto
    [Documentation]    Preenche a aba "Enter Product Data" e avança para a próxima aba.
    ...                A data de início da apólice é calculada dinamicamente (hoje + 60 dias),
    ...                para garantir que o teste sempre envie uma data futura válida.
    ${hoje}=             Get Current Date
    ${data_inicio}=      Add Time To Date    ${hoje}    60 days    result_format=%m/%d/%Y
    Fill Text            ${START_DATE}       ${data_inicio}
    Select Options By    ${INSURANCE_SUM}    label    ${INSURANCE_SUM_VALUE}
    Select Options By    ${MERIT_RATING}     label    ${MERIT_RATING_VALUE}
    Select Options By    ${DAMAGE}           label    ${DAMAGE_VALUE}
    Click                ${OPTIONALS}
    Select Options By    ${COURTESY}         label    ${COURTESY_VALUE}
    Click                ${NEXT_BUTTON_2}