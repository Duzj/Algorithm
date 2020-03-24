//
//  _3_无重复字符的最长子串.swift
//  Algorithm
//
//  Created by duzj on 2020/3/24.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
滑动窗口是数组/字符串问题中常用的抽象概念。 窗口通常是在数组/字符串中由开始和结束索引定义的一系列元素的集合，即
[i,j)（左闭，右开）。而滑动窗口是可以将两个边界向某一方向“滑动”的窗口。例如，我们将
[i,j) 向右滑动
1 个元素，则它将变为
[i+1,j+1)（左闭，右开）。
作者：LeetCode
链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/wu-zhong-fu-zi-fu-de-zui-chang-zi-chuan-by-leetcod/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

class _3_无重复字符的最长子串 {
    //第一种暴力解法, 遍历出所有的子串, 然后判断每个子串中是否有重复字符串 ,可以用 set 判断包含
    //解法 1,暴力解法
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var max = 0
        for i in 0 ..< s.count{
            for j in (i) ..< s.count{
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(s.startIndex, offsetBy: j)
                let str = s[startIndex ... endIndex]
            
                let ss = String(str)
                print(ss ,max , i, j)

                if allUnique(ss) {
                    max =  max > ss.lengthOfBytes(using: .utf8) ? max : ss.lengthOfBytes(using: .utf8)
                }
            }
        }
        return max
    }
    
    func allUnique(_ str : String) -> Bool {
        var tempSet = Set<Character>()
        for char in str {
            if tempSet.contains(char){
                return false
            }else{
                tempSet.insert(char)
            }
        }
        return true
    }
    
    
    //第二 滑动窗口
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charSet = Set<Character>()
        let charArr = Array(s)
        var i = 0
        var j = 0
        var ans = 0
        while i < charArr.count && j < charArr.count {
            let temp = charArr[j]
            if !charSet.contains(temp) {
                charSet.insert(temp)
                ans = max(ans, j - i  + 1 )
                j += 1
            }else{
                charSet.remove(charArr[i])
                i += 1
            }
        }
        return ans
    }
    
    //第三 优化滑动窗口
    /*
     上述的方法最多需要执行 2n 个步骤。事实上，它可以被进一步优化为仅需要 n 个步骤。我们可以定义字符到索引的映射，而不是使用集合来判断一个字符是否存在。 当我们找到重复的字符时，我们可以立即跳过该窗口。
     也就是说，如果
    s[j] 在 [i,j) 范围内有与 j′
       重复的字符，我们不需要逐渐增加i 。 我们可以直接跳过[i，j′] 范围内的所有元素，并将 i 变为 j′+1
     */
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var map = [Character : Int]()
        let charArr = Array(s)
        var l = 0 //左边开始位置
        var r = 0 //右边结束位置
        var ans = 0
        while r < charArr.count {
            if charArr.count - l  < ans {
                return ans;
            }
            let temp = charArr[r]
            if map.keys.contains(temp) {
                let l1 = map[temp]!
                l = max(l1, l)
                map[temp] = l
            }else{
                map[temp] = r
                ans = max(ans, r - l + 1 )
            }
            r += 1
        }
        return ans
    }
    
    //进一步优化代码
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        var map = [Character : Int]()
        let charArr = Array(s)
        var l = 0 //左边开始位置
        var r = 0 //右边结束位置
        var ans = 0
        while r < charArr.count {
            if charArr.count - l  < ans {
                return ans;
            }
            let temp = charArr[r]
            if map.keys.contains(temp) {
                let l1 = map[temp]!
                l = max(l1, l)
            }
            ans = max(ans, r - l + 1 )
            map[temp] = r + 1
            r += 1
        }
        return ans
    }
}
