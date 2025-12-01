#!/bin/bash

# Test script for Exercise 1 - validates square calculation and constraint check

# Get input value from command line or use default
INPUT=${1:-5}
# MAX_VALUE=100

echo "═══════════════════════════════════════════════════"
echo "🧪 Testing Exercise 1: Square Circuit"
echo "═══════════════════════════════════════════════════"
echo ""

## if input isn't a number, it will be considered as 0 (check test-template.sh for validation code)
echo "Input:  x = $INPUT"
echo ""

# Compute output (circuit constraint: y = x²)
OUTPUT=$((INPUT * INPUT))

echo "📤 Expected output: y = x² = $INPUT² = $OUTPUT"
echo ""

# Check if result satisfies constraint y <= 100
if [ "$OUTPUT" -le "$MAX_VALUE" ]; then
    echo "Result: y = $OUTPUT"
    echo "Constraint check: y ($OUTPUT) <= $MAX_VALUE ✓"
    STATUS="PASS"
else
    echo "Result: y = $OUTPUT"
    echo "Constraint check: y ($OUTPUT) > $MAX_VALUE ✗"
    STATUS="FAIL"
fi

echo ""
echo "═══════════════════════════════════════════════════"

if [ "$STATUS" = "PASS" ]; then
    echo "✅ Test PASSED"
else
    echo "❌ Test FAILED - constraint violation"
fi