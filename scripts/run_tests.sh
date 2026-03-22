#!/bin/bash

# Script para executar os testes de automação de tela com Robot Framework

set -e

echo "======================================"
echo "  Automação de Testes de Tela - Robot"
echo "======================================"

# Diretórios
RESULTS_DIR="results"
SCREENSHOTS_DIR="results/screenshots"
LOGS_DIR="results/logs"

# Criar diretórios necessários
mkdir -p "$RESULTS_DIR" "$SCREENSHOTS_DIR" "$LOGS_DIR"

# Verificar dependências
echo "[INFO] Verificando dependências..."
python -m pip install -r requirements.txt --quiet

# Configurar driver do Chrome (opcional, usando webdriver-manager)
echo "[INFO] Configurando WebDriver..."

# Parâmetros de execução
BROWSER="${BROWSER:-headless_chrome}"
TAGS="${TAGS:-}"
OUTPUT_DIR="${OUTPUT_DIR:-results}"

# Construir comando robot
ROBOT_CMD="python -m robot"
ROBOT_CMD="$ROBOT_CMD --outputdir $OUTPUT_DIR"
ROBOT_CMD="$ROBOT_CMD --log $LOGS_DIR/log.html"
ROBOT_CMD="$ROBOT_CMD --report $OUTPUT_DIR/report.html"
ROBOT_CMD="$ROBOT_CMD --variable BROWSER:$BROWSER"
ROBOT_CMD="$ROBOT_CMD --loglevel DEBUG"

# Adicionar filtro de tags se fornecido
if [ -n "$TAGS" ]; then
    ROBOT_CMD="$ROBOT_CMD --include $TAGS"
fi

ROBOT_CMD="$ROBOT_CMD tests/"

echo "[INFO] Executando testes..."
echo "[CMD] $ROBOT_CMD"
echo ""

# Executar testes
eval $ROBOT_CMD

RESULTADO=$?

echo ""
echo "======================================"
if [ $RESULTADO -eq 0 ]; then
    echo "  ✓ Todos os testes passaram!"
else
    echo "  ✗ Alguns testes falharam (código: $RESULTADO)"
fi
echo "======================================"
echo "[INFO] Resultados em: $OUTPUT_DIR/report.html"
echo "[INFO] Screenshots em: $SCREENSHOTS_DIR"

exit $RESULTADO
