//
//  _98_验证二叉搜索树.swift
//  Algorithm
//
//  Created by duzj on 2020/4/9.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation
/*
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _98_验证二叉搜索树 {
    //中序遍历 看是否是升序
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        inorder(root)
        return isBST

    }
    
    private var min = Int.min
    private var isBST = true
    func inorder(_ root : TreeNode? ){
        if root == nil {
            return
        }
        inorder(root!.left)
        let val = root!.val
        if val <= min {
            isBST = false
        }
        min = val
        inorder(root?.right)
    }
}


class _98_验证二叉搜索树1 {
    //中序遍历 看是否是升序
    func isValidBST(_ root: TreeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
        
        var min =  Int.min
        var stack = Stack<TreeNode>()
        var currentNode = root
        while !stack.isEmpty() || currentNode != nil{
            
            while currentNode != nil {
                stack.push(currentNode!)
                currentNode = currentNode?.left
            }
            
            currentNode = stack.pop()!
            
            let val = currentNode!.val
            if val <= min {
                return false
            }
            min = val
            
            currentNode = currentNode?.right
        }
        return true

    }
    

}
