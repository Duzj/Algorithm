//
//  _150_逆波兰表达式求值.swift
//  Algorithm
//
//  Created by duzj on 2020/3/22.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/
 
 根据逆波兰表示法，求表达式的值。

 有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。

 说明：

 整数除法只保留整数部分。
 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
 示例 1：

 输入: ["2", "1", "+", "3", "*"]
 输出: 9
 解释: ((2 + 1) * 3) = 9
 示例 2：

 输入: ["4", "13", "5", "/", "+"]
 输出: 6
 解释: (4 + (13 / 5)) = 6
 示例 3：

 输入: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
 输出: 22
 解释:
   ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/evaluate-reverse-polish-notation
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class _150_逆波兰表达式求值 {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = Stack<Int>()
        
        for str in tokens {
            if str == "+" {
                stack.push(stack.pop()! + stack.pop()!)
            }else if str == "-" {
                let a = stack.pop()!
                let b = stack.pop()!
                stack.push(b - a)
            }else if str == "*" {
                let a = stack.pop()!
                let b = stack.pop()!
                stack.push(b * a)
            }else if str == "/" {
                let a = stack.pop()!
                let b = stack.pop()!
                stack.push(b / a)
            }else{
                stack.push(Int(str)!)
            }
        }
        return stack.pop()!
    }
}
