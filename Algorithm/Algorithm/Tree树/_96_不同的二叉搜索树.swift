//
//  _96_不同的二叉搜索树.swift
//  Algorithm
//
//  Created by duzj on 2020/7/15.
//  Copyright © 2020 duzj. All rights reserved.
//

/*
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？

 示例:

 输入: 3
 输出: 5
 解释:
 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 通过次数57,832提交次数86,176

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-binary-search-trees
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

import Foundation

class _96_不同的二叉搜索树 {
    func numTrees(_ n: Int) -> Int {
               var arr = [Int](repeating: 0, count: n + 1)
        //当n位的长度为0 或者1是 所能构建的二叉树 都是只有1个，所以arr【0】，arr【1】 都是1
        arr[0] = 1
        arr[1] = 1
        if n < 2 {
            return 1;
        }
        if n == INT_MAX {
            
        }
        var i = 2
        while i <= n {
            var j = 1
            var sum = 0
            while j <= i { //计算每次以j为顶点的 长度为i的所能组成的树的个数
                sum += arr[j-1] * arr[i - j]
                j += 1
            }
            arr[i] = sum
            i += 1
        }
        
        return arr[n]
    }
}
