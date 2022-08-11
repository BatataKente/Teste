//
//  WorkPassCell.swift
//  Teste
//
//  Created by user220270 on 8/10/22.
//

import Foundation
import UIKit
class WorkPassCell: UITableViewCell {
    
    
    static let reuseId: String = "WorkPassCell"
    
       lazy var cellView: UIView = {
        let view = UIView()
       // view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
        lazy var  firstLabel: UILabel = {
        let label = UILabel()
        label.text = "teste1"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: "Ubuntu-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "teste2"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
        lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "teste3"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        lazy var circleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.circleSelected.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        cellView.addSubviews([firstLabel, secondLabel, thirdLabel, circleButton])
        
        contentView.addSubview(cellView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView)
        cellView.constraintInsideTo(.leading, contentView)
        cellView.constraintInsideTo(.trailing, contentView)
        cellView.constraintInsideTo(.bottom, contentView, CGFloat(-26).generateSizeForScreen)
        cellView.heightAnchorInSuperview(CGFloat(70).generateSizeForScreen)
        
        
        
        firstLabel.constraintInsideTo(.top, cellView, CGFloat(9).generateSizeForScreen)
        firstLabel.constraintInsideTo(.leading, cellView,CGFloat(19).generateSizeForScreen)
        firstLabel.constraintOutsideTo(.bottom, secondLabel, CGFloat(9).generateSizeForScreen)
        
        secondLabel.constraintOutsideTo(.top, firstLabel, CGFloat(9).generateSizeForScreen)
        secondLabel.constraintInsideTo(.leading, cellView,CGFloat(19).generateSizeForScreen)
        secondLabel.constraintInsideTo(.bottom, cellView, CGFloat(9).generateSizeForScreen)
        
        thirdLabel.constraintInsideTo(.top, cellView, CGFloat(18).generateSizeForScreen)
        thirdLabel.constraintOutsideTo(.trailing, circleButton,CGFloat(-17).generateSizeForScreen)
        thirdLabel.constraintInsideTo(.bottom, cellView, CGFloat(18).generateSizeForScreen)
        
        circleButton.constraintInsideTo(.top, cellView, CGFloat(9).generateSizeForScreen)
        circleButton.constraintInsideTo(.trailing, cellView,CGFloat(-23).generateSizeForScreen)
        circleButton.constraintInsideTo(.centerY, cellView)
       
        
    }
}
