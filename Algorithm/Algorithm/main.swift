//
//  main.swift
//  Algorithm
//
//  Created by duzj on 2019/11/6.
//  Copyright © 2019 duzj. All rights reserved.
//

import Foundation

print(_150_逆波兰表达式求值().evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]))

print(_856_括号的分数().scoreOfParentheses("(()(()))"))

print(_20_有效的括号().isValid1("[()]"))



print("Hello, World!")
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
//_876_链表的中间结点().middleNode(node)
//_203_移除链表元素().removeElements(node5, 7);
//print(_141_环形链表().hasCycle1(node))

