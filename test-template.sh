#!/bin/bash

# Test script for Exercise 

# Get input value from command line or use default
INPUT=${1:-5}

echo "═══════════════════════════════════════════════════"
echo "🧪 Testing Exercise #: "
echo "═══════════════════════════════════════════════════"
echo ""

echo "Input:  x = $INPUT"
echo ""

# Validate inputs are numbers
if ! [[ "$INPUT" =~ ^-?[0-9]+$ ]]; then
    echo "❌ Error: Input must be a number"
    echo "   Usage: bash test.sh [number]"
    exit 1
fi

# Add test logic here:

# Compute output according your circuit
OUTPUT=$((INPUT * INPUT))

echo "Expected output: $OUTPUT"
echo ""

# Check if results satisfies constraints:
if [condition]; then
    echo "Result: "
    echo "Constraint check: "
    STATUS="PASS"
else
    echo "Result: "
    echo "Constraint check: "
    STATUS="FAIL"
fi

echo ""
echo "═══════════════════════════════════════════════════"

if [ "$STATUS" = "PASS" ]; then
    echo "✅ Test PASSED"
else
    echo "❌ Test FAILED - constraint violation"
fi