# Automação de Testes de Tela com Robot Framework

Projeto de automação de testes de interface gráfica usando Robot Framework e SeleniumLibrary.

## Estrutura do Projeto

```
Automa-o/
├── tests/
│   ├── 01_exemplo_basico.robot       # Testes básicos de navegação
│   ├── 02_captura_tela.robot         # Testes de captura de tela
│   └── 03_verificacao_visual.robot   # Verificação visual de elementos
├── resources/
│   ├── common.resource               # Keywords e variáveis comuns
│   └── page_objects/
│       └── google_page.resource      # Page Object do Google
├── scripts/
│   ├── run_tests.sh                  # Script de execução principal
│   └── run_tests_headless.sh         # Execução sem interface gráfica
├── .github/
│   └── workflows/
│       └── robot-tests.yml           # Pipeline CI/CD GitHub Actions
├── requirements.txt                  # Dependências Python
└── robot.yaml                        # Configuração do robô
```

## Pré-requisitos

- Python 3.8+
- Google Chrome ou Firefox instalado
- ChromeDriver (gerenciado automaticamente via webdriver-manager)

## Instalação

```bash
pip install -r requirements.txt
```

## Como Executar

### Todos os testes
```bash
python -m robot --outputdir results tests/
```

### Modo headless (sem interface gráfica)
```bash
python -m robot --variable BROWSER:headless_chrome --outputdir results tests/
```

### Usando o script
```bash
bash scripts/run_tests.sh
bash scripts/run_tests_headless.sh
```

### Por tags
```bash
python -m robot --include smoke --outputdir results tests/
python -m robot --include visual --outputdir results tests/
```

### Um arquivo específico
```bash
python -m robot --outputdir results tests/01_exemplo_basico.robot
```

## Tags Disponíveis

| Tag          | Descrição                          |
|--------------|------------------------------------|
| `smoke`      | Testes básicos de sanidade         |
| `basico`     | Testes de funcionalidade básica    |
| `visual`     | Testes de verificação visual       |
| `screenshot` | Testes de captura de tela          |
| `funcional`  | Testes funcionais                  |
| `responsivo` | Testes de responsividade           |

## Resultados

Após a execução, os resultados ficam em `results/`:
- `report.html` — Relatório visual dos testes
- `log.html` — Log detalhado com screenshots
- `output.xml` — Saída em formato XML
- `screenshots/` — Capturas de tela dos testes
