import UIKit

func permuteWirth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)   // display the current permutation
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

let letters = [ "x", "y", "z" ]
permuteWirth([ "x", "y", "z" ], 2)
//permuteWirth([ "x", "y", "z" ], 1)
//permuteWirth([ "x", "y", "z" ], 0)   // prints ["x", "y", "z"]

class Permutations {
    private static var trace: String = ""
    static func generateAnagrams(line: String) {
        if(line.count == 1){
            trace.append(contentsOf: line)
            print("\(trace)")
            trace = trace.replacingOccurrences(of: line, with: "")
        } else {
            for i in line {
                trace.append(i)
                generateAnagrams(line: line.replacingOccurrences(of: String(i), with: ""))
                trace = trace.replacingOccurrences(of: String(i), with: "")
            }
        }
    }
}
