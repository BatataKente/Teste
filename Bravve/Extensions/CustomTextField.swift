//
//  TextFieldClass+Extension.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 10/08/22.
//

import UIKit

/// A class to set the custom textfield of the BraveApp
class CustomTextField: UIStackView {
    
    private var labelText: String
    var label = UILabel()
    private var buttonImageName: String
    var textField = UITextField()
    var textFieldButton = UIButton()
    var shadow = UIView()
    
    
    /// Custom initializer for the textfield class
    /// - Parameters:
    ///   - labelText: Text for the textfield placeholder
    ///   - buttonImageName: Image name of the textfieldbutton.
    ///   - frame: Frame of the textfield
    init(placeHolderText labelText: String, buttonImageName: String = "", frame: CGRect = .zero) {
        
        self.labelText = labelText
        self.buttonImageName = buttonImageName
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Creates a UIStackView containing the text field, the placeholder label and the textfieldbutton
    /// - Returns: UIStackView containing textfield, placeholder label and textfieldButton
    func createStackView() -> UIStackView {
        
        label.text = self.labelText
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        shadow.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        shadow.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        shadow.isHidden = true
        
        
        
        if buttonImageName != "" {
            
            textFieldButton.setImage(UIImage(named: buttonImageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
            textFieldButton.tintColor = UIColor(named: ColorsBravve.blue.rawValue)
            textFieldButton.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
            textFieldButton.imageView?.heightAnchorInSuperview(CGFloat(16).generateSizeForScreen)
            
            let textFieldStackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [label, textField])
                stackView.backgroundColor = .white
                stackView.axis = .vertical
                return stackView
            }()
            
            let stackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [textFieldStackView, textFieldButton])
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: CGFloat(10).generateSizeForScreen, left: CGFloat(10).generateSizeForScreen, bottom: CGFloat(10).generateSizeForScreen, right: CGFloat(10).generateSizeForScreen)
                stackView.layer.borderWidth = CGFloat(1).generateSizeForScreen
                stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
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
                stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: CGFloat(10).generateSizeForScreen, left: CGFloat(10).generateSizeForScreen, bottom: CGFloat(10).generateSizeForScreen, right: CGFloat(10).generateSizeForScreen)
                stackView.axis = .vertical
                stackView.layer.borderWidth = CGFloat(1).generateSizeForScreen
                stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .equalCentering
                return stackView
            }()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldStackViewTapped))
            stackView.addGestureRecognizer(tap)
            return stackView
        }
        
        
    }
    
    
    /// Method to handle the StackView behavior when tapped
    @objc func textFieldStackViewTapped() {
        textField.isHidden = false
        shadow.isHidden = false
        label.font = (UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen))
        textField.becomeFirstResponder()
    }
    
}
