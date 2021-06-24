//
//  _83_删除排序链表中的重复元素.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:

 输入: 1->1->2
 输出: 1->2
 示例 2:

 输入: 1->1->2->3->3
 输出: 1->2->3
 
 */

class _83_删除排序链表中的重复元素 {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil{
            return head
        }
        var current = head
        var pre = head
        while current != nil {
            if current!.val == current!.next?.val ?? 0 {
                current = current?.next

            }else{
                pre?.next = current?.next
                pre = pre?.next
                current = current?.next
            }
        }
        pre?.next = nil
        return head
    }
        
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        
        var nodeSet = Set<Int>()
        let  sentinelHead = ListNode(0)
        sentinelHead.next = head;
        var pre = sentinelHead
        var current = head
        while current != nil {
            let temp = current?.val ?? 0
            if nodeSet.contains(temp) {
                pre.next = current?.next
            }else{
                nodeSet.insert(temp)
                pre = current!;
            }
            current = current?.next
        }
        return sentinelHead.next ?? nil
    }
    
    //因为链表是排序的所以可以在优化一点
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        var tempHead = head
        while tempHead != nil && tempHead?.next != nil {
            if tempHead?.val == tempHead?.next?.val {
                tempHead?.next = tempHead?.next?.next
            }else{
                tempHead = tempHead?.next
            }
        }
        return head
        
    }
}
