//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManger {
    var customerQueue: CustomerQueue<Client>?
    
    mutating func work() {
        var client = Client()
        let result = client.appendCustomer()
        customerQueue = result
        
        while customerQueue!.isEmpty == false {
            guard let clientIndex = customerQueue?.dequeue()?.waitingNumber else {
                return
            }
            print("\(clientIndex)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(clientIndex)번 고객 업무 완료")
        }
        
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(client.waitingPerson)명이며, \
        총 업무시간은 \(String(format: "%.1f", Double(client.waitingPerson) * 0.7))초입니다. 
        """)
    }
}
