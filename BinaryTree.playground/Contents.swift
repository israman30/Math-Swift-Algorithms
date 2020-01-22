import UIKit

// =========================== BINARY TREE PLAYGROUND ===========================
// =    * Binary Tree class                                                     =
// =    * Binary Tree constructor                                               =
// =    1. Insert Node                                                          =
// =    2. Search and return a boolean                                          =
// =    3. Search and return a tree                                             =
// =    4. Tree height                                                          =
// =    5. Tree depth                                                           =
// =    6. Minimun node                                                         =
// =    7. Maximun node                                                         =
// =    8. Delete all leaf                                                      =
// =    9. Delete a node                                                        =
// =    10. Inorder Traverse                                                    =
// =    11. Preorder Traverse                                                   =
// =    12. Postorder Traverse                                                  =
// =    13. Lever Order Traverse                                                =
// =    14. Array into a tree                                                   =
// =    15. Max depth of the tree                                               =
// =    16. Mirror the tree                                                     =
// ==============================================================================


// =========================== Binary Tree constructor ===========================
class BinaryTree {
    let value: Int
    var left: BinaryTree?
    var right: BinaryTree?
    var parent: BinaryTree?
    
    init(value: Int) {
        self.value = value
    }
    var queue = Queue<BinaryTree>()
}

// =========================== Binary Tree methods ===========================

extension BinaryTree {
    
