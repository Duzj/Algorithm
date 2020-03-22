//
//  _20_有效的括号.swift
//  Algorithm
//
//  Created by duzj on 2020/3/22.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-parentheses/
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class _20_有效的括号 {
    //  1 . 使用栈
    func isValid(_ s: String) -> Bool {
        var stack = Stack<String>()
        let map = ["(" : ")" , "{" : "}" , "[" : "]"]
        for element in s  {
            let temp = String(element);
            
            if map.keys.contains(temp) {
                stack.push(temp)
            }else {
                if stack.isEmpty() {
                    return false
                }else {
                    let top = stack.pop()
                    if map[top!] != temp {
                        return false
                    }
                }
            }
        }
        if stack.isEmpty() {
            return true
        }
        return false
    }
    
    
    //  1 . 使用栈
    func isValid1(_ s: String) -> Bool {
        var news = s
        while news.contains("()") ||  news.contains("[]") || news.contains("{}"){
            news =  news.replacingOccurrences(of: "()", with: "")
           news =   news.replacingOccurrences(of: "[]", with: "")
            news =  news.replacingOccurrences(of: "{}", with: "")
        }
        
        if news.count == 0 {
            return true
        }else{
            return false
        }
    }
}
