import UIKit

// // ==========================DUPLICATES PLAYGROUND ===========================
// =    * Zeros duplicates                                                      =
// =    1. Re-order the zeros                                                   =
// =    2. Remove duplicates                                                    =
// =    3. Single element                                                       =
// =    4. Parentesis duplicates string                                         =
// ==============================================================================

// Re order zeros
// input [1, 0, 1, 0, 0, 1]
// output [1, 1, 1, 0, 0, 0]

func zerosArrange(_ arr: [Int]) -> [Int] {
    var one = [Int]()
    var two = [Int]()
    for i in arr {
        if i != 0 {
            one.append(i)
        } else {
            two.append(i)
        }
    }
    return one + two
}
/*
 Use extra space
 Iterate in the array
    if element not equal to zero
        append on container
    else
        append on container
 return container + container
 
 T = O(n)
 S = O(A + B)
 **/

func zeros(_ arr: inout [Int]) -> [Int] {
    var count = 0
    for i in 0..<arr.count {
        if arr[i] == 0 {
            count += 1
        } else {
            arr.swapAt(i, i - count)
        }
    }
    return arr
}
/*
 Keep a count for each iteration
 if element == 0 then count increase by one
 else array swapt element with element minus the count
 
 element == 0
    count += 1
 swatp 0 with 1
 
 T = O(n)
 S = O(1)
 **/

// Keep one instance of each element
func duplicates(_ arr: [Int]) -> [Int] {
    var result = [Int]()
    for i in 0..<arr.count - 1 {
        if arr[i] != arr[i + 1] {
            result.append(i)
        }
    }
    return result
}
/*
 Iterate in the array minus the last element
 if element not equal to the next element
    append to a container
 [1, 2, 2, 3, 4, 4, 5]
 arr[i] = 1
 arr[i] + 1 = 2
 
 if 1 != 1
    append to a container
 return container
 
 T = O(n - 1)
 S = O(n)
 **/

// Find duplicates using dictionary
func containsDuplicate(_ nums: [Int]) -> Bool {
    var dict = [Int:Int]()
    for i in nums {
        if let count = dict[i] {
            dict[i] = count + 1
        } else {
            dict[i] = 1
        }
    }

    for (_, value) in dict {
        if value > 1 {
            return true
        }
    }
    return false
}
/*
 Iterate in the array
    construct a dictionary using the element as key and increase the value if the elemter exits
    if element does not exit assign one
 
 Iterate in the dictionary
    if value in dictionary is less than one, duplicate exit
 
 [1, 1, 2, 3, 4, 4]
 dict = [:]
 
 1 exist in dict count += 1
 1 does not exist assign = 1
 
 each iteration representation:
 1:1
 1:2
 2:1
 3:1
 4:1
 4:2
 
 value > 1 => [1, 4] exist in array
 
 T = O(n)
 S = O(1)
 **/

// Single Element in the array
func singleElement(nums: [Int]) -> Int? {
    var dict = [Int:Int]()
    for i in nums {
        if let count = dict[i] {
            dict[i] = count + 1
        } else {
            dict[i] = 1
        }
    }
    
    var result = 0
    
    for (key, value) in dict {
        if value <= 1 {
            result = key
        }
    }
    return result
}
/*
 Use a dictionary to keep track on each element
 Iterate in the array
    increase by one if the element exist in the dictionary
    assign one if element does not exit in the dictionary
 Iterate in the dictionary
    use a inital value of zero
    if value is less or equal to one
        assign the intieal value to the key
 return that value
 
 [1, 2, 3, 4, 4]
 dict = [:]
 
 1 exist in dict count += 1
 1 does not exist assign = 1
 
 each iteration representation:
 1:1
 2:1
 3:1
 4:1
 4:2
 result = 0
 
 if value <= 1
    result = key
 result = 4 <- single value
 
 T = O(n)
 S = O(1)
 **/


// Check if parentesis repeat and match
func parentesis(word: String) -> Bool {
    var count = 0
    let word = Array(word)
    for i in 0..<word.count {
        if word[i] == "(" || word[i] == ")" {
            count += 1
        }
    }
    if count > 1 {
        return false
    }
    return true
}
/*
 Use a count to keep track of each element
 The string convert into an array
 Iterate in the array
    if element is equal to "(" or equal to ")"
        increase count by one
    if count is greater than one
        return if match or not
 
 T = O(n)
 S = O(1)
 **/
