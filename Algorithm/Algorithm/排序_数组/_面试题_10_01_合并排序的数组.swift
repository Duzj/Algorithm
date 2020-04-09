//
//  _面试题_10_01_合并排序的数组.swift
//  Algorithm
//
//  Created by duzj on 2020/4/9.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

class _面试题_10_01_合并排序的数组 {
    func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {

        var p1 = m - 1
        var p2 = n - 1
        var p = A.count - 1

        while(p2 >= 0){
            if p1 >= 0{
                if A[p1] <= B[p2]{
                    A[p] = B[p2]
                    p2 -= 1
                }else{
                    A[p] = A[p1]
                    p1 -= 1
                }
            }else{
                A[p] = B[p2]
                p2 -= 1
            }

            p -= 1
        }
    }
}
