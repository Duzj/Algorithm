//
//  Queue.swift
//  Algorithm
//
//  Created by duzj on 2020/3/23.
//  Copyright © 2020 duzj. All rights reserved.
//

import Foundation

struct Queue<T> {
    fileprivate var elements = [T]()
    init() {
    }
    
    mutating func enQueue(element : T)  {
        self.elements.append(element)
    }
    
    mutating func deQueue() -> T? {
        return elements.removeFirst()
    }
    
    mutating func peek() -> T? {
        return elements.first
    }
    
    mutating func clear() {
        elements.removeAll()
    }
    
    func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    func count() -> Int {
        return self.elements.count
    }
}


// 让打印队列时输出简介的格式
extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    // 控制打印队列时的文本输出
    public var description: String {
        return elements.description
    }
    
    // 控制打印队列时的文本输出，主要用于调试
    public var debugDescription: String {
        return elements.debugDescription
    }
}



//第二种队列实现方式
//https://www.jianshu.com/p/f6d0ea5d75ea
public struct Queue1<T>{
   fileprivate var array = [T?]()
   fileprivate var head = 0

   public var isEmpty : Bool {
        return count == 0
   }
   public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }

    return element
  }

  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}
