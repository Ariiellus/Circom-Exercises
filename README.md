# Circom Workshop

**Circom** is a domain-specific language for writing arithmetic circuits — mathematical representations of computations that can be proven using **Zero-Knowledge Proofs (ZKPs)**. This repository contains a structured learning path and workshop materials to master Circom from basics to advanced concepts.

## 🎯 Learning Objectives

By the end of this workshop, you will be able to:

- Understand the fundamentals of zero-knowledge proofs and arithmetic circuits
- Write and compile Circom circuits using signals, templates, and components
- Use Circomlib for common cryptographic operations
- Generate witnesses and create proofs for your circuits
- Build practical ZKP applications with Circom

## 📚 What is Circom?

Circom allows you to write logic similar to code, but the compiler translates it into a constraint system that ensures correctness **without revealing inputs**. This enables you to prove you know a solution without revealing what that solution is.

### Example: Proving You Know a Square Root

```circom
template Square() {
  signal input x;
  signal output y;
  y <== x * x;
}

component main = Square();
```

This circuit proves you know `x` such that `y = x²` — **without showing `x`**. The verifier only sees `y` and can verify you know the square root without learning what it is.

## 🔧 Prerequisites

### Required Knowledge
- Basic programming concepts (variables, functions)
- Familiarity with command line
- Understanding of basic cryptography (helpful but not required)

### Required Software
- **Node.js** (v16 or higher) and npm
- **Circom compiler** (install via npm)
- **Circomlib** (library of common circuits)

## 🚀 Setup Instructions

1. Install Node.js
If you don't have Node.js installed:
```bash
# Check if Node.js is installed
node --version

# If not installed, download from https://nodejs.org/
```

2. Install Circom
```bash
# Install Circom globally
npm install -g circom

# Verify installation
circom --version
```

**Alternative:** Use npx (no global install needed):
```bash
npx circom --version
```

3. Install Project Dependencies
```bash
# Install circomlib and other dependencies
npm install
```

4. Verify Setup
```bash
# Try compiling the first exercise
npx circom Exercise1.circom --r1cs --wasm
```

If you see `Exercise1.r1cs` and `Exercise1.wasm` files created, you're all set! 🎉

## 📖 Core Concepts

| Concept       | Meaning                                                                 | Example                           |
| ------------- | ----------------------------------------------------------------------- | --------------------------------- |
| **signal**    | A wire carrying a value (like a variable). Can be `input`, `output`, or `private`. | `signal input x;`                |
| **template**  | A reusable circuit definition (like a function/class).                  | `template Square() { ... }`       |
| **<==**       | Constraint assignment — enforces equality in the constraint system.     | `y <== x * x;`                    |
| **<--**       | Signal assignment (no constraint). Used for intermediate values.        | `temp <-- x + 1;`                 |
| **==>**       | Constraint assignment (bidirectional). Used in subcircuits.             | `x ==> sub.in;`                   |
| **component** | Instantiation of a template (creates a subcircuit).                     | `component main = Square();`      |
| **Circomlib** | A library with ready-to-use circuits (hashes, comparators, etc).        | `import "circomlib/circuits/...";` |
| **Witness**   | The set of all values that satisfy the circuit's constraints.           | Inputs that make the circuit valid |
| **R1CS**      | Rank-1 Constraint System — a format representing the circuit constraints. | Output of compilation            |
| **WASM**      | WebAssembly — compiled circuit for witness generation.                  | Output of compilation            |

## 📝 Compilation Guide

### Basic Compilation
```bash
# Compile a circuit to R1CS and WASM
circom filename.circom --r1cs --wasm
```

### Compilation Flags

| Flag     | Output                                    | Use Case                          |
| -------- | ----------------------------------------- | --------------------------------- |
| `--r1cs` | Generates `.r1cs` file                    | Required for proof generation     |
| `--wasm` | Generates `.wasm` and JavaScript files    | Required for witness generation   |
| `--sym`  | Generates `.sym` file                     | Debugging and symbol information  |
| `--json` | Generates `.json` file                    | Circuit metadata                  |
| `--c`    | Generates C++ code                        | Alternative witness generation    |

### Example
```bash
# Full compilation with all outputs
circom Exercise1.circom --r1cs --wasm --sym --json
```

This generates:
- `Exercise1.r1cs` - Constraint system (for proving)
- `Exercise1.wasm` - WebAssembly (for witness generation)
- `Exercise1.sym` - Symbol file (for debugging)
- `Exercise1.json` - Circuit metadata


## 🔍 Troubleshooting

### Common Issues

**Issue:** `circom: command not found`
```bash
# Solution: Install Circom globally or use npx
npm install -g circom
# OR
npx circom --version
```

**Issue:** Compilation errors
- Check that your file has a `.circom` extension
- Verify syntax (missing semicolons, incorrect operators)
- Ensure `main` component is defined

**Issue:** "Cannot find module 'circomlib'"
```bash
# Solution: Install dependencies
npm install
```

**Issue:** WASM generation fails
- Check Node.js version (v16+ required)
- Ensure sufficient memory for large circuits
- Try with `--c` flag for C++ output instead

## 📚 Resources

### Official Documentation
- [Circom Documentation](https://docs.circom.io/)
- [Circomlib GitHub](https://github.com/iden3/circomlib)
- [Circom Language Reference](https://docs.circom.io/language-reference/)

### Learning Resources
- [Circom Tutorial](https://docs.circom.io/getting-started/installation/)
- [Zero-Knowledge Proofs Explained](https://z.cash/technology/zksnarks/)
- [Circom Examples](https://github.com/iden3/circomlib/tree/master/test)

### Tools
- [Circom Playground](https://playground.circom.io/) - Online Circom compiler
- [SnarkJS](https://github.com/iden3/snarkjs) - JavaScript library for ZK proofs
- [Circom Language Server](https://marketplace.visualstudio.com/items?itemName=iden3.circom) - VS Code extension

## 🎯 Next Steps

After completing the exercises:

1. **Explore Circomlib:** Try using hash functions, comparators, and other pre-built circuits
2. **Build a Project:** Create a practical ZKP application (e.g., age verification, voting system)
3. **Generate Proofs:** Use SnarkJS to create and verify proofs for your circuits
4. **Advanced Topics:** Learn about custom constraints, optimization, and recursive proofs

## 🤝 Contributing

This is a learning resource. Feel free to:
- Add more exercises
- Improve documentation
- Share your solutions
- Report issues

## 📄 License

This workshop material is provided for educational purposes.