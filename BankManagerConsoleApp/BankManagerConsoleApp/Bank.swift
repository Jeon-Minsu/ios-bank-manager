//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/29.
//

struct Bank {
    private var bankManager: BankManager
    private var servedClient: Int?
    private var waitingClient: Int?
    private var clientQueue: ClientQueue<Client>?
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    mutating func run() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 : ", terminator: "")
        
        guard let choiceOption = readLine() else {
            return
        }
        
        switch choiceOption {
        case "1":
            reset()
            runBusiness()
            terminateBusiness()
            run()
        case "2":
            break
        default:
            print("잘못된 입력 입니다. 다시 입력해주세요")
            run()
        }
    }
    
    mutating func reset() {
        servedClient = 0
        waitingClient = Int.random(in: 10...30)
        clientQueue = makeClientQueue()
    }
    
    mutating private func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        
        guard let waitingClient = waitingClient else {
            return nil
        }

        for waitingNumber in 1...waitingClient {
            let client = Client(waitingNumber: waitingNumber)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
    
    mutating private func runBusiness() {
        guard var queue = clientQueue else {
            return
        }
        
        let handledClient = bankManager.work(from: &queue)
        servedClient = handledClient
    }

    mutating private func terminateBusiness() {
        guard let servedClient = servedClient else {
            return
        }
        
        let bankingHours = Double(servedClient) * bankManager.time
        
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(servedClient)명이며, \
        총 업무시간은 \(String(format: "%.1f", bankingHours))초입니다.
        """)
    }
}
