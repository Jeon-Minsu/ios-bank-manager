//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

class Node<T> {
    let data: T?
    let next: Node<T>?
    let prev: Node<T>?
    
    init(data: T?, next: Node<T>?, prev: Node<T>?) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}
