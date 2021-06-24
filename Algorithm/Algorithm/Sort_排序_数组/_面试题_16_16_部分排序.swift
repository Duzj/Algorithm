//
//  _面试题_16_16_部分排序.swift
//  Algorithm
//
//  Created by duzhijian on 2020/3/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 https://leetcode-cn.com/problems/sub-sort-lcci/
 
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

 示例：

 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 提示：

 0 <= len(array) <= 1000000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sub-sort-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */

class _面试题_16_16_部分排序 {
    //寻找最左最右逆序对
    func subSort(_ array: [Int]) -> [Int] {
        let arrLength = array.count

        if arrLength <= 1 {
            return [-1 , -1];
        }
        
        var j = 1
        var max = array.first!
        var r = -1
        while j < arrLength {
            let cur = array[j]
            if cur >= max {
                max = cur
            }else{
                r = j
            }
            j += 1
        }
//        [1,3,9,7,5]
        
        if r ==  -1 {
            return [-1 , -1]
        }
        

        var l = -1
        var min = array.last!
        var  i = arrLength - 2
        while i >= 0 {
            let cur = array[i]
            if cur <= min {
                min = cur
            }else{
                 l = i
            }
            i -= 1
        }
        return [l , r]
    }
}
