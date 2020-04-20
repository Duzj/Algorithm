//
//  _2_两数相加.swift
//  Algorithm
//
//  Created by duzj on 2020/4/19.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class _2_两数相加 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if  l1 == nil {
            return l2
        }
        if l2 == nil{
            return l1
        }
        let dummyNode = ListNode(0)
        var lastNew = dummyNode
        var carry : Int = 0
        var p1 = l1
        var p2 = l2
        while (p1 != nil || p2 != nil ) {
            let a = p1?.val ?? 0
            let b = p2?.val ?? 0
            
            let  sum = a + b + carry
            carry = sum / 10
            lastNew.next = ListNode(sum % 10)
            lastNew = lastNew.next!
            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        if carry > 0 {
            lastNew.next = ListNode(1)
        }
        
        return dummyNode.next
    }
}
