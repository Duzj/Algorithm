//
//  冒泡排序.swift
//  Algorithm
//
//  Created by duzj on 2020/3/25.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
https://mp.weixin.qq.com/s?__biz=MzUyNjQxNjYyMg==&mid=2247485556&idx=1&sn=344738dd74b211e091f8f3477bdf91ee&chksm=fa0e67f5cd79eee3139d4667f3b94fa9618067efc45a797b69b41105a7f313654d0e86949607&scene=21#wechat_redirect
https://mp.weixin.qq.com/s?__biz=MzUyNjQxNjYyMg==&mid=2247484184&idx=1&sn=62965b401aa42107b3c17d1d8ea17454&chksm=fa0e6c99cd79e58f298e9026f677f912bd8c8e55edb48fc509b2b5834f05e529a9b47d59d202&scene=21#wechat_redirect
冒泡排序无疑是最为出名的排序算法之一，从序列的一端开始往另一端冒泡（你可以从左往右冒泡，也可以从右往左冒泡，看心情），依次比较相邻的两个数的大小（到底是比大还是比小也看你心情）。
*/

/*
 执行流程(
 1 从头开始比较每一对相邻元素，如果第1个比第2个大，就交换它们的位置 ✓ 执行完一轮后，最末尾那个元素就是最大的元素
 2 忽略 1 中曾经找到的最大元素，重复执行步骤 1，直到全部元素有序
 */

class 冒泡排序 { //从小到大排序
    //1. 双层 for 循环
    func bubbleSort(_ a : [Int]) -> [Int] {
        var arr = a
        var n = a.count
        for end in (1 ... n).reversed() { //外层 for 循环控制循环次数
            for start in 1 ..< end { //内层 for 循环来比较大小,每次确定一个最大的数换到最后面
                if arr[start] <  arr[start - 1] { //交换元素
                    let temp = arr[start];
                    arr[start] = arr[start - 1]
                    arr[start - 1] = temp
                }
            }
        }
        return arr;
    }
    
    
    //优化上面的冒泡排序, 假如数组已经是有序的了, 上面的效率就有点问题了
//    如果序列已经完全有序，可以提前终止冒泡排序
    func bubbleSort1(_ a : [Int]) -> [Int] {
        var arr = a
        var n = a.count
        for end in (1 ... n).reversed() { //外层 for 循环控制循环次数
             var isSorted = true //设置标识,认为数组已经是有序的了
            for start in 1 ..< end { //内层 for 循环来比较大小,每次确定一个最大的数换到最后面
                if arr[start] <  arr[start - 1] { //
                    isSorted = false // 假如进入了 if 说明数组还是无序的,接着遍历排序
                    let temp = arr[start];
                    arr[start] = arr[start - 1]
                    arr[start - 1] = temp
                }
            }
            
            //假如一直没有进入 if 判断里面 ,就是 isSort == true ;说明 数组已经是有序的了,这个时候直接 break 外层 for 循环就行
            if isSorted {
                break;
            }
        }
        return arr;
    }
    
    
    
    //继续优化上面的
    //假如这个数组 后半部分已经有序了 ,外层 for 循环就可以少走 已经有序的部分,最好的情况是完全有序
//    ◼ 如果序列尾部已经局部有序，可以记录最后1次交换的位置，减少比较次数
    func bubbleSort2(_ a : [Int]) -> [Int] {
        var arr = a
        var n = a.count
        for end in (1 ... n).reversed() { //外层 for 循环控制循环次数
            var sortedIndex = 1 //默认已经完全有序了,
            for start in 1 ..< end { //内层 for 循环来比较大小,每次确定一个最大的数换到最后面
                if arr[start] <  arr[start - 1] { //
                    sortedIndex = start; //假如进入了 if 说明数组还是无序的,接着遍历排序 ,记录最后一次进入 if 的 index ,这个index前面的是无序的.后面是有序的,所以下次外层 for 就可以知道 index 这个位置终止了
                    let temp = arr[start];
                    arr[start] = arr[start - 1]
                    arr[start - 1] = temp
                }
            }
            //这个index前面的是无序的.后面是有序的,所以下次外层 for 就可以知道 index 这个位置终止了
             n = sortedIndex
            //内层 for 循环走完一次,数组最后面的一个数就确定了, 2 次就确定 2 个,所以外层 for 循环的 n 在每次内循环走完一次可以做一次减 1 操作
        }
        return arr;
    }
}
