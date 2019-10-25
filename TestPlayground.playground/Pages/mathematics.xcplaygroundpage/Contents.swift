//: [Previous](@previous)

import Foundation

var str = "数学问题"

//MARK: - 数学问题

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



//: [Next](@next)
