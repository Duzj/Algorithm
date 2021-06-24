//
//  141.环形链表.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/linked-list-cycle/
 给定一个链表，判断链表中是否有环。
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。


 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。


 示例 2：

 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。


 示例 3：

 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。

 
 */


class _141_环形链表 {
    
    //快慢指针
    func hasCycle(_ head : ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        //慢指针
        var slow = head;
        //快指针
//        var fast = head?.next;
        var fast = head;

//        while fast != nil && fast?.next != nil{
        while fast?.next != nil && fast?.next?.next != nil{
            slow = slow?.next;
            fast = fast?.next?.next;
            if  slow == fast! {
//            if  slow === fast! {
                return true
            }
        }
        return false
    }
    
    
    //hash set
    func hasCycle1(_ head : ListNode) -> Bool {
        var newHead = head
        var nodeSet = Set<ListNode>()
        while newHead != nil  && newHead.next != nil{
            if nodeSet.contains(newHead) {
                return true
            }else{
                nodeSet.insert(newHead)
            }
            newHead = newHead.next!
        }
        
        return false
    }
}


/*
 
 var node = ListNode(1);
 var node1 = ListNode(2);
 var node2 = ListNode(4);
 var node3 = ListNode(5);
 var node4 = ListNode(6);
 var node5 = ListNode(7);
 node.next = node1;
 node1.next = node2;
 node2.next = node3;
 node3.next = node4;
 node4.next = node5;
 //node5.next = node3;
 print(_141_环形链表().hasCycle(node))
 
 */
