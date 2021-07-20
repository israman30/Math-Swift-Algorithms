import UIKit

/// Find the sum of two numbers

let numbers = [1, 2, 3, 4]

/// The sum of 7 is 3 and 4. Find this two numbers or 4 is sum of 1 and 3.

// MARK: Linear method to find the sum of two numbers
/*
 Find teh sum of 7
 [1, 2, 3, 4]
 -> 0[1] + 3[4] = 5 false
 sum[5] < target[7] ->increase sum by 1
 -> 1[2] + 3[4] = 6 false
 sum[6] < target[7] ->increase sum by 1
 -> 2[3] + 3[4] = 7 true
 sum[7] == target[7] -> return true
 **/

func linearSumOfTwoNumbers(numbers: [Int], target: Int) -> Bool {
    var first = 0
    var last = numbers.count - 1
    while first < last {
        let sum = numbers[first] + numbers[last]
        if sum == target {
            return true
        }
        if sum < target {
            first += 1
        } else {
            last -= 1
        }
    }
    return false
}


/// Finding the complement number of the sum of 7
/*
 [:]
 []
 **/
/// O(N)
func sumOfTwoNumber(numbers: [Int], target: Int) -> Bool {
    var dict = [Int:Int]()
    for (index, value) in numbers.enumerated() {
        let complement = target - value
        if dict[complement] != nil {
            return true
        }
        dict[value] = index
    }
    return false
}

/// Returnning the two number using the complement

/*
 [:]
 Find teh sum of 7
 [1, 3, 2, 3, 4, 4]
 Look in the dicy for the complement
 complement = 7 - 1 -> dict is empty
 -> [1:0]
 complement = 7 - 3
 -> [1:0, 3:1]
 complement = 7 - 2
 -> [1:0, 3:1, 2:2]
 complement = 7 - 3
 -> [1:0, 3:1, 2:2, 3:3]
 complement = 7 - 4
 -> [1:0, 3:1, 2:2, 3:3, 4:4] at this point complement exist
 
 **/
func sumOfTwoNumberN(numbers: [Int], target: Int) -> [Int]? {
    var dict = [Int:Int]()
    for (index, value) in numbers.enumerated() {
        let complement = target - value
        if let complementIndex = dict[complement] {
            return [complementIndex, index]
        }
        dict[value] = index
    }
    return nil
}
//sumOfTwoNumber(numbers: numbers, target: 11)

sumOfTwoNumberN(numbers: numbers, target: 7)

