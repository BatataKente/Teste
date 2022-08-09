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
    
    //MARK: Elements view
    
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
    
     lazy var titleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Como eu faço para abrir o Box?", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.font = UIFont(name: FontsBravve.koho.rawValue, size: CGFloat(17).generateSizeForScreen)
        button.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
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
        contentView.layer.cornerRadius = CGFloat(15).generateSizeForScreen
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        contentView.addSubviews([backgroundCellView, subTitleLabel, plusAndLessButton, titleButton])
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
            

            self.plusAndLessButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
            self.plusAndLessButton.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: 26),
            
            
            self.titleButton.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            self.titleButton.trailingAnchor.constraint(equalTo: plusAndLessButton.leadingAnchor, constant: CGFloat(-34).generateSizeForScreen),
            self.titleButton.centerYAnchor.constraint(equalTo: self.plusAndLessButton.centerYAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleButton.bottomAnchor, constant: CGFloat(10)),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.titleButton.leadingAnchor, constant: 10),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.plusAndLessButton.trailingAnchor),
        ])
    }
}

