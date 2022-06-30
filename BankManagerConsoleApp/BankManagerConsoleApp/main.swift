//
//  BankManagerConsoleApp - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

//let todayLunch = Eat()
//let brad = Person(todayEat: todayLunch)
//brad.coffee()
//brad.meal()


//let menu = Eat(coffee: "아메리카노", meal: "피자")
//let anotherMenu = Eat(coffee: "라떼", meal: "햄버거")
//
//var suhshin = Person(todayEat: menu)
//
//suhshin.printCoffee()
//suhshin.changeMenu(menu: anotherMenu)
//suhshin.printCoffee()

//// 1번
//let bank = bank()
//let bankManager = BankManager(bank: Bank)
//
//// 2번 ( 채택1 )
//let bankManager = BankManager()
//let bank = Bank(bankmanager: BankManager)

let bankerA = BankManager()
let wooriBank = Bank(bankManager: bankerA)
wooriBank.run()
