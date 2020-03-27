//
//  _23_合并K个排序链表.swift
//  Algorithm
//
//  Created by duzj on 2020/3/27.
//  Copyright © 2020 duzj. All rights reserved.
//

/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

 示例:

 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

import Foundation

class _23_合并K个排序链表 {
    //类似归并排序 ,分治的思想
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        return mergeSort(lists, begin: 0, end: lists.count)
    }
    
    func mergeSort(_ list : [ListNode?] , begin : Int  , end : Int) -> ListNode? {
        if end - begin  == 1 {
            return list[begin]
        }
        let middle = (begin + end) >> 1
        
        let p1 = mergeSort(list, begin: begin, end: middle)
        let p2 = mergeSort(list, begin: middle, end: end)
        
        return merge(p1: p1, p2: p2)
    }
    
    func merge( p1 : ListNode? , p2 : ListNode? ) -> ListNode? {
        if p1 == nil {
            return p2
        }else if (p2 == nil){
            return p1
        }else if (p1!.val > p2!.val){
            p2?.next = merge(p1: p1, p2: p2?.next)
            return p2
        }else{
            p1?.next = merge(p1: p1?.next, p2: p2)
            return p1
        }
    }
    
}
