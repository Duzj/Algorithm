//
//  _977_有序数组的平方.swift
//  Algorithm
//
//  Created by duzj on 2020/4/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。

  

 示例 1：

 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 示例 2：

 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
  

 提示：

 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _977_有序数组的平方 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var i = 0 , j = nums.count - 1;
        while i <= j {
            if nums[i] * nums[i] > nums[j] * nums[j] {
                result.insert(nums[i] * nums[i], at: 0)
                i += 1
            }else{
                result.insert(nums[j] * nums[j], at: 0)
                j -= 1
            }
        }
        return result
    }
}
