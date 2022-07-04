//
//  BankManagerConsoleApp - main.swift
//  Created by 수꿍, 브래드. 
//  Copyright © yagom academy. All rights reserved.
// 

let bankMangerA = DepositBankManager()
let bankMangerB = DepositBankManager()
let bankMangerC = LoanBankManager()

var wooriBank = Bank(banker: bankMangerA)

wooriBank.run()
