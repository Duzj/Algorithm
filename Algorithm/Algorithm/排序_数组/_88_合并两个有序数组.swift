//
//  _88_合并两个有序数组.swift
//  Algorithm
//
//  Created by duzhijian on 2020/3/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 https://leetcode-cn.com/problems/merge-sorted-array/
 
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 num1 成为一个有序数组。

  

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
  

 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class _88_合并两个有序数组 {
    
//    当前解法 ： 双指针后序遍历  ； 另外可以 双指针前序遍历 ，也可以先合并数组再排序
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var i1 = m - 1 //倒序便利 nums1
        var i2 = n - 1 //倒序便利 nums2
        var current = nums1.count - 1
        
        while i2 >= 0 {
        
            if i1 >= 0 {
                if nums1[i1] > nums2[i2] {
                    nums1[current] = nums1[i1]
                    current -= 1
                    i1 -= 1
                }else{
                    nums1[current] = nums2[i2]
                    current -= 1
                    i2 -= 1
                }
            }else{ //nums1的有效数据走完了
                nums1[current] = nums2[i2]
                current -= 1
                i2 -= 1
            }
        }
    }
}
