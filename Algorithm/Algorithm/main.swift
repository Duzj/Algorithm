//
//  main.swift
//  Algorithm
//
//  Created by duzj on 2019/11/6.
//  Copyright © 2019 duzj. All rights reserved.
//

import Foundation

print("Hello, World!")

class Solution20 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        
        if nums.count < 2{
            return nums
        }
        
        var cand1 = nums[0]
        var candCount1 = 0
        var cand2 = nums[0]
        var candCount2 = 0

        for num in  nums {
            if num == cand1 {
                candCount1 += 1
                continue
            }
            if num == cand2 {
                candCount2 += 1
                continue
            }
            if candCount1 == 0 {
                cand1 = num
                candCount1 += 1
                continue
            }
            if candCount2 == 0 {
                cand2 = num
                candCount2 += 1
                continue
            }
            candCount1 -= 1
            candCount2 -= 1
        }
        
        
        candCount1 = 0
        candCount2 = 0
        
        for num in nums {
            if cand1 == num {
                candCount1 += 1
                continue
            }
            if cand2 == num {
                candCount2 += 1
                continue
            }
        }
        
        var arr = [Int]()
        if candCount1 > nums.count/3 {
            arr.append(cand1)
        }
        if candCount2 > nums.count/3 {
            arr.append(cand2)
        }
        
        return arr
        
//        let nnar = nums.sorted()
//        return nnar[nnar.count/2]
        
        
        
        
        
        var dict = [Int : Int]()
        var tempNum = 0;
        var maxCount = nums.count / 3
        var result = [Int]()
        
        for i in 0 ..< nums.count {
            let num = nums[i]
            if  dict[num] == nil {
                dict[num] = 1
            }else{
                let count =  dict[num]!
                let newCount = count + 1
                dict[num] = newCount
            }
            if dict[num]! > maxCount{
//                maxCount = dict[num]!;
//                tempNum = num
                if !result.contains(num) {
                    result.append(num)
                }
            }
        }
        return result
    }
}

Solution20().majorityElement([1,2])


//class Solution2 {
//    func majorityElement(_ nums: [Int]) -> Int {
//
//
////        var count = 0
////        var temp = 0
////        if nums.count > 0 {
////            temp = nums[0]
////        }
////
////        for num in  nums {
////            if count == 0{
////                temp = num
////            }
////            if temp == num  {
////                count += 1
////            }else{
////                count -= 1
////            }
////        }
////        return temp
//
//
//
//
////        let nnar = nums.sorted()
////        return nnar[nnar.count/2]
//
//
//
//
//
//        var dict = [Int : Int]()
//        var tempNum = 0;
//        var maxCount = nums.count / 3
//        var result = [Int]()
//
//        for i in 0 ..< nums.count {
//            let num = nums[i]
//            if  dict[num] == nil {
//                dict[num] = 1
//            }else{
//                let count =  dict[num]!
//                let newCount = count + 1
//                dict[num] = newCount
//            }
//            if dict[num]! > maxCount{
////                maxCount = dict[num]!;
////                tempNum = num
//                if !result.contains(num) {
//                    result.append(num)
//                }
//            }
//        }
//        return result
//    }
//}
//
//print(Solution2().majorityElement([3,2,2]));


class Solution1 {
//    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
//        var minx = min(str1.count, str2.count)
//
//        var subStr = "";
//        while minx > 0 {
//
//            if (str1.count % minx == 0) && (str2.count % minx == 0) {
////                let index = str1.index(str1.startIndex, offsetBy: minx)
////                let index1 = str1.index(str1.startIndex, offsetBy: 0)
//
//                subStr = String(str1.prefix(minx))
//                if check(str1, subStr) && check(str2, subStr) {
//                    return subStr;
//                }
//            }
//            minx -= 1
//        }
//        return ""
//    }
//
//
//    func check(_ s : String , _ subs : String) -> Bool {
//        let count = s.count/subs.count
//        var i = 0
//        var tempStr = ""
//        while (i < count) {
//            tempStr += subs
//            i += 1
//        }
//        if s == tempStr {
//            return true
//        }else{
//            return false
//        }
//    }
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        
        if (str1 + str2) == (str2 + str1) {
            let maxL = gcd(str2.count , str1.count)
            return String(str1.prefix(maxL))
        }else{
            return ""
        }
    }

    func gcd(_ a: Int ,_ b:Int) -> Int{
        if b == 0 {
            return a
        }
        return gcd(b , a % b)
//        return b == 0 ? a : gcd(b , a % b)
    }
}


print(Solution1().gcdOfStrings("ABABAB", "ABAB"))


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
