///
//  WorkPassCell.swift
//  Teste
//
//  Created by user220270 on 8/10/22.
//

import Foundation
import UIKit

class WorkPassCell: UITableViewCell {
    
    
    var delegate:WorkPassCellProtocol?
    
    static let reuseId: String = "WorkPassCell"
    
    //MARK: Elements
    
    lazy var lineView: UIView = {
        let view = UIView()
        // view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.borderCredit.rawValue)
        
        return view
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        // view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setToDefaultBackgroundColor()
        
        return view
    }()
    
    lazy var  firstLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: "Ubuntu-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var pinkCreditsLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var creditsLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var creditsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pinkCreditsLabel, creditsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = CGFloat(5).generateSizeForScreen
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 13)
        stackView.layer.borderColor = UIColor(named: ColorsBravve.borderCredit.rawValue)?.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 4
        
        
        return stackView
    }()
    
    lazy var circleButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: ButtonsBravve.circle.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: override FUNC
    
    @objc func buttonTapped (sender:UIButton) {
        delegate?.setButtonTapped(sender: sender)
       
    }

    
    //MARK: override INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        cellView.addSubviews([firstLabel, secondLabel, creditsStackView, circleButton])
        
        
        contentView.addSubviews([cellView,lineView])
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Constraints
    private func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView)
        cellView.constraintInsideTo(.leading, contentView)
        cellView.constraintInsideTo(.trailing, contentView)
        cellView.constraintInsideTo(.bottom, contentView, CGFloat(-26).generateSizeForScreen)
        cellView.heightAnchorInSuperview(CGFloat(68).generateSizeForScreen)
        
        
        
        lineView.constraintInsideTo(.leading, contentView,CGFloat(19).generateSizeForScreen)
        lineView.constraintInsideTo(.trailing, contentView,CGFloat(22).generateSizeForScreen)
        lineView.constraintInsideTo(.bottom, contentView)
        lineView.heightAnchorInSuperview(CGFloat(1).generateSizeForScreen)
        
        
        firstLabel.constraintInsideTo(.top, cellView, CGFloat(9).generateSizeForScreen)
        firstLabel.constraintInsideTo(.leading, cellView,CGFloat(19).generateSizeForScreen)
        firstLabel.constraintOutsideTo(.bottom, secondLabel, CGFloat(9).generateSizeForScreen)
        
        secondLabel.constraintOutsideTo(.top, firstLabel, CGFloat(9).generateSizeForScreen)
        secondLabel.constraintInsideTo(.leading, cellView,CGFloat(19).generateSizeForScreen)
        secondLabel.constraintInsideTo(.bottom, cellView, CGFloat(9).generateSizeForScreen)
        
        // creditsStackView.constraintInsideTo(.top, cellView, CGFloat(8).generateSizeForScreen)
        creditsStackView.constraintOutsideTo(.trailing, circleButton,CGFloat(-17).generateSizeForScreen)
        // creditsStackView.constraintInsideTo(.bottom, cellView, CGFloat(18).generateSizeForScreen)
        creditsStackView.constraintInsideTo(.centerY, cellView)
        
        circleButton.constraintInsideTo(.top, cellView, CGFloat(9).generateSizeForScreen)
        circleButton.constraintInsideTo(.trailing, cellView,CGFloat(-23).generateSizeForScreen)
        circleButton.constraintInsideTo(.centerY, cellView)
        
        
    }
    
}
// MARK: DelegateProtocol
protocol WorkPassCellProtocol {
    func setButtonTapped (sender:UIButton)
}

