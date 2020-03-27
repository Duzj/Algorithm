//
//  归并排序.swift
//  Algorithm
//
//  Created by duzj on 2020/3/25.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

class 归并排序 {
    
    //先把数组分割成无数个小数组,在对每个数组进行排序,当分割到每个数组中只有一个元素时,这个时候 这个只有一个元素的数组默认就是有序的,然后在依次合并数组
    
/*
      
◼ 执行流程
     1 不断地将当前序列平均分割成2个子序列
     ✓ 直到不能再分割(序列中只剩1个元素)
     2 不断地将2个子序列合并成一个有序序列
     ✓ 直到最终只剩下1个有序序列
     */
    
//  由于归并排序每次都是均分一个数组为子序列, 所以他的时间复杂度为 O(nlogn) ,属于稳定排序
    func sort(_ arr : inout [Int])  {
        mergeSort(&arr, begin: 0, end: arr.count)
    }
    
    func mergeSort(_ arr : inout  [Int] , begin : Int , end : Int){
        
        if end - begin <= 1 {
            return
        }
        
//        let middle = begin + (end - begin) >> 1
        let middle =  (end + begin) >> 1

        mergeSort(&arr, begin: begin, end: middle)
        mergeSort(&arr, begin: middle, end: end)
        
        merge(&arr, begin: begin, middle: middle, end: end)
    }
    
    func merge(_ arr : inout [Int] , begin : Int , middle : Int , end : Int) {
        //需要 merge 的 2 组序列是存在于同一个数组中,
        //为了更好的进行排序,把其中一个数组拷贝出来,比如前办部分[begin , end), 这个时候那拷贝出来的前半部分数组 和 原数组的后半部分进行比较,然后替换原数组中的数据
        var leftArr = [Int]()
        for i in (begin ..< middle) {
            leftArr.append(arr[i])
        }
        
        var left_i = 0 //左边数组的开始 ,基于 拷贝出来的 leftArr
        let left_end = middle - begin //左边数组的结束, 基于拷贝出来的 leftArr
        var right_i = middle // 右边数组的开始 结束 基于 原数组[middle , end)
        var arr_i = begin //原数组的遍历索引

//        while left_i < middle || right_i < end {
            
        while left_i < left_end {
            if right_i < end && (leftArr[left_i] > arr[right_i]) { //这里后面的比较如果加上= ,会变成不稳定排序
                arr[arr_i] = arr[right_i] //拷贝右边数组到 arr
                right_i += 1
            }else{
                arr[arr_i] = leftArr[left_i] //拷贝左边数组到 arr
                left_i += 1
            }
            arr_i += 1
        }
    }
}
