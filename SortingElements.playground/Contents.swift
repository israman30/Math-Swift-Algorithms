import UIKit

// - MERGE SORT

/*
    - Part the array in smallers arrays, then mergen adding the smaller values first
 
           [5, 7, 2, 5, 1, 0, 3, 4, 6, 7]
                    /           \
          [5, 7, 2, 5, 1] [0, 3, 4, 6, 7]
            /       /   |    \      \   \
         [5, 7] [2, 5] [1] [0, 3] [4, 6] [7]
 
    [5] [7] | [2] [5] | [1] | [0] [3] | [4] [6] | [7]
          \      \       |     /         /         /
        [5, 7]  [2, 5]  [1] [0, 3]    [4, 6]     [7]
               \         |         /            /
         [2, 5, 5, 7]   [1] [0, 3, 4, 6]     [7]
                      \                  /
            [1, 2, 5, 5, 7] [0, 3, 4, 6, 7]
                           |
            [0, 1, 2, 3, 4, 5, 5, 6, 7, 7]
 */

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let left = mergeSort(arr: Array(arr[0..<arr.count / 2]))
    let right = mergeSort(arr: Array(arr[arr.count / 2..<arr.count]))
    
    return sort(left: left, right: right)
}

func sort(left: [Int], right: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    return mergedArray + left + right
}
