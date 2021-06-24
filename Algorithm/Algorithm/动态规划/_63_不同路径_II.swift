//
//  _63_不同路径_II.swift
//  Algorithm
//
//  Created by duzj on 2020/4/26.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？



 网格中的障碍物和空位置分别用 1 和 0 来表示。

 说明：m 和 n 的值均不超过 100。

 示例 1:

 输入:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 输出: 2
 解释:
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _63_不同路径_II {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        
        //初始化动态数组,表示走到当前节点的最多方法
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        for i in 0 ..< m {
            for j in 0 ..< n{
                if i == 0 && j == 0 { //起始点为 1,只有一步就是起始点, 如果起始点有障碍,直接返回 0
                    dp[i][j] = 1
                }else if i == 0{ //第一行,如果当前有障碍,就置为 0 ,如果没有障碍就置为这一行前一步的值
                    if obstacleGrid[i][j] == 1 {
                        dp[i][j] = 0
                    }else{
                        dp[i][j] = dp[i][j - 1]
                    }
                    
                }else if j == 0{ //第一列, 如果有障碍就置为 0 ,如果没有障碍就置为这一列前一步的值
                    if obstacleGrid[i][j] == 1 {
                        dp[i][j] = 0
                    }else{
                        dp[i][j] = dp[i - 1][j]
                    }
                }else{ //既不是起点 ,也不是第一行,也不是第一列,那么走到这一步的最多方法为, 左边的值 + 上面的值
                    if obstacleGrid[i][j] == 1 {
                        dp[i][j] = 0
                    }else{
                        dp[i][j] = dp[i - 1][j]  + dp[i][j - 1]
                    }
                    
                }
            }
        }
        return dp[m-1][n-1]
    }
}
