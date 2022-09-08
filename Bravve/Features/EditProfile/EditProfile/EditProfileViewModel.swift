//
//  EditProfileViewModel.swift
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
    
    /// create a Label with default of editing profile View
    /// - Parameters:
    ///   - text: the text of label
    ///   - color: the collor of text(default is Collorsbravve.label.rawValue)
    ///   - font: font(default: FontsBravve.medium.rawValue)
    /// - Returns: the label
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
    
    /// Setup Super Stack with default of editing profile View
    /// - Parameters:
    ///   - stack: the stack
    ///   - alignment: the alignment(default is UIKit default stackView alignment)
    func setupStack(_ stack: UIStackView, alignment: UIStackView.Alignment? = nil) {
        
        stack.axis = .vertical
        stack.spacing = CGFloat(15).generateSizeForScreen
        if let alignment = alignment {stack.alignment = alignment}
    }
    
    /// Creates a stackView in default of EditProfileView, with a textField, margins and label
    /// - Parameters:
    ///   - labelText: The label of stack
    ///   - textFieldText: the text of text field, if initialize with a text by default
    ///   - textFieldTextColor: the textFieldTextColor
    ///   - isSecureTextEntry: if text field initialize  with secure entry
    ///   - buttonImage: the button Image(if not have, the button also wont be created)
    /// - Returns: The stackView
    func createStackView(labelText: String,
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
            
            constraint(the: button, to: stackView, by: [.centerY])
            constraint(the: button, to: stackView, by: [.trailing], CGFloat(-15).generateSizeForScreen)
        }
        
        return stackView
    }
    
    /// This function create stackViews with buttons, but organize two buttons in every stack created, and one if number of buttons is odd
    /// - Parameter buttons: buttons
    /// - Returns: array of stackView
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
    
    /// This functions create and add to superview of a view one or multipleconstraints
    /// - Parameters:
    ///   - item: the view
    ///   - to: an element to conect constraints
    ///   - itemAttribute: attribute of view to connect constraints(will be the same of element by default)
    ///   - attributes: the atributes of item to connect constraints
    ///   - relation: relation, the default is .equal
    ///   - multiplier: multiplier, the default is 1
    ///   - constant: constant, the default is 0
    func constraint(the item: UIView,
                    to: Any?,
                    _ itemAttribute: NSLayoutConstraint.Attribute? = nil,
                    by attributes: [NSLayoutConstraint.Attribute],
                    relation: NSLayoutConstraint.Relation? = nil,
                    multiplier: CGFloat? = nil,
                    _ constant: CGFloat? = nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in attributes {
            
            item.superview?.addConstraint(NSLayoutConstraint(item: item,
                                                             attribute: attribute,
                                                             relatedBy: relation ?? .equal,
                                                             toItem: to,
                                                             attribute: itemAttribute ?? attribute,
                                                             multiplier: multiplier ?? 1,
                                                             constant: constant ?? 0))
        }
    }
    
    /// This function remove masks of a view and subviews from it
    /// - Parameter view: the view to remove masks
    func removeMasks(of view: UIView) {
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupHobbies() {
        
        delegate?.setHobbiesStack(exampleApiArray_1)
    }
    
    func setupMatters() {
        
        delegate?.setMattersStack(exampleApiArray_2)
    }
}
 
