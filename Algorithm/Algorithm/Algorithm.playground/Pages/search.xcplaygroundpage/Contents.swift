//: [Previous](@previous)

import Foundation

var str = "查找算法"

str = "二分查找"
/*
 https://mp.weixin.qq.com/s?__biz=MzUyNjQxNjYyMg==&mid=2247485240&idx=1&sn=fbccc747b2e8558c6478171709005ff9&chksm=fa0e68b9cd79e1af5ab68d42adea0b24c7d4867069091df9e95b6f20ab57b69c4e38994a36be&scene=21#wechat_redirect
 在计算机科学中，二分查找（英语：binary search），也称折半搜索（英语：half-interval search）、对数搜索（英语：logarithmic search），是一种在有序数组中查找某一特定元素的搜索算法。
 搜索过程从数组的中间元素开始，如果中间元素正好是要查找的元素，则搜索过程结束；
 如果某一特定元素大于或者小于中间元素，则在数组大于或小于中间元素的那一半中查找，而且跟开始一样从中间元素开始比较。
 如果在某一步骤数组为空，则代表找不到。
 这种搜索算法每一次比较都使搜索范围缩小一半。
 */
class Solution {
    func binary(_ arr : [Int] , _ data : Int) -> Int {
        
        var min = 0
        var max = arr.count - 1
        var mid = 0
        while min <= max {
//            mid = (min + max) / 2 //在 max 和 min 很大的情况下,会溢出(max 为 Int 最大值时,此时在加一个数,就溢出了)
//            mid = min + (max - min)/2 //改进写法
            mid = min + ((max - min) >> 1 )  //跟牛逼的写法, 至于为啥,我也不知道
//            print(mid)
            if arr[mid] > data {
                max = mid - 1
            }else if arr[mid] < data {
                min = mid + 1
            }else{
                return mid
            }
        }
        return -1;
    }
}

Solution().binary([1,2,3,4,6,8,12,16,18,90], 90)
//: [Next](@next)