    // Insert a value node
    func insert(_ value: Int) {
        if parent == nil {
            parent = BinaryTree(value: value)
            return
        }
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinaryTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinaryTree(value: value)
                right?.parent = self
            }
        }
    }
    
    /*
       Inserting a node value:
        Check if tree alredy exist parent == nil
            if parent == nil then build root/first node value
            else if input less or greates than parent node value
            left/right create node value then create child of that node value parent created
     **/
    
    // =================================================================
    // Search
    
    // Search if a value input exist in the tree
    func search(_ value: Int) -> Bool {
        if value == self.value {
            return true
        }
        if value < self.value {
            if let left = left {
                return left.search(value)
            }
        } else {
            if let right = right {
                return right.search(value)
            }
        }
        return false
    }
    /*
      Searching a node value:
       Check if value is equal to parent value return true
            else if value is less or greater than parent value
            check using recursion
    **/
    
    // =================================================================
    // Search and return a tree
    
    func searchAndReturnTree(_ value: Int) -> BinaryTree? {
        if value == self.value {
            return self
        }
        if value < self.value {
            if let left = left {
                return left.searchAndReturnTree(value)
            }
        } else {
            if let right = right {
                return right.searchAndReturnTree(value)
            }
        }
        return nil
    }
    
    // =================================================================
    // Height of the tree
    func height() -> Int? {
        if self.value == 0 {
            return 0
        }
        return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
    }
    /*
     If value if zero then return zero "0" as height
     else return the max value of the left/right plus one "increase each node till last one"
     **/
    
    // =================================================================
    // Depth of the tree
    func depth(value: Int) -> Int? {
        var depth = 0
        guard var tree = searchAndReturnTree(value) else { return 0 }
        while let parent = tree.parent {
            tree = parent
            depth += 1
        }
        return depth
    }
    /*
     User the search and return tree function to search for the value input
     Iterate in the tree parent and increase the depth variable by one
     **/
    
    func maxDepth(parent: BinaryTree?) -> Int {
        guard parent != nil else { return 0 }
        
        let leftDepth = maxDepth(parent: parent?.left)
        let rightDepth = maxDepth(parent: parent?.right)
        
        if leftDepth < rightDepth {
            return rightDepth + 1
        } else {
            return leftDepth + 1
        }
    }
    
    // =================================================================
    // Minimun & MAximun node value of the tree
    func minimun() -> BinaryTree? {
        var node = self
        while let left = node.left {
            node = left
        }
        return node
    }
    
    func maximun() -> BinaryTree? {
        var node = self
        while let right = node.right {
            node = right
        }
        return node
    }
    /*
     Mutate parent node and iterate into each left/right parent node, then return the min/max node
     **/
    
    // =================================================================
    // Deleting all leaf on the tree
    func deleteAllLeaf(parent: BinaryTree?) -> BinaryTree? {
        if parent?.left == nil && parent?.right == nil {
            return nil
        }
        parent?.left = deleteAllLeaf(parent: parent?.left)
        parent?.right = deleteAllLeaf(parent: parent?.right)
        
        return parent
    }
    /*
     Check in left/right parent is nil then return nil
     else assign to left/right the recursion of each parent and return the parent
     **/
    
    // =================================================================
    // Deleting a node
    func delete(value: Int) {
        guard let tree = searchAndReturnTree(value) else { return }
        if tree.left == nil && tree.right == nil {
            if value < tree.value {
                tree.parent?.left = nil
            } else {
                tree.parent?.right = nil
            }
        }
        if tree.left == nil || tree.right == nil {
            if value < tree.value {
                if tree.left != nil {
                    tree.parent?.left = tree.left
                } else {
                    tree.parent?.left = tree.right
                }
            } else {
                if tree.right != nil {
                    tree.parent?.right = tree.left
                } else {
                    tree.parent?.right = tree.right
                }
            }
        }
        if tree.left != nil && tree.right != nil {
            tree.removeChildren(tree: tree)
        }
    }
    func removeChildren(tree: BinaryTree?) {
        guard let newTree = searchAndReturnTree((tree?.minimun()!.value)!) else { return }
        
        if newTree.value < parent!.value {
            if newTree.parent?.value == tree?.value {
                tree?.parent?.left = newTree
                newTree.left = tree?.left
            } else {
                newTree.parent?.left = nil
                newTree.right = tree!.right
                newTree.left = tree!.left
                tree!.parent?.left = newTree
            }
        } else {
            if newTree.parent?.value == tree?.value {
                tree!.parent?.right = newTree
                newTree.left = tree!.left
            } else {
                newTree.parent?.left = nil
                newTree.right = tree!.right
                newTree.left = tree!.left
                tree!.parent?.right = newTree
            }
        }
    }
    
    // =================================================================
    // Traversing a tree
    
    // Inorder traverse
    func printInorderTraverse(parent: BinaryTree?) {
        if left != nil {
            left?.printInorderTraverse(parent: parent?.left)
        }
        print(value)
        if right != nil {
            right?.printInorderTraverse(parent: parent?.right)
        }
    }
    
    func inorderTraverseWithClouser(visit: (Int) -> ()) {
        left?.inorderTraverseWithClouser(visit: visit)
        visit(value)
        right?.inorderTraverseWithClouser(visit: visit)
    }
    
    func inorderAndReturnArray(parent: BinaryTree?) -> [Int] {
        if parent == nil {
            return []
        }
        var inorder = [Int]()
        inorder += inorderAndReturnArray(parent: parent!.left)
        inorder.append(parent!.value)
        inorder += inorderAndReturnArray(parent: parent!.right)
        
        return inorder
    }
    
    // Preorder traverse
    func printPreorderTraverse(parent: BinaryTree?) {
        print(value)
        if left != nil {
            left?.printPreorderTraverse(parent: parent?.left)
        }
        if right != nil {
            right?.printPreorderTraverse(parent: parent?.right)
        }
    }
    
    func preorderTraverseWithClouser(visit: (Int) -> ()) {
        visit(value)
        left?.preorderTraverseWithClouser(visit: visit)
        right?.preorderTraverseWithClouser(visit: visit)
    }
    
    func preorderAndReturnArray(parent: BinaryTree?) -> [Int] {
        if parent == nil {
            return []
        }
        var preorder = [Int]()
        preorder.append(parent!.value)
        preorder += preorderAndReturnArray(parent: parent!.left)
        preorder += preorderAndReturnArray(parent: parent!.right)
        
        return preorder
    }
    
    // Postorder traverse
    func printPostorderTraverse(parent: BinaryTree?) {
        if left != nil {
            left?.printPostorderTraverse(parent: parent?.left)
        }
        if right != nil {
            right?.printPostorderTraverse(parent: parent?.right)
        }
        print(value)
    }
    
    func postorderTraverseWithClouser(visit: (Int) -> ()) {
        left?.postorderTraverseWithClouser(visit: visit)
        right?.postorderTraverseWithClouser(visit: visit)
        visit(value)
    }
    
    func postorderAndReturnArray(parent: BinaryTree?) -> [Int] {
        if parent == nil {
            return []
        }
        var postorder = [Int]()
        postorder += postorderAndReturnArray(parent: parent!.left)
        postorder += postorderAndReturnArray(parent: parent!.right)
        postorder.append(parent!.value)
        
        return postorder
    }
    
    // =================================================================
    // Converte an array into a tree
    //  array = [2, 3, 4, 5, 6, 7, 8]
    //      5
    //     /  \
    //    4    6
    //   /  \  / \
    //  2   3  7  8
     
    func binaryTreeArray(_ array: [Int], _ firstIndex: Int, _ lastIndex: Int) -> BinaryTree? {
        if firstIndex > lastIndex {
            return nil
        }
        let midIndex = (firstIndex + lastIndex) / 2
        let node = BinaryTree(value: array[midIndex])
        
        node.left = binaryTreeArray(array, firstIndex, midIndex - 1)
        node.right = binaryTreeArray(array, midIndex + 1, lastIndex)
        
        return node
    }
    /*
     First index have to be less than last index, else return nil
     Construct a node value using midIndex
     assign left/right checking first index with last index using recursion
     **/
    
    // =================================================================
    // Mirror the tree
    func mirrorTree(parent: BinaryTree?) -> BinaryTree? {
        guard parent != nil else { return nil }
        
        mirrorTree(parent: parent?.left)
        mirrorTree(parent: parent?.right)
        
        let temp = parent?.left
        parent?.left = parent?.right
        parent?.right = temp
        
        return parent
    }
    
}

// Levelorder traverse using a Queue class

// Queue DS
class Queue<T> {
    
    var array = [T]()
    
    func add(value: T) {
        array.append(value)
    }
    
    func dequeue() -> T? {
        let deque = array.removeFirst()
        return deque as! T
    }
}

extension BinaryTree {
    
    func levelOrder() {
        guard let node = self.parent else { return }
        
        queue.add(value: node)
        
        while !queue.array.isEmpty {
            guard let dequeue = queue.dequeue() else { return }
            
            if let leftNode = dequeue.left {
                queue.add(value: leftNode)
            }
            if let rightNode = dequeue.right {
                queue.add(value: rightNode)
            }
        }
    }
    /*
     Get the initial/root node, add to the Queue
           5
          /  \
         4    6
        /  \  / \
       2   3  7  8
     Q => 5
     While the array container is not empty iterate and dequeue the node
     Check on left/right child and push/add to queue
     Q => 8|7|6|2|3|4|5
     **/
}


