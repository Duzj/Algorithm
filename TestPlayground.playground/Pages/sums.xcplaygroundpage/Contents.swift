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
print(str)
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
        var resultArr : Array = [[Int]]()
        var reseultSet = Set<[Int]>()
        if nums.count < 3 {
            return resultArr;
        }
        for i in 0 ..< nums.count{
            for j in (i+1) ..<  (nums.count ){
                for k in (j+1) ..< (nums.count ){
                    if nums[i] + nums[j] + nums[k] == target {
                        let a = nums[i];
                        let b = nums[j];
                        let c = nums[k];
                        let max =  (a > b ? a : b) > c ?  (a > b ? a : b) : c ;
                        let min =  (a < b ? a : b) < c ?  (a < b ? a : b) : c ;
                        reseultSet.insert([min , max , (0 - min - max)])
                    }
                }
            }
        }
        
        for item in reseultSet{
            resultArr.append(item)
        }
        return resultArr
    }
    
    //解法 2
    func threeSum1(_ nums: [Int] , _ target: Int) -> [[Int]] {
        if nums.count < 3{
            return [[Int]]()
        }
        
        var ansArray = [[Int]]()
        let tempArray = nums.sorted();
        
        for i in 0 ..< tempArray.count {
            
            if tempArray[i] > 0{
                break
            }
            
            if i > 0  && (tempArray[i] == tempArray[i-1]) {
                continue
            }
            
            var L = i + 1
            var R = tempArray.count - 1
            
            while L < R {
                let sum = tempArray[i] + tempArray[L] + tempArray[R]
//                print(sum , i , L , R , tempArray[i]  , tempArray[L] , tempArray[R] )
                if  sum == 0 {
                    ansArray.append([tempArray[i] , tempArray[L] , tempArray[R]])
                    
                    while (L<R && tempArray[L] == tempArray[L+1]){
                      L = L + 1; // 去重
                    }
                    
                    while (L<R && tempArray[R] == tempArray[R-1]) {
                        R = R - 1; // 去重
                    }
                    
                    L = L + 1
                    R = R - 1

                }else if sum < 0 {
                    L = L + 1
                }else if sum > 0 {
                    R = R - 1
                }
            }
        }
        
        return ansArray
    }
}

//Solution2().threeSum([-1,3,-2,-4,4,0], 0)

//print(Solution2().threeSum([-1,0,1,2,-1,-4], 0))

print(Solution2().threeSum1([-1,0,1,2,-1,-4], 0))

//: [Next](@next)
