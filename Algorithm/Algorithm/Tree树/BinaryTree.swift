//
//  BinaryTree.swift
//  Algorithm
//
//  Created by duzj on 2020/4/9.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

// 二叉树

class BinaryTree {
    
    var treeSize : Int = 0
    var root : TreeNode?
    
    init() {
            
    }
    
    //元素的数量
    func size() -> Int {
        return treeSize
    }
    
    //是否为空
    func isEmpty() -> Bool {
        return treeSize == 0
    }
    
    //i清空所有元素
    func clear() {
        root = nil
        treeSize = 0
    }
    
    func height() -> Int {
        return getHeight(root)
    }
    
    func getHeight(_ node : TreeNode? ) -> Int {
        if node == nil {
            return 0
        }
        let height = max(getHeight(node!.left), getHeight(node!.right)) + 1
        return height
    }
    
    
    //MARK: - 前序遍历 ,就是跟节点 放前面
    /*
     先访问根节点 -> 再前序遍历左子节点  -> 最后前序遍历右子节点
    或者
     先访问根节点 -> 再前序遍历右子节点  -> 最后前序遍历左子节点
     */
    func preorderTraversal() {
        preorder(root)
    }
    
    private func preorder(_ node : TreeNode? ){
        if node == nil {
            return
        }
        print(node!.val)
        preorder(node?.left)
        preorder(node?.right)
    }
    
    
    //MARK: -  中序遍历
    /*
     先中序遍历左子节点 -> 再访问根节点  ->  最后中序遍历右子节点
     这样遍历的结果是从小到大 依次 输出
     或者
     先中序遍历右子节点  ->  再访问根节点  ->  最后中序遍历左子节点
     这样遍历的g结果是从大到小  依次输出
     */
    func inorderTraversal() {
        inorder(root)
    }
    
    private func inorder(_ node : TreeNode? )  {
        if node == nil {
            return
        }
        inorder(node?.left)
        print(node!.val)
        inorder(node?.right)
    }
    
    //MARK:  - 后序遍历  就是根节点放后面
    /*
     后序遍历左子树 ->  后序遍历右子树  ->  最后根节点
     或者
     后序遍历右子树  ->  后序遍历左子树 ->  最后根节点
     */
    func postorderTraversal() {
        postorder(root)
    }
    
    func postorder(_ node : TreeNode? ) {
        if node == nil {
            return
        }
        inorder(node?.left)
        inorder(node?.right)
        print(node!.val)
    }
    
    //MARK:  - 层序 遍历 ,一层一层遍历
    /*
     使用队列
     1.先将根节点入队
     2.循环执行以下操作直到队列为空
     a.将队头结A点出栈,进行访问
     b. 将 A 的左子节点入队
     c. 将 A 的右子节点入队
     */
    func levelOrderTraversal()  {
        if root == nil {
            return
        }
        
        var que = Queue<TreeNode>()
        que.enQueue(element: root! )
        
        while !que.isEmpty() {
            
            let node = que.deQueue()!
            print(node.val)
            
            if node.left != nil {
                que.enQueue(element: node.left! )
            }
            if node.right != nil {
                que.enQueue(element: node.right! )
            }
        }
    }
    
    //获取节点前驱节点
    //前驱节点是中序遍历的前一个节点
    func predecessor(_ noded : TreeNode? ) -> TreeNode? {
        var node = noded
        if node == nil {
            return nil
        }
        //前驱结点在左子树(left.right.right.right......)
        if node!.left != nil {
            while node?.right != nil {
                node = node?.right
            }
            return node
        }
        
        //从父节点,祖父节点中寻找前驱结点
        while node?.parent != nil && node?.parent!.left == node {
            node = node?.parent
        }
        
        //node.parent == nil 或者 node.parent.left == nil
        return node?.parent
    }
    
    
    //获取节点后继节点
    //后继节点是中序遍历的后一个节点
    func successor(_ noded : TreeNode? ) -> TreeNode? {
        var node = noded
        if node == nil {
            return nil
        }
        //前驱结点在左子树(right.left.left.left......)
        if node!.right != nil {
            while node?.left != nil {
                node = node?.left
            }
            return node
        }
        // 从父节点、祖父节点中寻找前驱节点
        while node?.parent != nil && node?.parent!.right == node {
            node = node?.parent
        }
        
        //node.parent == nil 或者 node.parent.left == nil
        return node?.parent
    }
}
