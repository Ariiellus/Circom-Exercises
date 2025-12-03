const path = require('path');
const fs = require('fs');

// Use the witness calculator from circom_runtime
async function loadWitnessCalculator() {
  const wasmPath = path.join(__dirname, 'Exercise1.wasm');
  const wasmBuffer = fs.readFileSync(wasmPath);

  // Load the witness calculator module
  const wc = require('circom_runtime').WitnessCalculatorBuilder;
  return await wc(wasmBuffer);
}

// Test cases: [input, expectedOutput]
const testCases = [
  [0, 0],
  [1, 1],
  [2, 4],
  [5, 25],
  [10, 100],
  [-3, 9],  // Negative input
];

/**
 * Run all tests
 */
async function runTests() {
  console.log('═══════════════════════════════════════════════════');
  console.log('🧪 Testing Exercise 1: Square Circuit (JavaScript)');
  console.log('═══════════════════════════════════════════════════');
  console.log('');

  console.log('📦 Loading witness calculator...');
  const witnessCalculator = await loadWitnessCalculator();
  console.log('');

  let passedCount = 0;
  let failedCount = 0;

  // Run test cases
  for (const [input, expected] of testCases) {
    console.log(`Testing: x = ${input}`);

    try {
      const witness = await witnessCalculator.calculateWitness({ x: input }, true);

      // Get the output from witness
      // witness[0] = 1 (constant)
      // witness[1] = output y
      // witness[2] = input x
      const output = Number(witness[1]);

      if (output === expected) {
        console.log(`  ✅ PASS: y = ${output} (expected ${expected})`);
        passedCount++;
      } else {
        console.log(`  ❌ FAIL: y = ${output} (expected ${expected})`);
        failedCount++;
      }
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
      failedCount++;
    }
  }

  console.log('');
  console.log('═══════════════════════════════════════════════════');
  console.log(`📊 Results: ${passedCount} passed, ${failedCount} failed`);

  if (failedCount === 0) {
    console.log('✅ All tests PASSED');
    process.exit(0);
  } else {
    console.log('❌ Some tests FAILED');
    process.exit(1);
  }
}

// Run tests
runTests().catch(error => {
  console.error('❌ Test execution error:', error);
  console.error(error.stack);
  process.exit(1);
});
