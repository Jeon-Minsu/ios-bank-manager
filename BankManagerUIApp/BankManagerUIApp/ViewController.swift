//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let itemTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WaitingClientTableViewCell.self, forCellReuseIdentifier: WaitingClientTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setKoreaView()
        setKoreaTableViewConstraint()
    }
    
    private func setKoreaView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(itemTableView)
//        self.itemTableView.dataSource = self
//        self.itemTableView.delegate = self
    }
    
    private func setKoreaTableViewConstraint() {
        itemTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

