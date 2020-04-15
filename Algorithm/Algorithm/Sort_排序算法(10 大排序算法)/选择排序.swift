//
//  选择排序.swift
//  Algorithm
//
//  Created by duzj on 2020/3/25.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 ◼ 执行流程
 1 从序列中找出最大的那个元素，然后与最末尾的元素交换位置
 ✓ 执行完一轮后，最末尾的那个元素就是最大的元素
 2 忽略 1 中曾经找到的最大元素，重复执行步骤 1
 ◼思考 选择排序是否还有优化的空间?
 ✓ 使用堆来选择最大值
  ◼ 选择排序的交换次数要远远少于冒泡排序，平均性能优于冒泡排序
 ◼ 最好、最坏、平均时间复杂度:O(n2)，空间复杂度:O(1)，属于不稳定排序
 */


/*
 选择排序的思路是这样的：首先，找到数组中最小的元素，拎出来，将它和数组的第一个元素交换位置，第二步，在剩下的元素中继续寻找最小的元素，拎出来，和数组的第二个元素交换位置，如此循环，直到整个数组排序完成。
 至于选大还是选小，这个都无所谓，你也可以每次选择最大的拎出来排，也可以每次选择最小的拎出来的排，只要你的排序的手段是这种方式，都叫选择排序。
 时间复杂度 为 O(n2)
 */

class 选择排序 {
    func selectionSort(_  a  :  [Int])  -> [Int]{
        let n = a.count
        var arr = a
        
        for end in (0 ..< n).reversed() { //外层 for 循环控制总循环次数
            var maxIndex = 0
            for start in (0 ... end) { //内层 for 循环每次走完整个循环找到一个最大值, 然后交换位置
                if arr[maxIndex] < arr[start] {
                    maxIndex = start //选出一个最大值
                }
            }
            let temp = arr[end]
            arr[end] = arr[maxIndex]
            arr[maxIndex] = temp
        }
        return arr
    }
}
