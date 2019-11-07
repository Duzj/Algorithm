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
/*
 插入排序的思想和我们打扑克摸牌的时候一样，从牌堆里一张一张摸起来的牌都是乱序的，我们会把摸起来的牌插入到左手中合适的位置，让左手中的牌时刻保持一个有序的状态。
 那如果我们不是从牌堆里摸牌，而是左手里面初始化就是一堆乱牌呢？ 一样的道理，我们把牌往手的右边挪一挪，把手的左边空出一点位置来，然后在乱牌中抽一张出来，插入到左边，再抽一张出来，插入到左边，再抽一张，插入到左边，每次插入都插入到左边合适的位置，时刻保持左边的牌是有序的，直到右边的牌抽完，则排序完毕。
 */
class Solution2 {
    //写法 1
    func sort(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for i in (1 ..< len){
            for j in (1 ... i).reversed(){
                if arr[j] < arr[j-1]{
                    let temp = arr[j]
                    arr[j] = arr[j-1]
                    arr[j-1] = temp
                } else{
                    break
                }
            }
        }
        return arr
    }
    
    //进阶写法 1
    func sort1(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for i in (1 ..< len){ //从下标为 1 的元素开始选择合适的位置插入,因为下标为o 的元素只有一个默认是有序的
            
            let tmp = arr[i] //记录将要插入的元素
            var tmp_j = i
            for j in (1 ... i).reversed(){
                if tmp < arr[j-1] {
                    arr[j] = arr[j-1]
                }else{
                    tmp_j = j
                    break
                }
            }
            
            if tmp_j != i {
                arr[tmp_j] = tmp
            }
        }
        return arr
    }
    
    //进阶写法 2
    func sort2(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        for i in (1 ..< len){ //从下标为 1 的元素开始选择合适的位置插入,因为下标为o 的元素只有一个默认是有序的
            
            let tmp = arr[i] //记录将要插入的元素
            var j = i
    
            while (j > 0) && (tmp < arr[j - 1]) {
                arr[j] = arr[j-1]
                j -= 1
            }
            
            if j != i { //存在比他小的书插入
                arr[j] = tmp
            }
        }
        return arr
    }
}

Solution2().sort([2,7,1,4,6,8,12,11,12,90,22,34,23])


str = "4.希尔排序"
/*
 分组插入排序
 希尔排序这个名字，来源于它的发明者希尔，也称作“缩小增量排序”，是插入排序的一种更高效的改进版本。
 我们知道，插入排序对于大规模的乱序数组的时候效率是比较慢的，因为它每次只能将数据移动一位，希尔排序为了加快插入的速度，让数据移动的时候可以实现跳跃移动，节省了一部分的时间开支。
 */

class Solution3 {
    
    func sort(_ a : [Int]) -> [Int] {
        var arr = a
        let len = arr.count
        
        var gap = len / 2 //步长
        
        while gap > 0 {
            for i in (gap ..< len) {
                let tmp = arr[i] //固定步长的一组数中的最后一个数
                
                var j = i - gap //固定步长的数组中的前一个数
                
                while (j >= 0) && (tmp < arr[j]) {
                    arr[j + gap] = arr[j]
                    j = j - gap
                }
                
                if j != (i - gap) {
                    arr[j + gap] = tmp
                }
            }
            gap = gap / 2
        }
        
        return arr
    }
    
    
    func sort2(_ a : [Int]) -> [Int] {
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



str = "5.归并排序"
/*
 https://mp.weixin.qq.com/s?__biz=MzIxMjE5MTE1Nw==&mid=2653200029&idx=1&sn=51ecebafb9ff77baf3de71bdc4f67b78&chksm=8c99ec47bbee6551b0377b97e26670c4895d0c934051e4aa927e62bf9b64996b6e1f7459edfe&mpshare=1&scene=1&srcid=1031x5AKcxNGo7fTyIuAKJAP&sharer_sharetime=1572532174367&sharer_shareid=7404a055fdaf790908d4a0841a38713d%23rd

 归并字面上的意思是合并，归并算法的核心思想是分治法，就是将一个数组一刀切两半，递归切，直到切成单个元素，然后重新组装合并，单个元素合并成小数组，两个小数组合并成大数组，直到最终合并完成，排序完毕。
 
 申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列；

 设定两个指针，最初位置分别为两个已经排序序列的起始位置；

 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置；

 重复步骤 3 直到某一指针达到序列尾；

 将另一序列剩下的所有元素直接复制到合并序列尾。
 */
class Solution4 {
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
//: [Next](@next)
