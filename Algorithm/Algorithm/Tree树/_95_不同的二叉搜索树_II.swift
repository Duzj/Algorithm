//
//  _95_不同的二叉搜索树_II.swift
//  Algorithm
//
//  Created by duzj on 2020/7/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 给定一个整数 n，生成所有由 1 ... n 为节点所组成的 二叉搜索树 。

  

 示例：

 输入：3
 输出：
 [
   [1,null,3,2],
   [3,2,null,1],
   [3,1,null,null,2],
   [2,1,3],
   [1,null,2,null,3]
 ]
 解释：
 以上的输出对应以下 5 种不同结构的二叉搜索树：

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
  

 提示：

 0 <= n <= 8

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-binary-search-trees-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

/**
* Definition for a binary tree node.
* public class TreeNode {
*     public var val: Int
*     public var left: TreeNode?
*     public var right: TreeNode?
*     public init() { self.val = 0; self.left = nil; self.right = nil; }
*     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
*     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
*         self.val = val
*         self.left = left
*         self.right = right
*     }
* }
*/

class _95_不同的二叉搜索树_II {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        
    }
}
