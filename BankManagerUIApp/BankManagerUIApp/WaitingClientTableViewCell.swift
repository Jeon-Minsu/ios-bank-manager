//
//  WaitingClientTableViewCell.swift
//  BankManagerUIApp
//
//  Created by 허건 on 2022/07/07.
//

import UIKit

final class WaitingClientTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "WaitingClientTableViewCell"
    }
    
    let clientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Hi"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(clientLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
