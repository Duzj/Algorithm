//
//  _225_用队列实现栈.swift
//  Algorithm
//
//  Created by duzj on 2020/3/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/implement-stack-using-queues/
 
 使用队列实现栈的下列操作：

 push(x) -- 元素 x 入栈
 pop() -- 移除栈顶元素
 top() -- 获取栈顶元素
 empty() -- 返回栈是否为空
 注意:

 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-stack-using-queues
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

// 个队列实现 ,入栈 O(n) , 出栈 O(1)
class _225_用队列实现栈 {
    /** Initialize your data structure here. */
    
    fileprivate var q1 = Queue<Int>()

    init() {
    }
    
    /** Push element x onto stack. */
//    实现一个栈的时候，最后入队的元素应该在前端，而不是在后端。为了实现这个目的，每当入队一个新元素的时候，我们可以把队列的顺序反转过来。
    func push(_ x: Int) {
        
        q1.enQueue(element: x)
        var size = q1.count()
        while size > 1 {
            q1.enQueue(element: q1.deQueue()!)
            size -= 1
        }
        
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return q1.deQueue()!
    }
    
    /** Get the top element. */
    func top() -> Int {
        return q1.peek()!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return q1.isEmpty()
    }
}


// 2个队列实现 ,入栈 O(1) , 出栈 O(n)
class _225_用队列实现栈1 {
    /** Initialize your data structure here. */
    
    fileprivate var q1 = Queue<Int>()
    fileprivate var q2 = Queue<Int>()

    init() {
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        q1.enQueue(element: x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        while q1.count() > 1 {
            q2.enQueue(element: q1.deQueue()!)
        }
        let top = q1.deQueue()!
        q1 = q2
        q2.clear()
        return top
    }
    
    /** Get the top element. */
    func top() -> Int {
        
        while q1.count() > 1 {
            q2.enQueue(element: q1.deQueue()!)
        }
        let top = q1.deQueue()!
        q2.enQueue(element: top)
        q1 = q2
        q2.clear()
        return top
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return q1.isEmpty()
    }
}


/**
* Your MyStack object will be instantiated and called as such:
* let obj = MyStack()
* obj.push(x)
* let ret_2: Int = obj.pop()
* let ret_3: Int = obj.top()
* let ret_4: Bool = obj.empty()
*/
