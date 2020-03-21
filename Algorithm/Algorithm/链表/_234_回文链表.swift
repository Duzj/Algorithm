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
    
    //快慢指针法  或者数组列表发;数组列表法是先遍历链表,把链表的值放到数组中,然后从数组的开头和结尾向中间遍历,看值是否相等,因为要额外只用一个数组,因此控件复杂度 O(n)
    //下面是快慢指针法
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        //快慢指针先找到中间结点
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        //翻转链表的后半部分
        var newHead : ListNode? = nil
        var current = slow
        while current != nil {
            let  temp = current?.next
            current?.next = newHead
            newHead = current
            current = temp
        }
        
        //比较值
        var originHead = head
        while newHead != nil {
            if newHead?.val != originHead?.val {
                return false
            }
            newHead = newHead?.next
            originHead = originHead?.next
        }
        
        return true
    }
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

 _234_回文链表().isPalindrome(node)
 */
