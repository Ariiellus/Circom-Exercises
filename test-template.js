const path = require('path');
const fs = require('fs');

// Configuration
const CIRCUIT_NAME = 'ExerciseX';
const OUTPUT_INDEX = 1; // Output index in witness (adjust based on your circuit)

// Test cases: { inputs: {...}, expected: value }
const testCases = [
  { inputs: { x: 0 }, expected: 0 },
  { inputs: { x: 5 }, expected: 25 },
];

// Load witness calculator from compiled WASM
async function loadWitnessCalculator() {
  const wasmPath = path.join(__dirname, `${CIRCUIT_NAME}.wasm`);

  if (!fs.existsSync(wasmPath)) {
    console.error(`❌ Error: ${wasmPath} not found. Compile first: circom ${CIRCUIT_NAME}.circom --wasm --r1cs`);
    process.exit(1);
  }

  const wasmBuffer = fs.readFileSync(wasmPath);
  const wc = require('circom_runtime').WitnessCalculatorBuilder;
  return await wc(wasmBuffer);
}

// Test runner
async function runTests() {
  console.log(`🧪 Testing ${CIRCUIT_NAME}\n`);

  const witnessCalculator = await loadWitnessCalculator();

  let passed = 0;
  let failed = 0;

  for (const testCase of testCases) {
    try {
      const witness = await witnessCalculator.calculateWitness(testCase.inputs, true);
      const output = Number(witness[OUTPUT_INDEX]);
      const expected = testCase.expected;

      if (output === expected) {
        console.log(`✅ ${JSON.stringify(testCase.inputs)} → ${output}`);
        passed++;
      } else {
        console.log(`❌ ${JSON.stringify(testCase.inputs)} → ${output} (expected ${expected})`);
        failed++;
      }
    } catch (error) {
      console.log(`❌ ${JSON.stringify(testCase.inputs)} → Error: ${error.message}`);
      failed++;
    }
  }

  console.log(`\n📊 ${passed} passed, ${failed} failed`);
  process.exit(failed > 0 ? 1 : 0);
}

runTests().catch(error => {
  console.error('❌ Test execution error:', error);
  console.error(error.stack);
  process.exit(1);
});

