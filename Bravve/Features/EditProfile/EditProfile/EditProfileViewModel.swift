//
//  PerfilEdicaoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol EditProfileViewModelProtocol {
    
    func setHobbiesStack(_ hobbies: [String])
    func setMattersStack(_ matters: [String])
}

class EditProfileViewModel {
    
    private let exampleApiArray_1: [String] = ["a","bola","casa","dedo","elefante","faca","g","h","i","jaca","k","l","marmanjo","ouro","panaca","q"]
    
    private let exampleApiArray_2: [String] = ["a","b","cabelo","dado","esfaqueado","f","gol","h","i","j","k","lero","manga","o","p","queijo"]
    
    var delegate: EditProfileViewModelProtocol?
    
    //MARK: - createLabel
    func createLabel(_ text: String,
                     color: ColorsBravve = .label,
                     _ font: UIFont? = UIFont(name: FontsBravve.medium.rawValue,
                                          size: CGFloat(20).generateSizeForScreen)) -> UILabel {
        
        let label = UILabel()
        
        label.text = text
        label.textColor = UIColor(named: color.rawValue)
        label.textAlignment = .left
        label.font = font
        
        return label
    }
    
    func setupStack(_ stack: UIStackView, alignment: UIStackView.Alignment? = nil) {
        
        stack.axis = .vertical
        stack.spacing = CGFloat(15).generateSizeForScreen
        if let alignment = alignment {stack.alignment = alignment}
    }
    
    //MARK: - createFieldStackView
    func createFieldStackView(labelText: String,
                              textFieldText: String,
                              textFieldTextColor: UIColor? = UIColor(named: ColorsBravve.label.rawValue),
                              isSecureTextEntry: Bool = false,
                              buttonImage: UIImage? = nil) -> UIStackView {
        
        let verticalMargins = CGFloat(12).generateSizeForScreen
        let horizontalMargins = CGFloat(17).generateSizeForScreen
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        
        let textField = UITextField()
        textField.text = textFieldText
        textField.textColor = textFieldTextColor
        textField.isEnabled = false
        textField.font = UIFont(name: FontsBravve.medium.rawValue,
                                size: CGFloat(15).generateSizeForScreen)
        textField.isSecureTextEntry = isSecureTextEntry
        
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .vertical
        stackView.spacing = CGFloat(5).generateSizeForScreen
        stackView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins,
                                               left: horizontalMargins,
                                               bottom: verticalMargins,
                                               right: horizontalMargins)
        
        if let buttonImage = buttonImage {
            
            let button = UIButton()
            button.setImage(buttonImage, for: .normal)
            stackView.addSubview(button)
            
            let handler = {(action: UIAction) in
                
                textField.isEnabled = !textField.isEnabled
                
                if textField.isEnabled {
                    
                    stackView.setBottomBorderBlue(color: UIColor.blue.cgColor)
                }
                else {
                    
                    stackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
                }
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            if textField.isSecureTextEntry {
                
                let secureTextEntryHandler = {(action: UIAction) in
                    
                    textField.isSecureTextEntry = !textField.isSecureTextEntry
                }
                
                button.addAction(UIAction(handler: secureTextEntryHandler), for: .touchUpInside)
            }
            
            button.constraintInsideTo(.centerY, stackView)
            button.constraintInsideTo(.trailing, stackView, CGFloat(15).generateSizeForScreen)
        }
        
        return stackView
    }
    
    //MARK: - setupStackView
    func createStackViews(_ buttons: [UIButton]) -> [UIStackView] {
        
        let createStackView = {(_ views: [UIView]) -> UIStackView in
            
            let stackView = UIStackView(arrangedSubviews: views)
            
            stackView.spacing = 4
            stackView.backgroundColor = .white
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            
            return stackView
        }
        
        var stackViews = [UIStackView]()
        
        var from = 0
        
        if buttons.count%2 != 0 {
            
            stackViews.append(createStackView([buttons[from]]))
            
            from += 1
        }
        
        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
            
            stackViews.append(createStackView([buttons[i],
                                               buttons[i+1]]))
        }
        
        return stackViews
    }
    
    func setupHobbies() {
        
        delegate?.setHobbiesStack(exampleApiArray_1)
    }
    
    func setupMatters() {
        
        delegate?.setMattersStack(exampleApiArray_2)
    }
}
 
