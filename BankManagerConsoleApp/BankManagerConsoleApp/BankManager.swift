//
//  BankManager.swift
//  Created by 수꿍, 브래드.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol BankManager {
    var time: Double { get }
    
    func work(from: inout ClientQueue<Client>) -> Int
}

extension BankManager {
    func work(from clientQueue: inout ClientQueue<Client>) -> Int {
        var servedClient: Int = .zero
        
        while clientQueue.isEmpty == false {
            guard let clientIndex = clientQueue.dequeue()?.waitingNumber else {
                return .zero
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: time)
            print("\(clientIndex)번 고객 업무 완료")
            servedClient += 1
        }
        return servedClient
    }
}

struct Banker: BankManager {
    var time = 0.7
}
