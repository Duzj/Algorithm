//
//  _86_分隔链表.swift
//  Algorithm
//
//  Created by duzj on 2020/4/19.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation
/*
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _86_分隔链表 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil {
            return head
        }
        let dummyL = ListNode(0)
        let dummyR = ListNode(0)
        
        var originLast = head
        var lastL = dummyL
        var lastR = dummyR
        
        while (originLast != nil ){
            let temp = originLast?.next
            originLast?.next = nil
            if originLast!.val >= x {
                lastR.next = originLast
                lastR = lastR.next!
            }else{
                lastL.next = originLast
                lastL = lastL.next!
            }
            
            originLast = temp
        }
        
        lastL.next = dummyR.next
        
        return dummyL.next
    }
}
