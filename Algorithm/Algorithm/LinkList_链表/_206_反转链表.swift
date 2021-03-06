//
//  _206_反转链表.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-linked-list/
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class _206_反转链表 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        //非递归
        var newHead : ListNode? = nil
        var current = head
        while current != nil {
            let temp = current?.next
            current?.next = newHead
            newHead = current
            current = temp
        }
        return newHead
        
        //递归
//         if head == nil || head?.next == nil{
//            return head
//        }
//        let  newHead = reverseList(head?.next)
            //上面一句之后,除了头结点,其他的都已经有序了,下面是把头结点放到最后面
//        head?.next?.next = head
//        head?.next = nil
//        return newHead
    }
}
