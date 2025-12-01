// Exercise 1: Square a number
// Goal: Create a circuit that outputs y = x**2
// Concepts: signals, templates, constraint assignment

template Square() {
    signal input x;
    signal output y;
    y <== x * x;
}

component main = Square();

// Practice:
// 1. Change it to cube (x³)
// 2. Add a check: y must be ≤ 100
