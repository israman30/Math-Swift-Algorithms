//: Playground - noun: a place where people can play

import UIKit

// We will use two cases with if and switch statement

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














