//
//  _75_颜色分类.swift
//  Algorithm
//
//  Created by duzhijian on 2020/3/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 https://leetcode-cn.com/problems/sort-colors/
 
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 注意:
 不能使用代码库中的排序函数来解决这道题。

 示例:

 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]
 进阶：

 一个直观的解决方案是使用计数排序的两趟扫描算法。
 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 你能想出一个仅使用常数空间的一趟扫描算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-colors
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

//3指针法，对 1，2，0的情况分别进行判断
class _75_颜色分类 {
    func sortColors(_ nums: inout [Int]) {
        var l = 0
        var r = nums.count - 1
        var i = 0
        
        while i <= r {
            let i_num = nums[i]
            if i_num == 1 {
                i += 1
            } else if ( i_num == 0 ) {
                swap(nums: &nums, i: i, j: l)
                l += 1
                i += 1
            } else {
                swap(nums: &nums, i: i, j: r)
                r -= 1
            }
        }
    }
    
    func swap(nums : inout  [Int] , i : Int , j : Int) {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
