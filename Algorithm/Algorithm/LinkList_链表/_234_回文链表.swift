//
//  _234_回文链表.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 
 https://leetcode-cn.com/problems/palindrome-linked-list/
 
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 */

class _234_回文链表 {
    
    
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil || head == nil{
            return true
        }

        if head?.next?.next == nil{
            if head!.val == head!.next!.val {
                return true
            }
        }

        var middle = findMiddle(head)

        var reverse = reverseList(middle)
        var current = head
        while reverse != nil && current != nil {
            if current!.val != reverse!.val{
                return false
            }else {
                current = current?.next;
                reverse = reverse?.next
            }

        }
        return true
    }


    func findMiddle(_ head : ListNode?) -> ListNode? {
        var show = head
        var fast = head
        while (fast?.next != nil && fast?.next?.next != nil){
            show = show?.next
            fast = fast?.next?.next
        }
        return show
    }

    func reverseList(_ head : ListNode?) -> ListNode? {
        if head?.next == nil || head == nil{
            return head
        }

        var newHead = reverseList(head?.next)
        head?.next?.next = head;
        head?.next = nil
        return newHead
    }
    
    
    //快慢指针法  或者数组列表发;数组列表法是先遍历链表,把链表的值放到数组中,然后从数组的开头和结尾向中间遍历,看值是否相等,因为要额外只用一个数组,因此控件复杂度 O(n)
    //下面是快慢指针法
//    func isPalindrome(_ head: ListNode?) -> Bool {
//        //为空,或者只有一个值 , 就是回文链表
//        if head == nil || head?.next == nil{
//            return true
//        }
//
//        //如果只有 2 个值 ,就判断这 2 个值是否相等,返回
//        if head!.next!.next == nil{
//            return (head!.next!.val == head!.val)
//        }
//
//
//        //如果链表的节点大于 3
//        //先找中间节点
//        var fast = head
//        var slow = head
//
//        while (fast?.next != nil && fast?.next?.next != nil){
//
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//
//        //slow 是中间节点
//        var rHead = slow
//        //翻转后半部分
//        var newRHead : ListNode? = nil
//        while (rHead != nil){
//            let temp = rHead?.next
//            rHead!.next = newRHead
//            newRHead = rHead
//            rHead = temp
//        }
//
//        var originHead = head
//        while (newRHead != nil) {
//            if newRHead!.val != originHead!.val{
//                return false
//            }
//            newRHead = newRHead?.next
//            originHead = originHead?.next
//        }
//
//        return true
//    }
    
    
//    func isPalindrome(_ head: ListNode?) -> Bool {
//        var fast = head
//        var slow = head
//        
//        //快慢指针先找到中间结点
//        while fast != nil && fast?.next != nil {
//            fast = fast?.next?.next
//            slow = slow?.next
//        }
//        
//        //翻转链表的后半部分
//        var newHead : ListNode? = nil
//        var current = slow
//        while current != nil {
//            let  temp = current?.next
//            current?.next = newHead
//            newHead = current
//            current = temp
//        }
//        
//        //比较值
//        var originHead = head
//        while newHead != nil {
//            if newHead?.val != originHead?.val {
//                return false
//            }
//            newHead = newHead?.next
//            originHead = originHead?.next
//        }
//        
//        return true
//    }
}

/*
 var node = ListNode(1);
 var node1 = ListNode(2);
 var node2 = ListNode(1);
 var node3 = ListNode(5);
 var node4 = ListNode(6);
 var node5 = ListNode(7);
 node.next = node1;
 node1.next = node2;
 //node2.next = node3;
 //node3.next = node4;
 //node4.next = node5;
 //node5.next = node3;

 //_234_回文链表().isPalindrome(node)
 print(_234_回文链表().isPalindrome(node));

 */
