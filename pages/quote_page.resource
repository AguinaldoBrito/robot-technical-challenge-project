*** Settings ***

Documentation    Page Object da aba "Send Quote".
Library          Browser
Resource         ../resources/variables.resource
    

*** Variables ***

${EMAIL}              id=email
${PHONE}              id=phone
${USERNAME}           id=username
${PASSWORD}           id=password
${CONFIRM}            id=confirmpassword
${COMMENTS}           id=Comments
${SEND}               id=sendemail
${SUCCESS_MESSAGE}    text=Sending e-mail success!


*** Keywords ***

E envio a solicitação de cotação
    [Documentation]    Preenche a aba "Send Quote" e clica em "Send".
    Fill Text    ${EMAIL}       ${EMAIL_VALUE}
    Fill Text    ${PHONE}       ${PHONE_VALUE}
    Fill Text    ${USERNAME}    ${USERNAME_VALUE}
    Fill Text    ${PASSWORD}    ${PASSWORD_VALUE}
    Fill Text    ${CONFIRM}     ${PASSWORD_VALUE}
    Fill Text    ${COMMENTS}    ${COMMENTS_VALUE}
    Click        ${SEND}


Então a mensagem de sucesso deve ser exibida
    [Documentation]    Aguarda a exibição da mensagem "Sending e-mail success!" na tela,
    ...                confirmando que o envio da cotação foi concluído com sucesso,
    ...                e captura uma screenshot como evidência do resultado do teste.
    Wait For Elements State    ${SUCCESS_MESSAGE}    visible    timeout=20s
    Sleep    2s
    Take Screenshot