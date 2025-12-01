// Goal: Compute (a + b) * c.
// Concepts: chaining operations.

template AddMul() {
  signal input a;
  signal input b;
  signal input c;
  signal output out;

  signal sum;
  sum <== a + b;
  out <== sum * c;
}

component main = AddMul();

// Practice:
// Replace with a * b + c.
// Add another layer, like (a + b + c)².
