//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/29.
//

struct Client {
    let waitingPerson: Int = Int.random(in: 10...30)
    let waitingNumber: Int?
    
    mutating func appendCustomer() -> CustomerQueue<Client> {
        var appendTest = CustomerQueue<Client>()

        for waitingNumber in 1...waitingPerson {
            let client = Client(waitingNumber: waitingNumber)
            appendTest.enqueue(data: client)
        }
        return appendTest
    }
}
