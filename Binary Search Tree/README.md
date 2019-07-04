## Binary Search Tree
A **Binary Search Tree** is a node-based binary tree data structure which has the following properties:
- The left subtree of a node contains only nodes with keys lesser than the node's key
- The right subtree of a node contains only nodes with keys greater than the node's key
- The left and right subtree's are also binary search trees

A binary search tree's operations has the following complexities:
- **searching**: In general O(h) where h is the height of the BST; worst case O(n).
- **insertion**: In general O(h), worst case O(n).
- **deletion**: In general O(h), worst case O(n).

### Balanced Binary Search Trees
A **Height Balanced Binary Search Tree (AVL)** is a binary search tree with the additional property that the difference between the height of the left subtree and right subtree never exceeds more than 1. 

To check if a tree is height-balanced:
- get the height of the left and right subtrees
- if diff <= 1, they are balanced
- else, they are not balanced

A balanced binary search tree's operations has the following time complexities:
- **searching**: worst case O(log n)
- **insertion**: O(log n)
- **deletion**: O(log n)