//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

str = "2 个链表相加,2 数之和"
/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class ListNode {
    public var val : Int
    public var next : ListNode?
    public init (_ val : Int){
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1 : ListNode? , _ l2 : ListNode?) -> ListNode? {
        //预先链表头结点
    //小技巧：对于链表问题，返回结果为头结点时，通常需要先初始化一个预先指针pre，该指针的下一个节点指向真正的头结点head。使用预先指针的目的在于链表初始化时无可用节点值，而且链表构造过程需要指针移动，进而会导致头指针丢失，无法返回结果。
        let pre : ListNode = ListNode(0);
        var cur = pre
        var p = l1
        var q = l2
        
        var carry : Int = 0
        
        while p != nil || q != nil {
            var sum : Int = (p?.val ?? 0 ) + (q?.val ?? 0) + carry
            //求商 ,下一位的进位
            carry = sum/10
            //求余数,实际存入链表的值
            sum = sum % 10
            
            cur.next = ListNode(sum)
            
            if p != nil{
                p = p?.next
            }
            if q != nil{
                q = q?.next
            }
            
            cur = cur.next!
        }
        
        if carry > 0{
            cur.next = ListNode(carry)
        }
        
        return pre.next
    }
}

//: [Next](@next)
