//
//  _面试题_10_01_合并排序的数组.swift
//  Algorithm
//
//  Created by duzj on 2020/4/9.
//  Copyright © 2020 duzj. All rights reserved.
//


/*
 给定两个排序后的数组 A 和 B，其中 A 的末端有足够的缓冲空间容纳 B。 编写一个方法，将 B 合并入 A 并排序。

 初始化 A 和 B 的元素数量分别为 m 和 n。

 示例:

 输入:
 A = [1,2,3,0,0,0], m = 3
 B = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]
 说明:

 A.length == n + m


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sorted-merge-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class _面试题_10_01_合并排序的数组 {
    func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {

        var p1 = m - 1
        var p2 = n - 1
        var p = A.count - 1

        while(p2 >= 0){
            if p1 >= 0{
                if A[p1] <= B[p2]{
                    A[p] = B[p2]
                    p2 -= 1
                }else{
                    A[p] = A[p1]
                    p1 -= 1
                }
            }else{
                A[p] = B[p2]
                p2 -= 1
            }

            p -= 1
        }
    }
}
