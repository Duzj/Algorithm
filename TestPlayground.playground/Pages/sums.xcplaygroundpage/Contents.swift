//: [Previous](@previous)

import Foundation

var str = "相加问题"
//MARK: - 相加问题

class Solution1 {
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
}

class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int : Int]()
        for (i , num) in nums.enumerated(){
            if let index = dic[target - num] {
                return [index ,i ]
            }else{
                dic[num] = i
            }
        }
        fatalError("error")
    }
    
//给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
//注意：答案中不可以包含重复的三元组。
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
