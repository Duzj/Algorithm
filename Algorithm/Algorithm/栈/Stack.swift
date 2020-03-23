//
//  Stack.swift
//  Algorithm
//
//  Created by duzj on 2020/3/22.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation


/*
 Mutating 可改变
 使用场景:
     1.结构体,枚举类型中声明修饰方法 mutating func funcName()
     2.extension, protocol 修饰 方法
     注:
          a. swift 中struct,enum 均可以包含类方法和实例方法,swift官方是不建议在struct,enum 的普通方法里修改属性变量,但是在func 前面添加 mutating 关键字之后就可以方法内修改.

           b. 对于protocol 方法也是适用的,mutating 可以修饰的代理方法,如果,struct,enum,class 实现协议之后可以在对应的 mutating 代理方法内修改本身的属性变量.(class 不影响,因为属性变量对于类的类方法,实例方法 是透明的,即随时都可以改变)

 作者：喜欢那只汪
 链接：https://www.jianshu.com/p/c1f12e3d6551
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

struct Stack <T> {
    public init() {}
   fileprivate  var arr = [T]()
    
    var count : Int {
        return self.arr.count
    }
    
    mutating func push(_ element : T){
        self.arr.append(element)
    }
    
    mutating func pop() -> T? {
        let element = self.arr.popLast()
        return element
    }
    
    func peek() -> T? {
        return self.arr.last
    }
    
    public func isEmpty() -> Bool {
        // 判断数组是否为空
        return self.arr.isEmpty
    }
}




extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    
    
    /// 在打印栈及其元素时，输出简洁漂亮的格式
    /// 如果不实现这些代码，打印栈的结果为：ArrayStack<Int>(elements: [5, 44, 23])
    /// 实现下面这些代码之后，打印栈的结果为：[5, 44, 23]
    /// - returns: 返回栈及其元素的文本表示
    public var description: String {
        return arr.description
    }
    
    /// 打印时输出简洁漂亮的格式，主要用于调试
    /// - returns: 返回栈及其元素的文本表示，适用于调试
    public var debugDescription: String {
        return arr.debugDescription
    }
    
}
