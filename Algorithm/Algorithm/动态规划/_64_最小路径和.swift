//
//  _64_最小路径和.swift
//  Algorithm
//
//  Created by duzj on 2020/4/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

 说明：每次只能向下或者向右移动一步。

 示例:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class _64_最小路径和 {
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        let m = grid.count;
//        let n = grid[0].count;
//        //初始化 dp 数组
//        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
//
//        dp[0][0] = grid[0][0]
//        for i in 1 ..< m {
//            dp[i][0] = dp[i-1][0] +  grid[i][0]
//        }
//
//        for j in 1 ..< n {
//            dp[0][j] = dp[0][j-1] + grid[0][j]
//        }
//
//        for i in 1 ..< m {
//            for j in 1 ..< n {
//                dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])
//            }
//        }
//        return dp[m-1][n-1]
//    }
    
    //优化 使用一维数组
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count;
        let n = grid[0].count;
        //初始化 dp 数组
        var dp = [Int](repeating: 0, count: n)
        
        dp[0] = grid[0][0]
        for i in 0 ..< m {
            for j in 0 ..< n {
                if i == 0 && j == 0 {
                    continue
                }
                if i == 0  {
                    dp[j] = dp[j-1] + grid[i][j]
                }else if j == 0 {
                    dp[j] = dp[j] + grid[i][j]
                }else{
                    dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
                }
            }
        }
        return dp[n-1]
    }
}

/*
 [[0,1],
 [1,0]]
 */
