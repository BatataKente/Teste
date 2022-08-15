//
//  AnswerTabn=bleViewCell.swift
//  Teste
//
//  Created by user220256 on 8/12/22.
//

import Foundation
import UIKit


class FinalTableViewCell: UITableViewCell{
    static let id = "FinalTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),self.containerView.topAnchor.constraint(equalTo: self.topAnchor),self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.axis = .vertical
        view.addArrangedSubview(cellView)
        view.addArrangedSubview(detailView)
        
        return view
    }()
    private let cellView = FAQTableViewCell()
    private let detailView = AnswerTableViewCell()
    
    func setUI(viewModel: FAQViewModel, indexPath: IndexPath){
        cellView.titleLabel.text = viewModel.getQuestionAnswer(indexPath: indexPath).question
        detailView.subTitleLabel.attributedText = viewModel.getQuestionAnswer(indexPath: indexPath).answer
    }
}

extension FinalTableViewCell {
    var isDetailViewHidden: Bool {
        return detailView.isHidden
    }

    func showDetailView() {
        detailView.isHidden = false
    }

    func hideDetailView() {
        detailView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isDetailViewHidden, selected {
            showDetailView()
        } else {
            hideDetailView()
        }
    }
}
