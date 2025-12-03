// Goal: Output 1 if a == b, else 0.
// Concepts: boolean constraints.

template IsEqual() {
  signal input a;
  signal input b;
  signal output out;

  signal diff;
  diff <== a - b;
  out <== 1 - diff * diff;  // Only 1 when diff = 0
}

component main = IsEqual();

// Practice:
// Try testing a=4, b=4 and a=3, b=5.