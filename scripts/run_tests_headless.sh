#!/bin/bash

# Script para executar testes em modo headless (sem interface gráfica)
# Ideal para CI/CD e servidores sem display

set -e

echo "========================================"
echo "  Testes Headless - Robot Framework"
echo "========================================"

# Instalar dependências
echo "[INFO] Instalando dependências..."
pip install -r requirements.txt --quiet

# Criar diretórios
mkdir -p results/screenshots results/logs

# Executar testes com Chrome headless
BROWSER=headless_chrome python -m robot \
    --outputdir results \
    --log results/logs/log.html \
    --report results/report.html \
    --variable BROWSER:headless_chrome \
    --loglevel DEBUG \
    --timestampoutputs \
    tests/

echo ""
echo "[INFO] Testes concluídos. Relatório: results/report.html"
