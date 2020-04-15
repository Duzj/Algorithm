//
//  _203_移除链表元素.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 https://leetcode-cn.com/problems/remove-linked-list-elements/
 删除链表中等于给定值 val 的所有节点。
 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 
 */


class _203_移除链表元素 {
    
    //哨兵
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if  head == nil {
            return head;
        }
        //哨兵结点sentry ,sentinel ,防止删除头结点后无头问题
        //可以通过哨兵节点去解决它，哨兵节点广泛应用于树和链表中，如伪头、伪尾、标记等，
        //它们是纯功能的，通常不保存任何数据，其主要目的是使链表标准化，如使链表永不为空、永不无头、简化插入和删除。
        //在这里哨兵结点是伪头
        let sentinelHead = ListNode(0)
        sentinelHead.next = head
        var pre = sentinelHead
        var current = head
        while current != nil {
            if current?.val == val {
                pre.next = current?.next
            }else{
                pre = pre.next!
            }
            current = current?.next
        }
        
        return sentinelHead.next ?? nil
    }
    
    
    //递归
    func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
        if  head == nil {
            return head;
        }

        head?.next =  removeElements(head?.next, val)
        
        if  head?.val == val {
            return head?.next ?? nil
        }else{
            return head;
        }
    }
}
