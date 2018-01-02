//: Playground - noun: a place where people can play

import UIKit

// Math playground
// Este es un lugar para las matematicas

// Sum
2 + 3
2 - 3
2 * 3
2 / 3

var number1 = 2
var number2 = 3

let resta = number2 / number1

// Power of usgin Swift property pow()
pow(3, 2)

// Square root of #
sqrt(9)

// We will divide a number and get the reminder of that number
// Function Tupple as return value
func divide(x: Int, y: Int)-> (Int, Int){
    let quotient =  x / y
    let reminder =  x % y
    return (quotient, reminder)
}

// This result will return a tupple of (.02, .10)
divide(x: 6, y: 3)


// Adding a sequence or collection of numbers
func adding(n: [Int])->Int {
    var sum = 0
    n.forEach { (num) in
        sum += num
    }
    return sum
}

// The result will be the addition of all the elements in the array, in this case will be 10
adding(n: [1, 2, 3, 4])

// Using a foor in loop
func addingNumber(n: [Int])-> Int {
    var sum = 0
    for i in n {
        sum += i
    }
    return sum
}

// Will be same answer, 10
addingNumber(n: [1, 2, 3, 4])







