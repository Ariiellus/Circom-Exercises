// Goal: Compute z = a * b.
// Concepts: multiple inputs, output constraint.

template Multiplier() {
  signal input a;
  signal input b;
  signal output z;
  z <== a * b;  // <== assigns value AND creates constraint
  // z == a * b;  // == only creates constraint, doesn't assign value (z would be undefined!)
}

component main = Multiplier();

// Practice:
// Try a = 3, b = 5 → z = 15.
// What happens if you use == instead of <==?


// <== (constraint assignment): 
// assigns the value to z and creates a constraint. 
// Use this for output signals.

// == (constraint only): 
// only creates a constraint; 
// does not assign a value. With z == a * b;, z remains unassigned.