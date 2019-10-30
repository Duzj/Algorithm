//: [Previous](@previous)

import Foundation

var str = "相加问题"
print(str)
//MARK: - 相加问题

//letcode

//MARK: -  1. 两数之和
str = "1. 两数之和"
print(str)

/*
 1. 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    
    //解法 1
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var a : Int = 0
        var b : Int = 0
        for i in 0 ..< nums.count{
           for j in i+1 ..< nums.count{
               if nums[i] + nums[j] == target{
                a = i;
                b = j;
                break
               }
           }
       }
        let arr = [a,b]
        return arr
    }
    
    //解法 2
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int : Int]()
        for (i , num) in nums.enumerated(){
            if let index = dic[target - num] {
                return [index ,i ]
            }else{
                dic[num] = i
            }
        }
//        fatalError("error")
        return [Int]()
    }
}
Solution().twoSum([1,2,3,5,7], 10)


//MARK: - 15. 三数之和
str = "15. 三数之和"

/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution2 {
    
    func threeSum(_ nums: [Int] , _ target: Int) -> [[Int]] {
        var resultArr = [[Int]]()
        if nums.count < 3 {
            return resultArr;
        }
        var dic = [Int : Int]()
        
        for i in 0..<nums.count-2 {
            for j in (i+1 ..< nums.count-1){
                if let nn = dic[0 - nums[i] - nums[j]] {
                    resultArr.append([nums[i] , nums[j] , nums[nn]])
                }else{
//                    dic[]
                }
                
//                for k in (j+1 ..< nums.count){
//                    if nums[i]+nums[j]+nums[k] == 0 {
//
//                        resultArr.append([nums[i] , nums[j] , nums[k]])
//                    }
//                }
            }
        }
        return resultArr
    }
}

//Solution2().threeSum([-1,3,-2,-4,4,0], 0)
Solution2().threeSum([-1,0,1,2,-1,-4], 0)



//: [Next](@next)
