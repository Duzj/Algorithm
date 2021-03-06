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
 https://mp.weixin.qq.com/s/b9-dkpAhWJYshuSs5cwnOw
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

 https://mp.weixin.qq.com/s/885uGVhlffWAxjgIEW-TiA

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




str = "6.快速排序"

/*
 https://mp.weixin.qq.com/s/PQLC7qFjb74kt6PdExP8mw
 同冒泡排序一样，快速排序也属于交换排序，通过元素之间的比较和交换位置来达到排序的目的。
 不同的是，冒泡排序在每一轮只把一个元素冒泡到数列的一端，而快速排序在每一轮挑选一个基准元素，并让其他比它大的元素移动到数列一边，比它小的元素移动到数列的另一边，从而把数列拆解成了两个部分。
 这种思路就叫做分治法。
平均情况下需要logn轮，因此快速排序算法的平均时间复杂度是 O（nlogn）。 ,最差是O（n2)
 
 选定了基准元素以后，我们要做的就是把其他元素当中小于基准元素的都移动到基准元素一边，大于基准元素的都移动到基准元素另一边。
 具体如何实现呢？有两种方法：
 1.挖坑法
 2.指针交换法
 
 代码中，quickSort方法通过递归的方式，实现了分而治之的思想。
 partition方法则实现元素的移动，让数列中的元素依据自身大小，分别移动到基准元素的左右两边。
 */

class Solution5 {
    
    func quickSort(_ arr : inout [Int] , _ start : Int , _ end : Int) {
        // 递归结束条件：startIndex大等于endIndex的时候
        if start < end {
            // 得到基准元素位置
            let pivotIndex = partition(&arr, start, end)
            
            // 用分治法递归数列的两部分
            quickSort(&arr, start, pivotIndex)
            quickSort(&arr, pivotIndex + 1, end)
        }
    }
    
    
    //挖坑法
    /*
     在这里，我们使用移动方式是挖坑法。
     首先，我们选定基准元素Pivot，并记住这个位置index，这个位置相当于一个“坑”。并且设置两个指针left和right，指向数列的最左和最右两个元素：
     接下来，从right指针开始，把指针所指向的元素和基准元素做比较。如果比pivot大，则right指针向左移动 即 right -- ；如果比pivot小，则把right所指向的元素填入坑中。即 arr[left] = arr[right]
     同时，left向右移动一位 ,即 left ++ ,结束 right 指针的循环, 开始 left 指针循环
     left 指针循环
     接下来，我们切换到left指针进行比较。如果left指向的元素小于pivot，则left指针向右移动 (left ++ )；如果元素大于pivot，则把left指向的元素填入坑中(arr[right] = arr[left])
     同时，right向左移动一位 (right -- )
     
     */
    func partition(_ arr : inout [Int] , _ start : Int , _ end : Int ) -> Int {
        var pivotIndex = start
        var left = start
        var right = end
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
    /*
     开局和挖坑法相似，我们首先选定基准元素Pivot，并且设置两个指针left和right，指向数列的最左和最右两个元素：
     接下来是第一次循环，从right指针开始，把指针所指向的元素和基准元素做比较。如果大于等于pivot，则指针向左移动；如果小于pivot，则right指针停止移动，切换到left指针。
     轮到left指针行动，把指针所指向的元素和基准元素做比较。如果小于等于pivot，则指针向右移动；如果大于pivot，则left指针停止移动。
     这时候，我们让left和right指向的元素进行交换。
     然后进行第二轮,依次类推
     到最后, left 和 right 指针重合,此时退出循环
     然后把基准点指针和重合指针做交换,交换完,基准点左边的都是小于它的,右边都是大于它的,
     */
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
            
            //由于left一开始指向的是基准元素，判断肯定相等 ,下面要用 <=
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


str = "7.堆排序"
/*
 首先了解 二叉堆, 二叉堆本质上是一种完全二叉树
 二叉堆有  最大堆 和最小堆
 最大堆: 任何一个父节点的值都大于等于它的左右孩子结点
 最小堆: 任何一个父节点的值都小于等于它的左右孩子结点
 
 
 */

//: [Next](@next)
