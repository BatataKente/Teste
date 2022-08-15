//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    
    private var viewModel: HelpViewModel = HelpViewModel()
    private let customBar = UIView()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(HelpViewTableViewCell.self, forCellReuseIdentifier: HelpViewTableViewCell.identifier)
        table.register(HelpTableViewCell.self, forCellReuseIdentifier: HelpTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        view.addSubviews([tableView, customBar])
        setupDefaults()
        configConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    private func setupDefaults() {
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            let navBar = HelpViewController()
            navBar.modalPresentationStyle = .fullScreen
            self.present(navBar, animated: false)
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.customBar.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
    }
}

extension HelpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HelpViewTableViewCell.identifier, for: indexPath) as? HelpViewTableViewCell else {
                fatalError()
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.identifier, for: indexPath) as? HelpTableViewCell else{
                fatalError()
            }
            cell.titleLabel.text = self.viewModel.getQuestionAnswer(indexPath: indexPath).question
            cell.subTitleLabel.attributedText = self.viewModel.getQuestionAnswer(indexPath: indexPath).answer
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


