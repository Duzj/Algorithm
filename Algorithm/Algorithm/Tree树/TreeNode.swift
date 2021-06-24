//
//  TreeNode.swift
//  Algorithm
//
//  Created by duzj on 2020/4/8.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


class TreeNode : NSObject {
    var val : Int
    var left : TreeNode?
    var right : TreeNode?
    var parent : TreeNode?
    
    init(_ val : Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
    
    //是否是叶子节点
    func isLeaf() -> Bool {
        if self.left == nil && self.right == nil{
            return true
        }else{
            return false
        }
    }
    
    //是否有 2 个叶子节点
    func isHaveTwoLeaf() -> Bool {
        if self.left == nil || self.right == nil{
            return false
        }else{
            return true
        }
    }
    
    
}
