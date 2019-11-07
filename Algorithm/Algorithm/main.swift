//
//  main.swift
//  Algorithm
//
//  Created by duzj on 2019/11/6.
//  Copyright © 2019 duzj. All rights reserved.
//

import Foundation

print("Hello, World!")

class Solution {
    
    func quickSort(_ arr : inout [Int] , _ start : Int , _ end : Int) {
        // 递归结束条件：startIndex大等于endIndex的时候
        if start < end {
            // 得到基准元素位置
            let pivotIndex = partition1(&arr, start, end)
            
            // 用分治法递归数列的两部分
            quickSort(&arr, start, pivotIndex)
            quickSort(&arr, pivotIndex + 1, end)
        }
    }
    
    
    //挖坑法
    func partition(_ arr : inout [Int] , _ start : Int , _ end : Int ) -> Int {

        var left = start
        var right = end
        // 坑的位置，初始等于pivot的位置
        var pivotIndex = start
        // 取第一个位置的元素作为基准元素
        let pivot = arr[pivotIndex]

        while left <= right {
            
            //从 right 指针开始向左比较移动
            while left <= right {
                if arr[right] < pivot {
                    arr[left] = arr[right]
                    pivotIndex = right
                    left += 1
                    break
                }else{
                    right -= 1
                }
            }
            //left指针从左向右进行比较
            while left <= right {
                if arr[left] > pivot {
                    arr[right] = arr[left]
                    pivotIndex = left
                    right -= 1
                    break
                }
                left += 1
            }
        }
        arr[pivotIndex] = pivot
        return pivotIndex
    }

    //指针交换法
    func partition1(_ arr : inout [Int] ,_ start : Int , _ end : Int ) -> Int {
        //记录原始基点的位置,默认拿第一个作为基点
        let pivotIndex = start
        var left = start
        var right = end
        
        //结束循环条件,最后交换完后 left == right
        while left != right {
            
            //先从 right 指针向左移动
            while left < right &&  arr[right] >= arr[pivotIndex] {
                right -= 1
            }
            
            while left < right && arr[left] <= arr[pivotIndex] {
                left += 1
            }
            
            //交换left和right指向的元素
            if left < right {
                let tmp = arr[left]
                arr[left] = arr[right]
                arr[right] = tmp
            }
            
        }
        //pivot和指针重合点交换
        let tmp = arr[left]
        arr[left] = arr[pivotIndex]
        arr[pivotIndex] = tmp
        return left
    }
    
}

var arr = [2,7,1,4,6,8,12,11,12,90,22,34,23]
Solution().quickSort(&arr , 0 , arr.count - 1)
print(arr)
