import UIKit
import Foundation

//MARK: - 基础语法
//https://www.cnswift.org/basic-operators

var str = "Hello, playground"
print(str)
let a1 = "yyyy"
let a2 = 89

var quotation = """
   i say "i have \(a2) \(a1)"
an other
"""
var add = quotation.lengthOfBytes(using: .utf8)
quotation.count

print(quotation)

//for character in quotation{
//    print(character)
//}

var charS : Character = "e"
print(charS)
quotation.append(charS)

let combinedEAcute: Character = "\u{65}\u{301}"
print(combinedEAcute)

str[str.startIndex]
str[str.index(before: str.endIndex)]


// 动态初始化
var arr1 = Array<String>()
var arr2:Array<String> = []
var arr3 = [String]()
var arr4:[String] = []

// 初始化空的字典
var dict1:Dictionary<String, String> = [:]
var dict2:[String:String] = [:]
var dict3 = [String:String]()
var dict4 = Dictionary<String, String>()

// 上面Array、Dictionary动态初始化有四种，这里面只有两种
var set1 = Set<String>()
var set2:Set<String> = []


var arr  = ["a" , "b" , "c"]
arr[1] = String(99)
arr;
let dic = ["a" : 65, "b" : 66]

var emptyArray = [String]()
var arrr = Array<Int>()
//var arrr1 = Array(arrayLiteral: <#T##_...##_#>)
var arr32 : Array = [1,2]
var arr43 :Array<Int> = [1,2]

var emptyIntArr = [Int]()
//emptyArray[0] = "3"
emptyArray
//emptyIntArr[0] = 9;


//MARK: - 集合
var letters = Set<Character>()
var favrite : Set<String> = ["aaa" , "bbb"]
var fa1 :Set = [1,2,1]

var emptyDict = [String : String]()
emptyDict["tt"] = "33"
emptyDict
var emptyDD = [String : [String : String]]()


var optionStr : String? = nil
print(optionStr == nil)
var greeting = "hello \(optionStr ?? "yyy")"
if let str = optionStr {
    greeting = "hello \(str)"
}else{
    greeting = "eeeee"
}

for i in  0 ... 4 {
    print(i)
}

func testFunc( _ a : String , add b : Int) -> String{
    print(a + String(b))
    return a + String(b)
}

testFunc("000", add: 99)
//testFunc("88", b: 90)
//testFunc(a: "999", b: 10)

func sumTest(nums : Int ... ) -> Int{
    var sum = 0;
    for num in nums{
        sum = sum + num
    }
    return sum
}

sumTest(nums: 1,3,5)

func sumTest2(nums : [Int]) -> Int{
    var sum = 0;
    for num in nums{
        sum = sum + num
    }
    nums.count;
    return sum
}

sumTest2(nums: [2,5,8])


class Solution{
    func twoSum(_ a : Int , _ b : Int) -> Int {
        print(a+b)
        return a+b;
    }
}
 Solution().twoSum(1, 4)

var solu = Solution()
let dd = solu.twoSum(12, 23)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
//        if condition(item) {
//            return true
//        }
        if lessThanTen(number: item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

protocol ExampleProtocal{
    var simpleDescription : String {get }
    mutating func adjust()
}

class PpTest : ExampleProtocal{
    var simpleDescription: String = "hhhh"
    func adjust() {
        print("test")
    }
}

extension Int : ExampleProtocal{
    var simpleDescription: String {
        return "the number is \(self)"
    }
    mutating func adjust() {
        self += 44
    }
}


var ff = 34;
ff.simpleDescription
ff.adjust()
ff.simpleDescription

let protocalValue : ExampleProtocal = a2
print(protocalValue.simpleDescription)

print(Int.min , Int.max)

typealias int = Int

let  ii : int = 2;


