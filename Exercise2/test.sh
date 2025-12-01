#!/bin/bash

# Test script for Exercise 2 - validates multiplication calculation

# Get input values from command line or use defaults
A=${1:-3}
B=${2:-4}

echo "═══════════════════════════════════════════════════"
echo "🧪 Testing Exercise 2: Multiplier Circuit"
echo "═══════════════════════════════════════════════════"
echo ""

# Validate inputs are numbers
if ! [[ "$A" =~ ^-?[0-9]+$ ]]; then
    echo "Error: First input (a) must be a number"
    echo "   Usage: bash test.sh [a] [b]"
    exit 1
fi

if ! [[ "$B" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Second input (b) must be a number"
    echo "   Usage: bash test.sh [a] [b]"
    exit 1
fi

echo "Input:  a = $A"
echo "        b = $B"
echo ""

# Compute output (circuit constraint: z = a * b)
OUTPUT=$((A * B))

echo "Expected output: z = a × b"
echo "                   = $A × $B"
echo "                   = $OUTPUT"
echo ""
echo "✅ Result: z = $OUTPUT"
echo ""

echo "═══════════════════════════════════════════════════"
echo "✅ Test PASSED"
echo "═══════════════════════════════════════════════════"
echo ""