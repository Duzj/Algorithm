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
    func sort(_ a : [Int]) -> [Int] {
        if a.count < 2 {
            return a
        }
        
        var arr = a
        let length = arr.count
        var gap = length
        repeat{
            gap = gap / 2
            
            for i in (gap ..< length) {
                let tmp = arr[i]
                
                var j = i

                
                while j - gap >= 0  && tmp < arr[j - gap] {
                    arr[j] = arr[j - gap]
                    j = j - gap
                }
                
                if j != i{
                    arr[j] = tmp
                }
            }
        }while gap > 0
        
        return arr
    }
}


print(Solution().sort([2,7,1,4,6,8,12,11,12,90,22,34,23]))
