//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"
str = "排序"

str = "1.冒泡排序"
/*
 https://mp.weixin.qq.com/s?__biz=MzUyNjQxNjYyMg==&mid=2247485556&idx=1&sn=344738dd74b211e091f8f3477bdf91ee&chksm=fa0e67f5cd79eee3139d4667f3b94fa9618067efc45a797b69b41105a7f313654d0e86949607&scene=21#wechat_redirect
 https://mp.weixin.qq.com/s?__biz=MzUyNjQxNjYyMg==&mid=2247484184&idx=1&sn=62965b401aa42107b3c17d1d8ea17454&chksm=fa0e6c99cd79e58f298e9026f677f912bd8c8e55edb48fc509b2b5834f05e529a9b47d59d202&scene=21#wechat_redirect
 冒泡排序无疑是最为出名的排序算法之一，从序列的一端开始往另一端冒泡（你可以从左往右冒泡，也可以从右往左冒泡，看心情），依次比较相邻的两个数的大小（到底是比大还是比小也看你心情）。
 #imageLiteral(resourceName: "640.gif")
 ## Image
 imageLiteral(resourceName: "640.gif")
 ![](image.png "640.gif")
 */
class Solution {
    //冒泡 时间复杂度 O(n2)
    func sort(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for k in (0 ..< len){
            
            for i in 0 ..< (len - k - 1) {
                if arr[i] > arr[i+1]{
                    let temp = arr[i]
                    arr[i] = arr[i+1]
                    arr[i+1] = temp
                }
            }
        }
        return arr
    }
    
    //优化冒泡排序
    /*
     冒泡有一个最大的问题就是这种算法不管不管你有序还是没序，闭着眼睛把你循环比较了再说。
     比如我举个数组例子：[ 9，8，7，6，5 ]，一个有序的数组，根本不需要排序，它仍然是双层循环一个不少的把数据遍历干净，这其实就是做了没必要做的事情，属于浪费资源。
     针对这个问题，我们可以设定一个临时遍历来标记该数组是否已经有序，如果有序了就不用遍历了。
     */
    func sort1(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for k in (0 ..< len){
            var isSort = true //假设已经是有序的
            for i in 0 ..< (len - k - 1) {
                if arr[i] > arr[i+1]{
                    let temp = arr[i]
                    arr[i] = arr[i+1]
                    arr[i+1] = temp
                    
                    isSort = false //如果有重新排序的就说明不是有序的,接着走 for 循环 进行排序
                }
            }
            if isSort { //如果是有序的说明 ,剩余的 都已经是有序的了, 到此结束循环
                break
            }
        }
        return arr
    }
}

Solution().sort1([2,7,1,4,6,8,12,11,12,90,22,34,23])




str = "2.选择排序"
/*
 选择排序的思路是这样的：首先，找到数组中最小的元素，拎出来，将它和数组的第一个元素交换位置，第二步，在剩下的元素中继续寻找最小的元素，拎出来，和数组的第二个元素交换位置，如此循环，直到整个数组排序完成。
 至于选大还是选小，这个都无所谓，你也可以每次选择最大的拎出来排，也可以每次选择最小的拎出来的排，只要你的排序的手段是这种方式，都叫选择排序。
 时间复杂度 为 O(n2)
 */
class Solution1 {
    func sort(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for i in (0 ..< len - 1 ){
            var minIndex = i
            for j in (i + 1 ..< len ) { //找出最小元素下标
                if arr[minIndex] > arr[j] {
                    minIndex = j
                }
            }
            
            let temp = arr[i]
            arr[i] = arr[minIndex]
            arr[minIndex] = temp
        }
        return arr
    }
}

Solution1().sort([2,7,1,4,6,8,12,11,12,90,22,34,23])



str = "3.插入排序"
class Solution2 {
    func sort(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        
        for i in (1 ..< len){
            
            var value = arr[i]
            
            for j in (0 ..< i){
                if arr[j] < value{
                    value = arr[j]
                }else{
                    
                }
            }
            
        }
        
        return arr
    }
}


//: [Next](@next)
