//
//  插入排序.swift
//  Algorithm
//
//  Created by duzj on 2020/3/25.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation



/*
插入排序的思想和我们打扑克摸牌的时候一样，从牌堆里一张一张摸起来的牌都是乱序的，我们会把摸起来的牌插入到左手中合适的位置，让左手中的牌时刻保持一个有序的状态。
那如果我们不是从牌堆里摸牌，而是左手里面初始化就是一堆乱牌呢？ 一样的道理，我们把牌往手的右边挪一挪，把手的左边空出一点位置来，然后在乱牌中抽一张出来，插入到左边，再抽一张出来，插入到左边，再抽一张，插入到左边，每次插入都插入到左边合适的位置，时刻保持左边的牌是有序的，直到右边的牌抽完，则排序完毕。
*/

class 插入排序 {
    
    //1.找到一个元素
    func insertingSort(_ a : [Int]) -> [Int] {
        var arr = a
        let n = arr.count
        for i in (1 ..< n) { //外层 for 循环控制循环次数,没走完一次外面的 for 循环,代表 i 前面的元素是已经有序的了
            var current  = i
            while current > 0  && (arr[current] < arr[current - 1]) { //current 之前的元素已经有序了,这个时候比较当前值和前面的值,如果小于前面的值就一直交换位置,
                let temp = arr[current];
                arr[current] = arr[current - 1]
                arr[current - 1] = temp
                current -= 1
            }
        }
        return arr
    }
    
    
    //优化,上面的只要比前面的小每次都是要交换元素 要 3 行代码, 这个时候可以先记录当前位置, 在需要交换的时候直接换成向后移动,最后确定位置后,在把这个元素直接放到确定的位置, 这样交换元素的代码就少了
    //并且逆序对越多,优化就越明显, 因为上面的while 循环每次里面要执行 3 行代码, 现在优化后只需要执行一行,逆序对越多,效果就越好
    func insertingSort1(_ a : [Int]) -> [Int] {
        var arr = a
        let n = arr.count
        for i in (1 ..< n) { //外层 for 循环控制循环次数,没走完一次外面的 for 循环,代表 i 前面的元素是已经有序的了
            var current  = i
            let  curNum = arr[current]
            while current > 0  && (curNum < arr[current - 1]) { //current 之前的元素已经有序了,这个时候比较当前值和前面的值,如果小于前面的值就一直交换位置,
                arr[current] = arr[current - 1]
                current -= 1
            }
            arr[current] = curNum
        }
        return arr
    }
    
    
//    第三种优化, 插入排序可以认为,前面的一部分已经是有序的,这个时候可以优化 插入的位置的查找, 可以使用二分查找,找到合适的位置,然后在移动数组元素, 比上面的做法优化了查找的过程,二分查找 O(logn) ,上面的查找为 O(n)
    
}
