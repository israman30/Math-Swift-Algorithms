import UIKit

// // ======================= MERGE ARRAY PLAYGROUND ===========================
// ==============================================================================

func mergeSortArray(a: [Int], b: [Int]) -> [Int]? {
    var result = [Int]()
    var i = 0
    var j = 0
    while i < a.count && j < b.count {
        if a[i] < b[j] {
            result.append(a[i])
            i += 1
        } else {
            result.append(b[j])
            j += 1
        }
    }
    while i < a.count {
        result.append(a[i])
        i += 1
    }
    while j < b.count {
        result.append(b[j])
        j += 1
    }
    return result
}

/*
 Use a container as result and two pointers for each array
 Iterate in the two arrays if exist
    if element A less than element B
        append to the result container
        increase pointer A by one
    else
        append to result container
        increase pointer B by one
 Iterate in the A and B
    append the left element to result
    increase pointer A and B by one
 return result container
 
 T = O(n)
 S = O(A,B)
 
 **/

// Intersect two sorted arrays
func twoSortedArray(arr1: [Int], arr2: [Int]) -> [Int]? {
    var dict = [Int:Bool]()
    for i in arr1 {
        dict[i] = true
    }
    var commonst = [Int]()
    for j in arr2 {
        if dict[j] ?? false {
            commonst.append(j)
        }
    }
    return commonst
}
/*
 Use a dictionary to keep track of ocurrences
 Iterate in the array A
    construct the dictionary with the element as key and a boolean true as value
 user a container for commons
 Iterate in array B
    if dictionary value is false
        append to commons container
 
 T = O(n)
 S = (1)
 **/
