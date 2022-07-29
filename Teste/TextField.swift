//
//  TextField.swift
//  Teste
//
//  Created by user208023 on 7/26/22.
//

import UIKit

class TextField: UIStackView {
    
    var labelText: String
    var label = UILabel()
    var buttonImageName: String
    var textField = UITextField()
    var textFieldButton = UIButton()
    
    init(placeHolderText labelText: String, buttonImageName: String = "", frame: CGRect = .zero) {
        
        self.labelText = labelText
        self.buttonImageName = buttonImageName
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStackView() -> UIStackView {
        
        label.text = self.labelText
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        
        
        if buttonImageName != "" {
            
            textFieldButton.setImage(UIImage(named: buttonImageName), for: .normal)
            textFieldButton.tintColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
            
            
            let textFieldStackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [label, textField])
                stackView.backgroundColor = .white
                stackView.axis = .vertical
                return stackView
            }()
            
            let stackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [textFieldStackView, textFieldButton])
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = 8
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                stackView.layer.borderWidth = 1
                stackView.layer.borderColor = UIColor(red: 0.816, green: 0.835, blue: 0.867, alpha: 1).cgColor
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .equalCentering
                return stackView
            }()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldStackViewTapped))
            stackView.addGestureRecognizer(tap)
            
            return stackView
        } else {
            let stackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [label, textField])
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = 8
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                stackView.axis = .vertical
                stackView.layer.borderWidth = 1
                stackView.layer.borderColor = UIColor(red: 0.816, green: 0.835, blue: 0.867, alpha: 1).cgColor
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .equalCentering
                return stackView
            }()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldStackViewTapped))
            stackView.addGestureRecognizer(tap)
            return stackView
        }
        
        
    }
    
    @objc func textFieldStackViewTapped() {
        textField.isHidden = false
        label.font = (UIFont(name: "Ubuntu-Light", size: 11))
        textField.becomeFirstResponder()
    }
    
}
