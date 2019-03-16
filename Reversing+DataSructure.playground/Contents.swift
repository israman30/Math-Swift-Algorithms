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




// Reversing a string
// Reversing replacing the first and last index of the string
func reversingString(string: String) -> String {
    var string = Array(string)
    var first = 0
    var last = string.count - 1
    while first < last {
        let holder = string[first]
        string[first] = string[last]
        string[last] = holder
        first += 1
        last -= 1
    }
    return String(string)
}



// Reversing a string swapping the first and last index of the string
/*
    - "string" -> convert into an array ["s", "t", "r", "i", "n", "g"]
    - capture first and last index then swap
    - first += 1 && last -= 1
    - convert the array back into a string then return it
 */
func reversingSwapString(string: String) -> String {
    var string = Array(string)
    var first = 0
    var last = string.count - 1
    while first < last {
        string.swapAt(first, last)
        first += 1
        last -= 1
    }
    return String(string)
}

// Reversing with generics
// This function will use a better time complexity using generic values
// O(log n)
/*
    array[1, 2, 3, 4] / 2
    array[1, 2], array.count - 1 - i[3, 4]
    array[i] swapAt() array[array.count - 1 - i]
 */
func reverse<T>(array: [T]) -> [T]{
    var array = array
    for i in 0..<array.count / 2 {
        array.swapAt(i, array.count - 1 - i)
    }
    return array
}
reverse(array: [1, 2, 3, 4])
reverse(array: ["1","2","3"])


