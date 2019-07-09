import UIKit

/*
 Find the most common element in an array
 */

let list = ["cat", "dog", "bird", "mouse", "donkey", "horse", "cat", "dog", "cat", "cat", "biber", "dog"]

/*
 1.- Construct a dictionary to find the most common element
 2.- Find the max number value for each element
*/

func mostCommonElement<T: Hashable>(str: [T]) -> T {
    
    var commonElement: T!
    
    var dictString = [T : Int]()
    // Construct the array dictionary
    for element in str {
        if let count = dictString[element] {
            dictString[element] = count + 1
        } else {
            dictString[element] = 1
        }
    }
    
    var max = 0
    
    for (key, value) in dictString {
        if value > max {
            max = value
            commonElement = key
        }
    }
    return commonElement
}
// Find the most common element in a String

func mosCommonChar(str: String) -> String {
    
    var dict = [String : Int]()
    var commonChar = ""
    var count = 0
    
    for char in str {
        let char = String(char)
        if let common = dict[char] {
            dict[char] = common + 1
        } else {
            dict[char] = 1
        }
    }
    
    for (key, value) in dict {
        if value > count {
            count = value
            commonChar = key
        }
    }
    return commonChar
}

