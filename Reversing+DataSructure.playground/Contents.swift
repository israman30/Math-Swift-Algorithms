//: Playground - noun: a place where people can play

import UIKit

// Reversing an array on integers
/*
    array[1,2,3,4]
    a = 0, b.count - 1, c = 0
    c = a  
    a = b
    c = b
    a += 1 && b -= 1
 */
func reversingArray(array: [Int])->[Int]?{
    var array = array
    var first = 0
    var last = array.count - 1
    while first < last {
        let holder = array[first]
        array[first] = array[last]
        array[last] = holder
        
        first += 1
        last -= 1
    }
    return array
}

reversingArray(array: [1, 2, 3, 4])

