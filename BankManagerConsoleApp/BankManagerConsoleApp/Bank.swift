//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/29.
//

class Bank {
    var bankManager: BankManager
    var servedClient: Int = 0
    let waitingClient: Int = Int.random(in: 10...30)
    lazy var clientQueue: ClientQueue<Client> = makeClientQueue()
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func run() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 : ", terminator: "")
        guard let choiceOption = readLine() else {
            return
        }
        switch choiceOption {
        case "1":
            runBusiness()
            run()
        case "2":
            break
        default:
            print("잘못된 입력 입니다. 다시 입력해주세요")
            run()
        }
    }
    
    func makeClientQueue() -> ClientQueue<Client> {
        var clientQueue = ClientQueue<Client>()

        for waitingNumber in 1...waitingClient {
            let client = Client(waitingNumber: waitingNumber)
            clientQueue.enqueue(data: client)
        }
        return clientQueue
    }
    
    func runBusiness() {
        let bankMangerWork = bankManager.work(from: &clientQueue)
        servedClient = bankMangerWork
        terminateBusiness()
    }

    func terminateBusiness() {
        let bankMangerTime = Double(servedClient) * 0.7
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(servedClient)명이며, \
        총 업무시간은 \(String(format: "%.1f", bankMangerTime))초입니다.
        """)
    }
}
