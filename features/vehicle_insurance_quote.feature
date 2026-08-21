Feature: Cotação de Seguro de Veículo

  Como um visitante
  Eu quero solicitar uma cotação de seguro
  Para que eu possa receber uma proposta de seguro

  Cenário: Enviar uma cotação de seguro com sucesso
    Dado que acesso a aplicação de seguro de veículos
    Quando preencho os dados do veículo
    E preencho os dados do segurado
    E preencho os dados do produto
    E seleciono a opção de preço desejada
    E envio a solicitação de cotação
    Então a mensagem de sucesso deve ser exibida