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
}

