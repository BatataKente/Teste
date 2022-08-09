//
//  FAQTableViewCell.swift
//  Files
//
//  Created by user217584 on 09/08/22.
//

import Foundation
import UIKit

class FAQTableViewCell: UITableViewCell {
    
    static let identifier = "FAQTableViewCell"
    var iconClick: Bool = true
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.layer.cornerRadius = 15
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
    
    lazy var invisibleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
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
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
            self.subTitleLabel.isHidden = false
        } else {
            plusAndLessButton.setImage(UIImage(named: "mostButton"), for: .normal)
            self.subTitleLabel.isHidden = true
        }
        iconClick = !iconClick
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.layer.cornerRadius = CGFloat(15).generateSizeForScreen
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        contentView.addSubviews([backgroundCellView, invisibleButton, titleLabel, plusAndLessButton, subTitleLabel])
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(12).generateSizeForScreen),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(41).generateSizeForScreen),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-41).generateSizeForScreen),
            self.backgroundCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat(-12).generateSizeForScreen),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: CGFloat(14).generateSizeForScreen),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-79).generateSizeForScreen),
            
            self.invisibleButton.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor),
            self.invisibleButton.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor),
            self.invisibleButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
            self.invisibleButton.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-29).generateSizeForScreen),
            
            self.plusAndLessButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.plusAndLessButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
        ])
    }
}

