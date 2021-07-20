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

func sumOfTwoNumbers(numbers: [Int], target: Int) -> Bool {
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

sumOfTwoNumbers(numbers: numbers, target: 2)
