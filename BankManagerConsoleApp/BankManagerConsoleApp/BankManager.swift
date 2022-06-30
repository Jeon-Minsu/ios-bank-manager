//
//  BankManager.swift
//  Created by 수꿍, 브래드.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    mutating func work(from clientQueue: inout ClientQueue<Client>) -> Int {
        var servedClient: Int = 0
        
        while clientQueue.isEmpty == false {
            guard let clientIndex = clientQueue.dequeue()?.waitingNumber else {
                return 0
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.07)
            print("\(clientIndex)번 고객 업무 완료")
            servedClient = clientIndex
        }
        return servedClient
    }
}
