//
//  FAQTableViewCell.swift
//  Files
//
//  Created by user217584 on 09/08/22.
//

import Foundation
import UIKit

protocol ButtonClickPlussAndLess: AnyObject{
    func isClicked(button: UIButton)
}

class FAQTableViewCell: UITableViewCell {
    
    static let identifier = "FAQTableViewCell"
    var iconClick: Bool = false
    weak var delegate: ButtonClickPlussAndLess?
    
 
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.bounds = bounds
        view.layer.position = center
        
        return view
    }()
    
    
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, plusAndLessButton])
        let bck = UIStackView(arrangedSubviews: [view])
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .leading
        
        bck.axis = .vertical
        bck.distribution = .equalSpacing
        
        return view
    }()

    
    lazy var plusAndLessButton: UIButton = {
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
        button.isHidden = true
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
    
    private lazy var subtitleStackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(subTitleLabel)
        view.axis = .vertical
        view.distribution = .equalSpacing
        
        return view
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    

    
    @objc func showAnswer(sender:UIButton){
        iconClick.toggle()
        
        if(iconClick == true){
            plusAndLessButton.setImage(UIImage(named: "lessButton"), for: .normal)
            self.subtitleStackView.isHidden = false
            self.delegate?.isClicked(button: plusAndLessButton)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundCellView.addSubview(mainStackView)
        self.backgroundCellView.addSubview(subtitleStackView)
        self.subtitleStackView.isHidden = true
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        addSubviews([backgroundCellView, invisibleButton])
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(41)),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-41)),
            self.backgroundCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            self.mainStackView.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: 12),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: 19),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: -19),
            
            self.invisibleButton.topAnchor.constraint(equalTo: self.mainStackView.topAnchor),
            self.invisibleButton.leadingAnchor.constraint(equalTo: self.mainStackView.leadingAnchor),
            self.invisibleButton.trailingAnchor.constraint(equalTo: self.mainStackView.trailingAnchor),
            self.invisibleButton.bottomAnchor.constraint(equalTo: self.mainStackView.bottomAnchor),
            
            self.subtitleStackView.topAnchor.constraint(equalTo: self.mainStackView.bottomAnchor, constant: 12),
            self.subtitleStackView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: -41),
            self.subtitleStackView.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: 41),
            self.subtitleStackView.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor, constant: -12),
            

        ])
    }
}




//MARK: - Class

class AnswerTableViewCell: UITableViewCell{
    
    static let identifier = "AnswerTableViewCell"
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.bounds = bounds
        view.layer.position = center
        
        return view
    }()
    
    private lazy var subtitleStackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(subTitleLabel)
        view.axis = .vertical
        view.distribution = .equalSpacing
        
        return view
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews([backgroundCellView, subtitleStackView])
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            self.backgroundCellView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(41)),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-41)),
            self.backgroundCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat(-12)),
            
            self.subtitleStackView.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: 12),
            self.subtitleStackView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: -41),
            self.subtitleStackView.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: 41),
            self.subtitleStackView.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor, constant: -12),
        ])
    }
}
