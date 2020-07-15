//
//  _397_整数替换.swift
//  Algorithm
//
//  Created by duzj on 2020/7/15.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

/*
 给定一个正整数 n，你可以做如下操作：

 1. 如果 n 是偶数，则用 n / 2替换 n。
 2. 如果 n 是奇数，则可以用 n + 1或n - 1替换 n。
 n 变为 1 所需的最小替换次数是多少？

 示例 1:

 输入:
 8

 输出:
 3

 解释:
 8 -> 4 -> 2 -> 1
 示例 2:

 输入:
 7

 输出:
 4

 解释:
 7 -> 8 -> 4 -> 2 -> 1
 或
 7 -> 6 -> 3 -> 2 -> 1
 通过次数7,466提交次数21,062

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/integer-replacement
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 每遇偶数除以2，
 遇到奇数，应变换使其成为4的倍数，目的是使该数下一步变成能连续两次除以2的偶数,这样步数会少
 因此mod4==1时减1，mod4==3时加1
 有个例外是3, 3——2——1 比 3——4——2——1更快

 */
class _397_整数替换 {
    func integerReplacement(_ n: Int) -> Int {
        var count = 0;
        var m = n;
        while m > 1 {

            if m == 3 {
                m = m - 1
            }else if (m % 4 == 1){
                m = m - 1
            }else if (m % 4 == 3){
                m = m + 1
            }else{
                m = m / 2
            }
            count += 1
        }
        return count
    }
}
