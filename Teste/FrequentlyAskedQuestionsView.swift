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
    private let customBar = UIView()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(FAQViewTableViewCell.self, forCellReuseIdentifier: FAQViewTableViewCell.identifier)
        table.register(FAQTableViewCell.self, forCellReuseIdentifier: FAQTableViewCell.identifier)
        table.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        table.register(FinalTableViewCell.self, forCellReuseIdentifier: FinalTableViewCell.id)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .singleLine
        view.addSubviews([tableView, customBar])
        setupDefaults()
        configConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        //        cell.delegate = self
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
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQViewTableViewCell.identifier, for: indexPath) as? FAQViewTableViewCell else {
                fatalError()
            }
            return cell
            
//        case 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else{
//                fatalError()
//            }
//
//            cell.titleLabel.text = self.viewModel.getQuestion(indexPath: indexPath)
//
////            cell.plusAndLessButton.tag = indexPath.row
//            cell.delegate = self
//            return cell
//
//
//        case 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else{
//                fatalError()
//            }
//            cell.isHidden = true
//            cell.subTitleLabel.attributedText = self.viewModel.getAnswer(indexPath: indexPath)
//            cell.tag = indexPath.row
//            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQTableViewCell.identifier, for: indexPath) as? FAQTableViewCell else{
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
    
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension FrequentlyAskedQuestionsView: ButtonClickPlussAndLess{
    func isClicked(button: UIButton) {
//        let cell = self.tableView.cellForRow(at: IndexPath(row: button.tag + 1, section: 0))
        
        print("OI")
        
    }
    
    
    
}
