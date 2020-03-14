//: [Previous](@previous)

import Foundation

var str = "数学问题"

//MARK: - 数学问题


//class solution {
//    func solution(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//}

//小猪喝水
/// https://mp.weixin.qq.com/s/Kw5BjPsTvNUZaF8PEOsvSA
/*
 题目描述
 有 1000 只水桶，其中有且只有一桶装的含有毒药，其余装的都是水。它们从外观看起来都一样。如果小猪喝了毒药，它会在 15 分钟内死去。
 问题来了，如果需要你在一小时内，弄清楚哪只水桶含有毒药，你最少需要多少只猪？
 回答这个问题，并为下列的进阶问题编写一个通用算法。

 进阶:
 假设有 n 只水桶，猪饮水中毒后会在 m分钟内死亡，你需要多少猪 （x） 就能在 p分钟内找出 “有毒” 水桶？这 n 只水桶里有且仅有一只有毒的桶。

 提示：
 可以允许小猪同时饮用任意数量的桶中的水，并且该过程不需要时间。
 小猪喝完水后，必须有 m 分钟的冷却时间。在这段时间里，只允许观察，而不允许继续饮水。
 任何给定的桶都可以无限次采样（无限数量的猪）。

 解题方案
 思路
 标签：数学
 这道题初看的时候，很多人会纠结：到底需要多少只小猪，而每只小猪又应该具体如何喝水才能判断出哪只水桶有毒药？
 这道题最开始不要去关注细节，去想到底应该怎么喂水。而是应该先思考在考察哪方面的问题，数组、链表、二叉树还是数学？那么仔细思考就能得出结论，本质上在考察数学中的 进制 问题。
 举例说明：
 假设：总时间 minutesToTest = 60，死亡时间 minutesToDie = 15，pow(x, y) 表示 x 的 y 次方，ceil(x)表示 x 向上取整
 当前有 1 只小猪，最多可以喝 times = minutesToTest / minutesToDie = 4 次水
 最多可以喝 4 次水，能够携带 base = times + 1 = 5 个的信息量，也就是（便于理解从 0 开始）：
 (1) 喝 0 号死去，0 号桶水有毒
 (2) 喝 1 号死去，1 号桶水有毒
 (3) 喝 2 号死去，2 号桶水有毒
 (4) 喝 3 号死去，3 号桶水有毒
 (5) 喝了上述所有水依然活蹦乱跳，4 号桶水有毒
 结论是1只小猪最多能够验证 5 桶水中哪只水桶含有毒药，当 buckets ≤ 5 时，answer = 1
 那么 2 只小猪可以验证的范围最多到多少呢？我们把每只小猪携带的信息量看成是base进制数，2 只小猪的信息量就是 pow(base, 2) = pow(5, 2) = 25，所以当 5 ≤ buckets ≤ 25时，anwser = 2
 那么可以得到公式关系：pow(base, ans) ≥ buckets，取对数后即为：ans ≥ log(buckets) / log(base)，因为ans为整数，所以 ans = ceil(log(buckets) / log(base))
 
 时间复杂度：O(1)
 */

class solution3 {
    func pigDrink(totleTime : Double , dieTime : Double , bucket : Double) -> Int {
        var base  = totleTime/dieTime
        base = floor(base+1)
        let ana : Double = log(bucket)/log(base)
        let ans = ceil(ana)
        return Int(ans)
    }
}
solution3().pigDrink(totleTime: 60, dieTime: 21, bucket: 1000)
pow(3, 6)




