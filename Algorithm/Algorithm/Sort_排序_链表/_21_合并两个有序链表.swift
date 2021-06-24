//
//  _21_合并两个有序链表.swift
//  Algorithm
//
//  Created by duzj on 2020/3/27.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class _21_合并两个有序链表 {
    //迭代法
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let  preNode = ListNode(0);
        var p1 = l1
        var p2 = l2
        var current = preNode
        while p1 != nil || p2 != nil {
            
            if p2 == nil {
                current.next = p1
                break
            } else if p1 == nil {
                current.next = p2
                break
            }else{
                if p1!.val <= p2!.val{
                     current.next = p1
                     current = current.next!
                     p1 = p1?.next
                 }else{
                     current.next = p2
                     current = current.next!
                     p2 = p2?.next
                 }
            }
        }
        return preNode.next
    }
    
    
    //递归法
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l2 == nil {
            return l1
        }else if l1 == nil{
            return l2
        }else if l1!.val > l2!.val{
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }else{
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }
    }
}
