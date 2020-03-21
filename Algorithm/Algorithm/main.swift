//
//  main.swift
//  Algorithm
//
//  Created by duzj on 2019/11/6.
//  Copyright © 2019 duzj. All rights reserved.
//

import Foundation

print("Hello, World!")
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

