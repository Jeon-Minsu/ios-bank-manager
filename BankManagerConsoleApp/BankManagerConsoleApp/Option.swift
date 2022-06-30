//
//  Option.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

enum Options {
    case open
    case close
}

extension Options: CustomStringConvertible {
    var description: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        }
    }
}
