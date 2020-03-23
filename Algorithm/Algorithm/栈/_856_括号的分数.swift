//
//  _856_括号的分数.swift
//  Algorithm
//
//  Created by duzj on 2020/3/22.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/score-of-parentheses/
 
 给定一个平衡括号字符串 S，按下述规则计算该字符串的分数：

 () 得 1 分。
 AB 得 A + B 分，其中 A 和 B 是平衡括号字符串。
 (A) 得 2 * A 分，其中 A 是平衡括号字符串。
  

 示例 1：

 输入： "()"
 输出： 1
 示例 2：

 输入： "(())"
 输出： 2
 示例 3：

 输入： "()()"
 输出： 2
 示例 4：

 输入： "(()(()))"
 输出： 6
 提示：

 S 是平衡括号字符串，且只含有 ( 和 ) 。
 2 <= S.length <= 50


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/score-of-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


/*
 
 字符串 S 中的每一个位置都有一个“深度”，即该位置外侧嵌套的括号数目。例如，字符串 (()(.())) 中的 . 的深度为 2，因为它外侧嵌套了 2 层括号：(__(.__))。

 我们用一个栈来维护当前所在的深度，以及每一层深度的得分。当我们遇到一个左括号 ( 时，我们将深度加一，并且新的深度的得分置为 0。当我们遇到一个右括号 ) 时，我们将当前深度的得分乘二并加到上一层的深度。这里有一种例外情况，如果遇到的是 ()，那么只将得分加一。

 下面给出了字符串 (()(())) 每次对应的栈的情况：

 [0, 0] (
 [0, 0, 0] ((
 [0, 1] (()
 [0, 1, 0] (()(
 [0, 1, 0, 0] (()((
 [0, 1, 1] (()(()
 [0, 3] (()(())
 [6] (()(()))

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/score-of-parentheses/solution/gua-hao-de-fen-shu-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
class _856_括号的分数 {
    //栈
    func scoreOfParentheses(_ S: String) -> Int {
        var stack = Stack<Int>()
        stack.push(0)
        
        
        for c in S{
            if c == "(" {
                stack.push(0)
            }else{
                let a = stack.pop()!
                let b = stack.pop()!
                let t = b + max(a * 2, 1)
                stack.push(t)
            }
        }
        return stack.pop()!
    }
}
