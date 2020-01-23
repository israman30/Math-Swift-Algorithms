import UIKit

// ======================= SINGLY LINKED LIST PLAYGROUND ========================
// =    * Node class                                                            =
// =    * Linked List class constructor                                         =
// =    1. Insert Node                                                          =
// =    2. Insert node value at index                                           =
// =    3. Pre-pend node value                                                  =
// =    4. Is list empty?                                                       =
// =    5. List length                                                          =
// =    6. First node value of the list                                         =
// =    7. Last node value of the list                                          =
// =    8. Delete a node value                                                  =
// =    9. Delete a node value duplicate                                        =
// =    10. Reverse linked list                                                 =
// =    11. Merge two linked list                                               =
// ==============================================================================

// =============================== Node Class ===================================
class Node {
    let value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

// =========================== Linked List constructor ==========================
class LinkedList {
    
    // Creating a reference for the list head
    var head: Node?
    
    // Insert a node value
    func insert(_ value: Int) {
        if head == nil {
            head = Node(value: value)
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(value: value)
    }
    
    /*
     Check if head is exist, if there is a no head then create a node head
     if head -> nil then new node = head
     else
        Getting a reference of the head and iterates in the list each node value
     Assign a new node for each value entered
     1   ->   2   -> nil
     head  new node
     **/
    
    // ==========================================================================
    // Insert at index
    func insertAt(_ position: Int, _ value: Int) {
        
        let newNode = Node(value: value)
        
        if position == 0 {
            newNode.next = head
            head = newNode
            return
        }
        var current = head
        var prev: Node?
        while current?.next != nil {
            prev = current
            current = current?.next
        }
        newNode.next = prev?.next
        prev?.next = newNode
    }
    /*
     Create a new node with the input
     if position == 0 then new node points to head then head becomes new node
     new node = 2
     head = 1 at position [0]
     new node -> 1
     1 = 2 then 2 -> 1
     
     else
        Holds reference of the current node and create a previus node to keep track of it
        previus becomes current then current becomes the pointer of the next node
     new node points to the pointer of previus
     pointer of previus become the new node
     
     new node = 2, current = 1, prev = nil
        prev = 1
        1 = nil
     2 -> nil
     1 -> 2 -> nil
     
     **/
    
    // ==========================================================================
    // Prepend
    func prepend(_ value: Int) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }
    /*
     Crate a new node with the input value
     new node points to the head
     head becomes the new node
     
     1 -> nil
     
     new node = 2, head = 1
     -> 1 -> nil
     2 -> 1 -> nil
     **/
    
    // ==========================================================================
    // Is the list Empty?
    var isEmpty: Bool {
        return head == nil
    }
    /* If head is nil, then list is empty **/
    
    // ==========================================================================
    // List length
    var listLength: Int {
        var current = head
        var count = 0
        while current?.next != nil {
            current = current?.next
            count += 1
        }
        return count
    }
    /*
     Hold a reference of the head
     Iterate in the list is exist and keep the a count each iteration
     **/
    
    // ==========================================================================
    // First and last node of the list
    var first: Node? {
        return head
    }
    /* Return the head **/
    
    var last: Node? {
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        return current
    }
    /*
     Iterate in the list till the last node, then return it
     **/
    
    // ==========================================================================
    // Delete a node
    func delete(_ value: Int) {
        if head?.value == value {
            head = head?.next
            return
        }
        var current = head
        var prev: Node?
        while current?.next != nil && current?.value != nil {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
    /*
     Check if the the input value is equal to the head value then the next value becomes the first
     1 -> 2 -> nil
     value = 1, head = 1
     head = 2 then 2 -> nil
     
     else
        holds reference of current node and a previus
        1 -> 2 -> nil
        value = 2, current = 1, prev = nil
        prev = 1
        current = 2
    1 -> nil
     **/
    
    // ==========================================================================
    // Delete a duplicate node
    func deleteDuplicate() {
        var current = head
        var temp: Node?
        while current?.next != nil {
            if current?.value == current?.next?.value {
                temp = current?.next?.next
                current?.next = temp
            }
            current = current?.next
        }
    }
    /*
     1 -> 2 -> 2 -> 3 -> nil
     Holds reference of the head and a temporary node
     Iterates while list exist and check if the current value is equal to the value of thext node
        hold the reference of the next of the next value
        current poinst to that next of the next value
     current = 2, temp = nil
     2 == 2
        temp = 3
        2 -> 3
     then
     1 -> 2 -> 3 -> nil
     **/
    
    // ==========================================================================
    // Reverse List
    func reverseList() -> Node? {
        var current = head
        var prev: Node?
        var next: Node?
        while current?.next != nil {
            next = current
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
