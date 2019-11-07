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

    func sort(_ arr : inout [Int]) {
        let length = arr.count
        mergeSort(&arr, 0, length-1)
    }
    
    func mergeSort(_ arr : inout [Int] , _ start : Int , _ end : Int) {
        if start < end {
            let middle = start + (end - start)/2
            mergeSort(&arr, start, middle)
            mergeSort(&arr, middle + 1, end)
            //合并数组
            merge(&arr, start, middle, end)
        }
    }
    
    func merge(_ arr : inout [Int] , _ start : Int , _ middle : Int , _ end : Int)  {
        var tempArray = [Int]()
        
        var p1 = start
        var p2 = middle + 1
        
        while p1 <= middle && p2 <= end {
            if arr[p1] < arr[p2] {
                tempArray.append(arr[p1])
                p1 += 1
            }else{
                tempArray.append(arr[p2])
                p2 += 1
            }
        }
        
        //说明left数组还有剩余,直接加入到 tmp
        while p1 <= middle {
            tempArray.append(arr[p1])
            p1 += 1
        }
        
        //说明right数组还有剩余,直接加入到 tmp
        while p2 <= end {
            tempArray.append(arr[p2])
            p2 += 1
        }
        
        for i in (0 ..< tempArray.count) {
            arr[start + i] = tempArray[i]
        }
    }
}

var arr = [2,7,1,4,6,8,12,11,12,90,22,34,23]
Solution().sort(&arr)
print(arr)
