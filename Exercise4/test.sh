#!/bin/bash

# Test script for Exercise 

# Get input value from command line or use default
INPUTa=${1:-4}
INPUTb=${2:-4}

echo "═══════════════════════════════════════════════════"
echo "🧪 Testing Exercise #4: Equality Check"
echo "═══════════════════════════════════════════════════"
echo ""

echo "Input:  a = $INPUTa"
echo "        b = $INPUTb"
echo ""

# Validate inputs are numbers
if ! [[ "$INPUTa" =~ ^-?[0-9]+$ ]] || ! [[ "$INPUTb" =~ ^-?[0-9]+$ ]]; then
    echo "❌ Error: Input must be a number"
    echo "   Usage: bash test.sh [a] [b]"
    exit 1
fi

# Add test logic here:
DIF=$((INPUTa - INPUTb))
OUTPUT=$((1 - DIF * DIF))

if [ "$INPUTa" -eq "$INPUTb" ]; then
    EXPECTED=1
else
    EXPECTED=0
fi

# Compute output according your circuit
echo "Expected output: 1 if a == b, else 0"
echo "               = $INPUTa == $INPUTb ? 1 : 0"
echo "               = $EXPECTED"
echo ""

# Check if results satisfies constraints:
if [ "$EXPECTED" -eq "$OUTPUT" ]; then
    echo "Result: "
    echo "Constraint check: 1 if a == b, else 0 = $OUTPUT"
    STATUS="PASS"
else
    echo "Result: "
    echo "Constraint check: 1 if a == b, else 0 != $OUTPUT"
    STATUS="FAIL"
fi

echo ""
echo "═══════════════════════════════════════════════════"

if [ "$STATUS" = "PASS" ]; then
    echo "✅ Test PASSED"
else
    echo "❌ Test FAILED - constraint violation"
fi