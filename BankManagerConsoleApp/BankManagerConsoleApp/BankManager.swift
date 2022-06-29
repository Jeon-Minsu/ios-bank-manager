//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManger {
    var customerQueue: CustomerQueue<Client>?
    
    mutating func work() -> Int {
        var client = Client()
        let result = client.appendCustomer()
        var clientIndexTest: Int = 0
        customerQueue = result
        
        while customerQueue!.isEmpty == false {
            guard let clientIndex = customerQueue?.dequeue()?.waitingNumber else {
                return 0
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(clientIndex)번 고객 업무 완료")
            clientIndexTest = clientIndex
        }
        return clientIndexTest
    }
}
