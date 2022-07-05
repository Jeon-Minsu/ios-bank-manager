//
//  Banker+Extension.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/01.
//

import Foundation

extension Banker {
    
//    func viewRed(_ client: Client) -> DispatchWorkItem {
//        let semaphore = DispatchSemaphore(value: 2)
//        let red = DispatchWorkItem {
//            semaphore.wait()
//                print("예금담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 시작")
//                Thread.sleep(forTimeInterval: time)
//                print("예금담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 완료")
//
//            semaphore.signal()
//
//        }
//        return red
//    }
//
//    func viewRed2(_ client: Client) -> DispatchWorkItem {
//
//        let red2 = DispatchWorkItem {
//            semaphore1.wait()
//            print("대출담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 시작")
//            Thread.sleep(forTimeInterval: 1.1)
//            print("대출담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 완료")
//            semaphore1.signal()
//
//        }
//        return red2
//    }
    
    func workBanker(_ clientQueue: inout ClientQueue<Client>, _ servedClient: inout Int) {
        let group = DispatchGroup()
        let deQueue = DispatchQueue(label: "예금", attributes: .concurrent)
        let loQueue = DispatchQueue(label: "대출", attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 2)
        let semaphore1 = DispatchSemaphore(value: 1)

        while clientQueue.isEmpty == false {
            guard let client = clientQueue.dequeue() else {
                return
            }
            if client.desiredServices == "예금" {
                deQueue.async(group: group) {
                    semaphore.wait()
                        print("🚀예금담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 시작")
                        Thread.sleep(forTimeInterval: time)
                        print("🚀예금담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 완료")
                    semaphore.signal()
                }
            } else if client.desiredServices == "대출" {
                loQueue.async(group: group) {
                    semaphore1.wait()
                    print("📝대출담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 시작")
                    Thread.sleep(forTimeInterval: 1.1)
                    print("📝대출담당 매니저 \(client.waitingNumber)번 고객 \(client.desiredServices)업무 완료")
                    semaphore1.signal()
                }
            }
            servedClient += 1
        }
        group.wait()
    }
    
    func work(from clientQueue: inout ClientQueue<Client>) -> Int {
        var servedClient: Int = .zero
        workBanker(&clientQueue, &servedClient)
        
        return servedClient
    }
}
