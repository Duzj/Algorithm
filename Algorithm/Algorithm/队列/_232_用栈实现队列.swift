//
//  _232_用栈实现队列.swift
//  Algorithm
//
//  Created by duzj on 2020/3/22.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/implement-queue-using-stacks/
 
 使用栈实现队列的下列操作：

 push(x) -- 将一个元素放入队列的尾部。
 pop() -- 从队列首部移除元素。
 peek() -- 返回队列首部的元素。
 empty() -- 返回队列是否为空。
 示例:

 MyQueue queue = new MyQueue();

 queue.push(1);
 queue.push(2);
 queue.peek();  // 返回 1
 queue.pop();   // 返回 1
 queue.empty(); // 返回 false
 说明:

 你只能使用标准的栈操作 -- 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-queue-using-stacks
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
**/


class _232_用栈实现队列 {
    /** Initialize your data structure here. */
    
    fileprivate var inStack = Stack<Int>()
    fileprivate var outStack = Stack<Int>()
    
    /*
     实现思想,2 个栈, 一个入栈 ,一个出栈用
     
     1. 入栈时直接加入 inStack
     2. 出栈时,如果 outStack 不为空,就直接在 outStack 弹出 栈顶元素, 如果 outStack 为空,就先把 inStack 的元素依次弹出到 outStack 中,在从 outStack 中弹出栈顶元素
     
     3.
     
     */
    init() {

    }

    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inStack.push(x)
    }

    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if outStack.isEmpty() {
            while !inStack.isEmpty() {
                outStack.push(inStack.pop()!)
            }
        }
        return outStack.pop() ?? 0
    }

    /** Get the front element. */
    func peek() -> Int {
        if outStack.isEmpty() {
            while !inStack.isEmpty() {
                outStack.push(inStack.pop()!)
            }
        }
        return outStack.peek() ?? 0
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        if inStack.isEmpty() && outStack.isEmpty(){
            return true
        }else{
            return false
        }
    }
}


//class MyQueue {
//    /** Initialize your data structure here. */
//    init() {
//
//    }
//
//    /** Push element x to the back of queue. */
//    func push(_ x: Int) {
//
//    }
//
//    /** Removes the element from in front of queue and returns that element. */
//    func pop() -> Int {
//
//    }
//
//    /** Get the front element. */
//    func peek() -> Int {
//
//    }
//
//    /** Returns whether the queue is empty. */
//    func empty() -> Bool {
//
//    }
//}


/**
* Your MyQueue object will be instantiated and called as such:
* let obj = MyQueue()
* obj.push(x)
* let ret_2: Int = obj.pop()
* let ret_3: Int = obj.peek()
* let ret_4: Bool = obj.empty()
*/