/*
 面试题57 - II. 和为s的连续正数序列
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。
 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

 示例 1：
 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：
 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]
 限制：
 1 <= target <= 10^5
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution1 {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
//        var l = 1
//        var r = 2;
//
//        var result = [[Int]]();
//        let mRinght = target/2 + 1;
//        while (r <= mRinght){
//            var  sum = 0;
//            var tempArr = [Int]()
//            for i in l ... r{
//                tempArr.append(i)
//                sum = sum + i;
//            }
//
//            if sum == target{
//                result.append(tempArr);
//                r += 1;
//            }else if sum > target{
//                l += 1;
//            }else{
//                r += 1;
//            }
//        }
//        return result ;
        
        
        var l = 1
        var r = 2
        let maxR = target/2 + 1
        var result = [[Int]]()
        while (r <= maxR){
            let sum = (l + r )*(r - l + 1)/2

            if sum == target{
                var temp = [Int]()
                for i in l ... r{
                    temp.append(i)
                }
                result.append(temp)
                r += 1;
            }else if sum < target{
                r += 1;
            }else{
                l += 1;
            }
        }
        return result;
    }
}

Solution1().findContinuousSequence(9);
print(Solution1().findContinuousSequence(9))




class Solution2{
    func solution(_ arr : [Int] , _ target : Int) -> [Int] {
        var dict = [Int : Int]()
        for (i , num) in arr.enumerated(){
            
            if let k = dict[target - num]{
                return [k + 1 , i + 1];
            }else{
                dict[num] = i;
            }
        }
        return [Int]()
    }
}

Solution2().solution([1,4,4,5], 8)



class MaxQueue {
    var queue = [Int]()
    var maxQ = [Int]()
    init() {

    }
    
    func max_value() -> Int {
        if queue.isEmpty {
            return -1;
        }else{
            return maxQ.first!;
        }
    }
    
    func push_back(_ value: Int) {
        
        queue.append(value)
        
        while maxQ.last! < value {
            maxQ.removeLast()
        }
        maxQ.append(value)
    }
    
    func pop_front() -> Int {
        if queue.isEmpty {
            return -1
        }else{
            let v = queue.last!;
            queue.removeLast();
            if v == maxQ.first{
                maxQ.removeFirst();
            }
            return v;
        }
    }
}


//121.买卖股票的最佳时机
//给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
//
//如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
//
//注意你不能在买入股票前卖出股票。
//
//示例 1:
//
//输入: [7,1,5,3,6,4]
//输出: 5
//解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
//示例 2:
//
//输入: [7,6,4,3,1]
//输出: 0
//解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Solution7 {
    func maxProfit(_ prices: [Int]) -> Int {
        var i = 0
        var lowP = Int.max
        var maxP = 0
        while i < prices.count {
            
            if prices[i] < lowP {
                lowP = prices[i]
            }else if (maxP < (prices[i] - lowP)){
                maxP = prices[i] - lowP
            }
            i += 1
        }
        return maxP
    }
}

print(Solution7().maxProfit([7,1,5,3,6,4]));






/*
 1013. 将数组分成和相等的三个部分
 
 给你一个整数数组 A，只有可以将其划分为三个和相等的非空部分时才返回 true，否则返回 false。
 形式上，如果可以找出索引 i+1 < j 且满足 (A[0] + A[1] + ... + A[i] == A[i+1] + A[i+2] + ... + A[j-1] == A[j] + A[j-1] + ... + A[A.length - 1]) 就可以将数组三等分。
 示例 1：
 输出：[0,2,1,-6,6,-7,9,1,2,0,1]
 输出：true
 解释：0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1
 示例 2：
 输入：[0,2,1,-6,6,7,9,-1,2,0,1]
 输出：false
 示例 3：
 输入：[3,3,6,5,-2,2,5,1,-9,4]
 输出：true
 解释：3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4

 提示：
 3 <= A.length <= 50000
 -10^4 <= A[i] <= 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-array-into-three-parts-with-equal-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution12 {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        
        let sum = A.reduce(0, +);
        var target = 0
        if sum % 3 == 0 {
            target = sum/3
        }else{
            return false
        }
        
        var i = 0
        var j = 0
        var temp = 0
        
        while i < A.count {
            temp = temp + A[i]
            if temp == target{
                break
            }
            i += 1;
        }
        
        if temp != target {
            return false
        }
        
        j = i + 1
        
        while j < (A.count - 1) {
            temp = temp + A[j]
            
            if temp == target * 2{
                break
            }
            j += 1
        }
        
        if temp != target*2{
            return false
        }else{
            return true
        }
    }
}

//: [Next](@next)
