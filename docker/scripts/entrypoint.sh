#!/bin/sh

TOKEN_FILE="${TOKEN_FILE:-/app/data/token.json}"

# Ensure data directory exists
mkdir -p "$(dirname "$TOKEN_FILE")"

# Check if token file exists
if [ ! -f "$TOKEN_FILE" ]; then
    echo "First run detected: token file '$TOKEN_FILE' not found. Adding -httpDiscovery flag..."
    echo "Running: freebox-exporter -httpDiscovery $@ $TOKEN_FILE"
    exec freebox-exporter -httpDiscovery "$@" "$TOKEN_FILE"
else
    echo "Token file '$TOKEN_FILE' found. Starting normally..."
    echo "Running: freebox-exporter $@ $TOKEN_FILE"
    exec freebox-exporter "$@" "$TOKEN_FILE"
fi
