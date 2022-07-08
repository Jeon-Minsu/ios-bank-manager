//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let bankConsole = BankManagerConsole()
    
    private let waitingClientScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let workingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var waitingClientStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    var workingtStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    var queueLabelStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    var processingStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    let clientButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let clientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "대기중"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.textColor = .white
        
        return label
    }()
    
    let workingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "업무중"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.textColor = .white
        return label
    }()
    
    let runTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "업무시간 -> 스톱워치 기능 필요"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMainView()
        setButtonStackViewConstraints()
        
        setRunTimeLabelConstraints()
        
        setQueueLabelStackViewConstraints()
        setProcessingStackViewConstraints()
        
        setWaitingClientStackViewConstraints()
        setWorkingStackViewConstraints()
        
        clientButton.addTarget(self, action: #selector(addLabel), for: .touchUpInside)
        clientButton.addTarget(self, action: #selector(addLabel2), for: .touchUpInside)

    }
    
    @objc func addLabel() {
        DispatchQueue.main.async() {
            for i in 1...5 {
                self.addItemStackView()
                print(i)
            //Thread.sleep(forTimeInterval: 1)
            }
        }
    }
    
    @objc func addLabel2() {
        DispatchQueue.main.async() {
            for i in 1...1000 {
                self.addItemStackView2()
                print(i)
            //Thread.sleep(forTimeInterval: 2)
            }
        }
    }
    
    private func makeLabel() -> UILabel {
        let clientLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .preferredFont(forTextStyle: .title1)
            label.adjustsFontForContentSizeCategory = true
            label.text = "Hi"
            label.textAlignment = .center
            return label
        }()
        
        return clientLabel
    }
    
    private func setMainView() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(buttonStackView)
        self.buttonStackView.addArrangedSubview(clientButton)
        self.buttonStackView.addArrangedSubview(resetButton)
        
        self.view.addSubview(runTimeLabel)
        
        self.view.addSubview(queueLabelStackView)
        self.queueLabelStackView.addArrangedSubview(clientLabel)
        self.queueLabelStackView.addArrangedSubview(workingLabel)
        
        self.view.addSubview(processingStackView)
        self.processingStackView.addArrangedSubview(waitingClientScrollView)
        self.processingStackView.addArrangedSubview(workingScrollView)
        
        self.waitingClientScrollView.addSubview(waitingClientStackView)
        self.workingScrollView.addSubview(workingtStackView)
    }
    
    private func setButtonStackViewConstraints() {
        buttonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: self.runTimeLabel.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setRunTimeLabelConstraints() {
        runTimeLabel.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor).isActive = true
        runTimeLabel.bottomAnchor.constraint(equalTo: self.queueLabelStackView.topAnchor).isActive = true
        runTimeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        runTimeLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setQueueLabelStackViewConstraints() {
        queueLabelStackView.topAnchor.constraint(equalTo: self.runTimeLabel.bottomAnchor).isActive = true
        queueLabelStackView.bottomAnchor.constraint(equalTo: self.processingStackView.topAnchor).isActive = true
        queueLabelStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        queueLabelStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setProcessingStackViewConstraints() {
        processingStackView.topAnchor.constraint(equalTo: self.queueLabelStackView.bottomAnchor).isActive = true
        processingStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        processingStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        processingStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setWaitingClientStackViewConstraints() {
        waitingClientStackView.topAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.topAnchor, constant: 10).isActive = true
        waitingClientStackView.bottomAnchor.constraint(equalTo: waitingClientScrollView.contentLayoutGuide.bottomAnchor, constant: 10).isActive = true
        waitingClientStackView.leadingAnchor.constraint(equalTo: waitingClientScrollView.frameLayoutGuide.leadingAnchor, constant: 10).isActive = true
        waitingClientStackView.trailingAnchor.constraint(equalTo: waitingClientScrollView.frameLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setWorkingStackViewConstraints() {
        workingtStackView.topAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.topAnchor, constant: 10).isActive = true
        workingtStackView.bottomAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.bottomAnchor, constant: 10).isActive = true
        workingtStackView.leadingAnchor.constraint(equalTo: workingScrollView.frameLayoutGuide.leadingAnchor, constant: 10).isActive = true
        workingtStackView.trailingAnchor.constraint(equalTo: workingScrollView.frameLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func addItemStackView() {
        waitingClientStackView.addArrangedSubview(self.makeLabel())
    }
    
    private func addItemStackView2() {
        workingtStackView.addArrangedSubview(self.makeLabel())
    }
}

