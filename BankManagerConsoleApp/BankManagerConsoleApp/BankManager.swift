//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    var clientInCharge: Int = 0
    
    mutating func work(from customerQueue: inout CustomerQueue<Client>) -> Int {
        var clientIndexTest: Int = 0
        
        while customerQueue.isEmpty == false {
            guard let clientIndex = customerQueue.dequeue()?.waitingNumber else {
                return 0
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.07)
            print("\(clientIndex)번 고객 업무 완료")
            clientIndexTest = clientIndex
        }
        return clientIndexTest
    }
}
