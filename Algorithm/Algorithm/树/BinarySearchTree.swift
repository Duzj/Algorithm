//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by duzj on 2020/4/8.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

//简称 BST,二叉搜索树又称作二叉查找树,二叉排序树
//左子节点都比根节点小  left < root
//右子节点都比根节点大 root < right
//它的左右指数也是一颗二叉搜索树
//可以提高搜索数据的效率, 存储的元素要具备可比较性
class BinarySearchTree {
    
    var bstSize : Int = 0
    var root : TreeNode?
    
    init() {
//        parentNode = TreeNode(0)
    }
    
    //元素的数量
    func size() -> Int {
        return bstSize
    }
    
    //是否为空
    func isEmpty() -> Bool {
        return bstSize == 0
    }
    
    //i清空所有元素
    func clear() {
        root = nil
        bstSize = 0
    }
    
    func add(_ val : Int)  {
        if root == nil {
            root!.val = val
            bstSize += 1
            return
        }
        
        let newNode = TreeNode(val)
        var temp = root
        var parent = root
        var compare = 0
        while temp != nil {
            parent = temp
            compare = val - temp!.val
            if compare < 0 {
                temp = temp?.left
            }else if compare > 0 {
                temp = temp?.right
            }else{
                break
            }
        }
        if compare > 0 {
            parent!.right = newNode
        }else if compare < 0  {
            parent!.left = newNode
        }else{
            parent = newNode
        }
        bstSize += 1
    }
    
    func remove(_  val : Int)  {
        
    }
    
    func contains(_ val : Int) -> Bool {
        return   getNode(val) != nil
    }
    
    
    func getNode(_ val : Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        var temp = root
        while temp != nil  {
            let compare = val - temp!.val
            if compare > 0 {
                temp = temp?.right
            }else if compare < 0{
                temp = temp?.left
            }else{
                return temp
            }
        }
        return nil
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
        
        while node?.parent != nil && node?.parent!.right == node {
            node = node?.parent
        }
        
        //node.parent == nil 或者 node.parent.left == nil
        return node?.parent
    }
}
