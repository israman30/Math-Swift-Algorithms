//: Playground - noun: a place where people can play

import UIKit

// We will use two cases with if and switch statement
// We will using float type because this will give us a value with near round decimal value

// Simple Caculator with switch statement
func simpleCalculator(x: Float, y: Float, operand: String)-> Float {
    var result:Float = 0.0
    switch operand {
    case "+":
        result = x + y
    case "-":
        result = x - y
    case "*":
        result = x * y
    case "/":
        result = x / y
    default:
        break
    }
    return result
}


// With if ,else if statement
func swiftCalculator(x: Float, y: Float, operand: String)-> Float {
    var result: Float = 0.0
    if operand == "+" {
        result = x + y
    } else if operand == "-" {
        result = x - y
    } else if operand == "*" {
        result = x * y
    } else if operand == "/" {
        result = x / y
    }
    return result
}

// Unit converter
func unitConverter(value: Float, from: String, to: String)-> Float{
    // TODO
    var result: Float = 0.0
    if from == "Fahrenheit" && to == "Celsius"{
        result = value * (9 / 5 + 32)
    } else if from == "Celsius" {
        result = (value - 32) * 5 / 9
    }
    return result
}

unitConverter(value: 5, from: "Fahrenheit", to: "Celsius")














