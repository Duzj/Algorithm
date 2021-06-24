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
class BinarySearchTree : BinaryTree {
    
    override init() {
//        parentNode = TreeNode(0)
    }
    
    func add(_ val : Int)  {
        if root == nil {
            root!.val = val
            treeSize += 1
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
        treeSize += 1
    }
    
    func remove(_  val : Int)  {
        var node = getNode(val)
        if node == nil {
            return
        }
        
        treeSize -= 1
        
        //删除分为 3 中情况,度为 2,度为 1,度为 0; 度是指当前节点有几个子节点(2 个,1 个,或者没有(就是叶子节点))
        /*
            如果是度为 2 的节点
            1.找前驱或者后继节点覆盖当前节点(找前驱或者后继都可以,二选一)
            2.然后删除对应的前驱或者后继节点
            注意如果节点度为 2,那么他的前驱或者后继节点的度只可能是 1 或者 0 ,要注意当前节点是跟节点情况
         
            如果是度为 1 的节点
            1.用当前节点的子节点(左节点,或者右节点)代替当前节点 ,要注意当前节点是跟节点情况
            
            如果是度为 0 的节点
            1.直接删除当前节点
         */
    
        //度为 2 的节点
        if node!.isHaveTwoLeaf() {
            //拿后继节点覆盖当前节点
            //拿到后继节点
            let ss = successor(node);
            //覆盖当前节点的值
            node!.val = ss!.val
            //此时 node 已经变成后继节点
            node = ss
        }
        
        //后继节点的后一个节点,(后继节点的的度必然是 1 或者 0)
        let replacementNode = node?.left == nil ? node?.right : node?.left
        
        //如果replacementNode 不是空,说明后继节点的度为 1,否则后继节点的度为 0
        if replacementNode != nil {
            //更改 parent
            replacementNode!.parent = node!.parent
            
            //如果是根节点
            if node?.parent == nil {
                root = replacementNode;
            } else if node!.right == replacementNode {
                node!.parent!.right = replacementNode
            }else{ //node!.left == replacementNode
                node!.parent!.left = replacementNode
            }
        }else{ //replacementNode == nil 当前节点的度为 0
            //如果node是根节点
            if node?.parent == nil {
                root = nil
            }else{//node不是y根节点,是叶子节点
                if node == node!.parent?.left {
                    node!.parent!.left = node;
                }else{
                    node!.parent!.right = node
                }
            }
        }
        
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
    
}
