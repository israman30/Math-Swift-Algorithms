import UIKit

// ============================= STACK PLAYGROUND ===============================
// =    * Binary Tree class                                                     =
// =    1. Push value                                                           =
// =    2. Pop value                                                            =
// =    3. Peek of the stack                                                    =
// =    4. Is empty?                                                            =
// =    5. Count                                                                =
// ==============================================================================

// Stack structure
struct Stack {
    
    var array = [Int]()
    
    mutating func push(_ value: Int) {
        array.append(value)
    }
    
    mutating func pop() -> Int? {
        return array.last
    }
    
    mutating func peek() -> Int? {
        return array.first
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}


// ====================== Node class ======================
// Node class
class Node {
    let value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

// Node stack + methods
struct NodeStack {
    
    var top: Node?
    
    mutating func push(_ value: Int) {
        let topNode = top
        top = Node(value: value)
        top?.next = topNode
    }
    
    mutating func pop() -> Int? {
        let current = top
        top = top?.next
        return current?.value
    }
    
    mutating func peek() -> Int? {
        return top?.value
    }
    
    var isEmpty: Bool {
        return top?.value == nil
    }
    
    var count: Int {
        var count = 0
        var current = top
        while current?.next != nil {
            current = current?.next
            count += 1
        }
        return count
    }
}

