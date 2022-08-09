//
//  FAQCollectionViewCell.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class FAQCollectionViewCell: UICollectionViewCell {
    static let identifier = "FAQCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont(name: FontsBravve.koho.rawValue, size: CGFloat(17).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var plusAndLessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "mostButton"), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    var iconClick: Bool = true
    
    @objc func showAnswer(sender:UIButton){
        if(iconClick == true){
            plusAndLessButton.setImage(UIImage(named: "lessButton"), for: .normal)
        } else {
            plusAndLessButton.setImage(UIImage(named: "mostButton"), for: .normal)
        }
        iconClick = !iconClick
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = CGFloat(15).generateSizeForScreen
        contentView.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(plusAndLessButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: FAQCollectionViewCellViewModel){
        titleLabel.text = viewModel.question
        subTitleLabel.text = viewModel.answer
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(14).generateSizeForScreen),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-79).generateSizeForScreen),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(68).generateSizeForScreen),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-29).generateSizeForScreen),
            
            self.plusAndLessButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.plusAndLessButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
            
        ])
    }
}

