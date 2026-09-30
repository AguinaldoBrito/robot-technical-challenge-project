![Robot Framework Tests](https://github.com/AguinaldoBrito/robot-technical-challenge-project/actions/workflows/robot-tests.yml/badge.svg)

# Desafio Técnico - Robot Framework (com Browser Library)

Automação do fluxo de cotação de seguro de veículo do
[Tricentis Sample App](http://sampleapp.tricentis.com/101/app.php), usando
**Robot Framework**, **Browser Library** (baseada em Playwright) e o padrão
**Page Objects**.

## Sobre a decisão técnica "Robot + Cucumber"

O desafio pede um projeto em "robot e cucumber". Robot Framework e Cucumber são
duas stacks tecnicamente distintas (Cucumber interpreta arquivos `.feature` em
Gherkin e os liga a step definitions em Java/Ruby/JS; ele não roda Robot por
baixo dos panos). Em vez de forçar uma integração artificial entre as duas
ferramentas, optei pelo suporte **nativo** do Robot Framework à sintaxe Gherkin:
o Robot reconhece e ignora os prefixos `Given/When/Then/And/But` na hora de
casar com as keywords, então o teste em `features/insurance_quote.robot` já é
escrito e lido como uma feature BDD — e é também o ponto de entrada real da
execução (não uma camada decorativa por cima de outra ferramenta).

Essa abordagem é reconhecida oficialmente pela documentação do Robot Framework
(ver [Testcase Styles → BDD](https://docs.robotframework.org/docs/testcase_styles/bdd)),
evita duas stacks concorrentes e mantém o projeto simples de rodar e revisar.

## Estrutura do projeto

```
robot-technical-challenge-project/
├── features/
│   └── vehicle_insurance_quote.feature		# ponto de entrada (feature em estilo Gherkin, apenas para fins de visualização do cenário.)
├── pages/                                  # Page Objects, um por aba do formulário
│       ├── insurant_page.resource
│       ├── price_page.resource
│       ├── product_page.resource
│       ├── quote_page.resource
│       └── vehicle_page.resource
├── resources/
│   ├── variables.resource                  # todas as variáveis da automação
├── tests/
│       ├── results/                        # relatórios gerados após a execução (log.html, report.html, output.xml)
│       ├── vehicle_insurance_quote.robot   # ponto de entrada da execução (feature em estilo Gherkin)
├── .gitignore                              # arquivos e pastas ignorados pelo Git (ex: results/, venv/)
├── README.md                               # documentação do projeto
└── requirements.txt                        # dependências Python do projeto
```
*os restantes são arquivos temporários gerados pelo próprio robot

Cada aba do wizard (Vehicle Data, Insurant Data, Product Data, Price Option,
Send Quote) virou um `.resource` próprio, com suas variáveis de localizadores
e suas keywords — isso é o padrão Page Object aplicado ao Robot Framework.

## Pré-requisitos

- Python 3.9+
- Robot Framework
- Node.js 16+ (necessário para o Playwright, usado internamente pela Browser Library)
- VS Code com a extensão **Robot Framework Language Server** (recomendado)

## Instalação

```bash
python -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
rfbrowser init                    # instala os navegadores do Playwright
```

## Execução

```bash
robot -d tests/results tests/vehicle_insurance_quote.robot
```

Os relatórios (`log.html`, `report.html`, `output.xml`) são gerados na pasta
`results/`. Para acompanhar visualmente a execução, defina `${HEADLESS}` como
`true` ou `false` em `tests/vehicle_insurance_quote.robot`.

## Fluxo automatizado

1. Abre `http://sampleapp.tricentis.com/101/app.php`
2. Preenche a aba **Enter Vehicle Data** e avança
3. Preenche a aba **Enter Insurant Data** e avança
4. Preenche a aba **Enter Product Data** e avança
5. Preenche a aba **Select Price Option** e avança
6. Preenche a aba **Send Quote** e clica em **Send**
7. Verifica a mensagem **"Sending e-mail success!"** na tela

## Publicação no Git

```bash
git init
git add .
git commit -m "Desafio técnico: automação de cotação de seguro com Robot Framework"
git branch -M main
git remote add origin <URL_DO_SEU_REPOSITORIO>
git push -u origin main
```
