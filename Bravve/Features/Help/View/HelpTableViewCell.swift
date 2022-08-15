//
//  FAQTableViewCell.swift
//  Files
//
//  Created by user217584 on 09/08/22.
//

import Foundation
import UIKit

class HelpTableViewCell: UITableViewCell {
    
    static let identifier = "HelpTableViewCell"
    var iconClick: Bool = true
    
    private lazy var backgroundCellView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.bounds = bounds
        return view
    }()
    
    private lazy var plusAndLessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "mostButton"), for: .normal)
        button.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    private lazy var invisibleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.koho.rawValue, size: CGFloat(17).generateSizeForScreen)
        label.textAlignment = .left
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    
    @objc func showAnswer(sender:UIButton){
        if(iconClick == true){
            plusAndLessButton.setImage(UIImage(named: "lessButton"), for: .normal)
            subTitleLabel.isHidden = false
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        contentView.addSubviews([backgroundCellView, titleLabel, subTitleLabel, plusAndLessButton, invisibleButton])
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundCellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(41).generateSizeForScreen),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: CGFloat(-41).generateSizeForScreen),
            self.backgroundCellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: CGFloat(-12).generateSizeForScreen),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: CGFloat(14).generateSizeForScreen),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-79).generateSizeForScreen),
            
            self.invisibleButton.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor),
            self.invisibleButton.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor),
            self.invisibleButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
            self.invisibleButton.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: CGFloat(-10).generateSizeForScreen),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-29).generateSizeForScreen),
            self.subTitleLabel.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor, constant: CGFloat(-35).generateSizeForScreen),
            
            self.plusAndLessButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.plusAndLessButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
        ])
    }
}

