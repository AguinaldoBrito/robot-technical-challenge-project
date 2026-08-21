*** Settings ***

Documentation    Page Object da aba "Enter Insurant Data".
Library          Browser
Resource         ../resources/variables.resource


*** Variables ***

${FIRST_NAME}       id=firstname
${LAST_NAME}        id=lastname
${BIRTH_DATE}       id=birthdate
${GENDER}           *css=label >> id=gendermale
${STREET}           id=streetaddress
${COUNTRY}          id=country
${ZIP}              id=zipcode
${CITY}             id=city
${OCCUPATION}       id=occupation
${HOBBIES}          text=Cliff Diving
${NEXT_BUTTON}      id=nextenterproductdata


*** Keywords ***

E preencho os dados do segurado
    [Documentation]    Preenche a aba "Enter Insurant Data" e avança para a próxima aba.
    Fill Text            ${FIRST_NAME}    ${FIRST_NAME_VALUE}
    Fill Text            ${LAST_NAME}     ${LAST_NAME_VALUE}
    Fill Text            ${BIRTH_DATE}    ${BIRTH_DATE_VALUE}
    Check Checkbox       ${GENDER}
    Fill Text            ${STREET}        ${STREET_VALUE}
    Select Options By    ${COUNTRY}       label    ${COUNTRY_VALUE}
    Fill Text            ${ZIP}           ${ZIP_VALUE}
    Fill Text            ${CITY}          ${CITY_VALUE}
    Select Options By    ${OCCUPATION}    label    ${OCCUPATION_VALUE}
    Click                ${HOBBIES}
    Click                ${NEXT_BUTTON}