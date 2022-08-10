//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class FrequentlyAskedQuestionsView: UIViewController {
    
    private var viewModel: FAQViewModel = FAQViewModel()
    let customBar = UIView()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(FAQViewTableViewCell.self, forCellReuseIdentifier: FAQViewTableViewCell.identifier)
        table.register(FAQTableViewCell.self, forCellReuseIdentifier: FAQTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(customBar)
        self.tableView.separatorStyle = .none
        setupDefaults()
        configConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    private func setupDefaults() {
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            let navBar = FrequentlyAskedQuestionsView()
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

extension FrequentlyAskedQuestionsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQViewTableViewCell.identifier, for: indexPath) as? FAQViewTableViewCell else {
                fatalError()
            }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else{
            fatalError()
        }
        cell.titleLabel.text = self.viewModel.getQuestionAnswer(indexPath: indexPath).question
        cell.subTitleLabel.text = self.viewModel.getQuestionAnswer(indexPath: indexPath).answer
            return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0{
//            return CGFloat(222).generateSizeForScreen
//        }
//        return tableView.rowHeight
//    }
}
