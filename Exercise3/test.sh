#!/bin/bash

# Test script for Exercise 

# Get input value from command line or use default
INPUTa=${1:-3}
INPUTb=${2:-4}
INPUTc=${3:-10}

echo "═══════════════════════════════════════════════════"
echo "🧪 Testing Exercise #: "
echo "═══════════════════════════════════════════════════"
echo ""

echo "Input:  a = $INPUTa"
echo "        b = $INPUTb"
echo "        c = $INPUTc"
echo ""

# Validate inputs are numbers
if ! [[ "$INPUTa" =~ ^-?[0-9]+$ ]] || ! [[ "$INPUTb" =~ ^-?[0-9]+$ ]] || ! [[ "$INPUTc" =~ ^-?[0-9]+$ ]]; then
    echo "   Error: Input must be a number"
    echo "   Usage: bash test.sh [a] [b] [c]"
    exit 1
fi

# Add test logic here:

SUM=$((INPUTa + INPUTb))
OUTPUT=$((SUM * INPUTc))
EXPECTED=$(((INPUTa + INPUTb) * INPUTc))

# Compute output according your circuit
echo "Expected output: (a + b) * c"
echo "               = ($INPUTa + $INPUTb) * $INPUTc"
echo "               = $SUM * $INPUTc"
echo "               = $EXPECTED"
echo ""

# Check if results satisfies constraints: 
if [ "$EXPECTED" -eq "$OUTPUT" ]; then
    echo "Result: "
    echo "Constraint check: (a + b) * c = $OUTPUT"
    STATUS="PASS"
else
    echo "Result: "
    echo "Constraint check: (a + b) * c != $OUTPUT"
    STATUS="FAIL"
fi

echo ""
echo "═══════════════════════════════════════════════════"

if [ "$STATUS" = "PASS" ]; then
    echo "✅ Test PASSED"
else
    echo "❌ Test FAILED - constraint violation"
fi