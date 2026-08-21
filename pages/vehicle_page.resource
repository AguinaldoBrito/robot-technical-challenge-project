*** Settings ***

Documentation    Page Object da aba "Enter Vehicle Data".
Library          Browser
Resource         ../resources/variables.resource


*** Variables ***

${MAKE}             id=make
${MODEL}            id=model
${CYLINDER}         id=cylindercapacity
${ENGINE}           id=engineperformance
${DATE}             id=dateofmanufacture
${SEATS_INPUT}      id=numberofseats
${SEATS_INPUT2}     id=numberofseatsmotorcycle
${FUEL}             id=fuel
${PAYLOAD_KG}       id=payload
${TOTAL_WEIGHT}     id=totalweight
${LIST_PRICE}       id=listprice
${PLATE}            id=licenseplatenumber
${MILEAGE}          id=annualmileage
${NEXT}             id=nextenterinsurantdata


*** Keywords ***

Quando preencho os dados do veículo
    [Documentation]    Preenche a aba "Enter Vehicle Data" e avança para a próxima aba.
    Select Options By    ${MAKE}            label    ${VEHICLE_MAKE}
    Select Options By    ${MODEL}           label    ${VEHICLE_MODEL}
    Fill Text            ${CYLINDER}        ${CYLINDER_CAPACITY}
    Fill Text            ${ENGINE}          ${ENGINE_PERFORMANCE}
    Fill Text            ${DATE}            ${MANUFACTURE_DATE}
    Select Options By    ${SEATS_INPUT}     text     ${NUMBER_OF_SEATS}
    Select Options By    ${SEATS_INPUT2}    text     ${NUMBER_OF_SEATS2}
    Select Options By    ${FUEL}            text     ${FUEL_TYPE}
    Fill Text            ${PAYLOAD_KG}      ${PAYLOAD_VALUE}
    Fill Text            ${TOTAL_WEIGHT}    ${WEIGHT_VALUE}
    Fill Text            ${LIST_PRICE}      ${LIST_PRICE_VALUE}
    Fill Text            ${PLATE}           ${LICENSE_PLATE}
    Fill Text            ${MILEAGE}         ${ANNUAL_MILEAGE}
    Click                ${NEXT}