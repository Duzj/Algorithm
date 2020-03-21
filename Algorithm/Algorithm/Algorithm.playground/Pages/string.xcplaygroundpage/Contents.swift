//: [Previous](@previous)

import Foundation

var str = "字符串问题"
//MARK: - 字符串问题

str = "3. 无重复字符的最长子串"
print(str)
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

class Solution {
    //解法 1,暴力解法
    func lengthOfLongestSubstring(_ s: String) -> Int {
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
    
    //解法二, 滑动窗口
    func lengthOfLongestSubstring1(_ s: String) -> Int {

        var hashDict = [String : Int]()
        var ans = 0
        var start = 0
//        var end = 0
        for end in 0 ..< s.count {
            if s.count - start < ans{
                return ans
            }
            let currentIndex = s.index(s.startIndex, offsetBy: end)
            let str = s[currentIndex ... currentIndex]
            let newStr = String(str)
            
            if hashDict.keys.contains(newStr) {
                start = max(start, hashDict[newStr]!)
            }
            ans = max(ans, end - start + 1 )
            hashDict[newStr] = end + 1
        }
        return ans
    }
    
        //解法二,优化,先把字符串转换成字符数组 滑动窗口
        func lengthOfLongestSubstring2(_ s: String) -> Int {

            var hashDict = [Character : Int]()
            var ans = 0
            var start = 0
            let characters = Array(s)
            for end in 0 ..< characters.count {
                if s.count - start < ans{
                    return ans
                }

                let newStr = characters[end]
                
                if hashDict.keys.contains(newStr) {
                    start = max(start, hashDict[newStr]!)
                }
                ans = max(ans, end - start + 1 )
                hashDict[newStr] = end + 1
            }
            return ans
        }
}

Solution().lengthOfLongestSubstring2("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCD")




str = "5.  最长回文子串"
str = " 中心扩散法, 马拉车, 动态规划"

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution1{
    func longestPalindrome(_ s : String) -> String {
        
        return ""
    }
}



/**
 给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在每个字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。
 你可以按任意顺序返回答案。
 示例 1：
 输入：["bella","label","roller"]
 输出：["e","l","l"]
 示例 2：
 输入：["cool","lock","cook"]
 输出：["c","o"]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-common-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solusion100{
    func commonChars(_ A : [String]) -> [String] {
        if A.isEmpty{
            return [String]()
        }
        
        var keys = Set(A[0])
        
        for key in keys{
            for str in A{
//                var minNum = min(<#T##x: Comparable##Comparable#>, <#T##y: Comparable##Comparable#>)

            }
            
        }
        
        
        for str in A {
            for characher in str{
                
            }
        }
        
        return [String]()
    }
    
}




//: [Next](@next)
