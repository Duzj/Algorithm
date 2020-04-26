//
//  ListNode.swift
//  Algorithm
//
//  Created by duzj on 2020/3/21.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 链表题的常用技术点:
 
 1.快慢指针: 可以用于找链表的中间节点 , 或者判断链表是否有环
 
 */

//public class ListNode  {
public class ListNode : NSObject {

    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
