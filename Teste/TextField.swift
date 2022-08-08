/*
 
 A class that creates a custom textfield with the characteristics of the BravveApp textfield.
 
 params:
 placeholderText: String -> The text which will serve as the placeholder inside the textfield.
 buttonImageName(optional): String -> The name of the asset that will serve as the textfield button. This parameter must only be passed if the textfield has a button inside.
 */

import UIKit

class TextField: UIStackView {
    
    private var labelText: String
    var label = UILabel()
    private var buttonImageName: String
    var textField = UITextField()
    var textFieldButton = UIButton()
    var shadow = UIView()
    
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
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        shadow.backgroundColor = .blue
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
    
    @objc func textFieldStackViewTapped() {
        textField.isHidden = false
        shadow.isHidden = false
        label.font = (UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen))
        textField.becomeFirstResponder()
    }
    
}
