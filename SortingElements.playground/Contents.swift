import UIKit

/*
 - INSERT SORT
 
 - Insert sort gets a pinter and insert the pointer if this one is less than the element compared
 [2,5,4,6,0,1,3]
 [2, 5|, 4, 6, 0, 1 ,3]
 [2, 5, 4|, 6, 0, 1 ,3] -> 5 > 4 = insert 4 before 5
 [2, 4|, 5, 6, 0, 1 ,3]
 [2, 4, 5|, 6, 0, 1 ,3]
 [2, 4, 5, 6|, 0, 1 ,3]
 [2, 4, 5, 6, 0|, 1 ,3] -> 6 > 0 = insert 0 before 6
 [2, 4, 5, 0|, 6, 1 ,3] -> 5 > 0 = insert 0 before 5
 [2, 4, 0|, 5, 6, 1 ,3] -> 4 > 0 = insert 0 before 4
 [2, 0|, 4, 5, 6, 1 ,3] -> 2 > 0 = insert 0 before 2
 [0|, 2, 4, 5, 6, 1 ,3] -> pointer will keep looping depending on the condition
 [0, 2, 4, 5, 6, 1| ,3] -> pointer will do as same zero, will keep inserting till get less than the minimun element
 
 */

func insertSort(array: [Int]) -> [Int] {
    var a = array
    for i in 0..<a.count {
        var j = i
        while j > 0 && a[j] < a[j - 1] {
            a.swapAt(j - 1, j)
            j -= 1
        }
    }
    return a
}



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

/*
  - Merge function takes an array and cut it using recursion.
  - When the array is cut it we create two arrays, left and right everytime the function is called.
 */
func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let left = mergeSort(arr: Array(arr[0..<arr.count / 2]))
    let right = mergeSort(arr: Array(arr[arr.count / 2..<arr.count]))
    
    return sort(left: left, right: right)
}

/*
 - sort function takes left and right array from the cut array.
 - From each side, compare the first element of the arrays and depending on the condition we pull the first element,
 and appended to a container.
 - In the return the container is added with the reminders of the left and right arrays.
 */
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








