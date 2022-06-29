//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/29.
//

struct Bank {
    // let banker: BankManger?
    let numberOfBankers: Int = 3
    var bankManager = BankManger()
    var bankMangerTest: Int = 0
    
    mutating func run() {
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
    
    mutating func runBusiness() {
        for element in 1...numberOfBankers {
            let bankMangerWork = bankManager.work()
            bankMangerTest = bankMangerWork
            print("\(element)번 은행원 업무 처리")
            terminateBusiness()
        }
    }
    
    func terminateBusiness() {
//        guard let bankMangerTime = bankMangerTest else {
//            return
//        }
        let bankMangerTime = bankMangerTest
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(bankMangerTime)명이며, \
        총 업무시간은 \(String(format: "%.1f", Double(bankMangerTime) * 0.7))초입니다.
        """)
    }
}
