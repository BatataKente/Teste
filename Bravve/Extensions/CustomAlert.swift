//
//  CustomAlert.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 13/08/22.
//

import UIKit

/// Class created to implement a method and all its elements for a custom alert, where you can change the color of buttons, fonts and insert images in your alert.
class CustomAlert: UIViewController {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.5
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: ColorsBravve.blackWhiteAlert.rawValue)
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        alert.clipsToBounds = true
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 4
        return alert
    }()
    
    private var myTargetView: UIView?
    
    /// Method that uses a custom alert where we can implement images and buttons.
    /// How to implemented
    /// customAlert.showAlert( message: "Ola", enterAttributed: "enter",  cancelAttributed: "cancel",  on: self)
    /// - Parameters:
    ///   - image: Implement an image for your alert, it comes default as in nil.
    ///   - message: Implement an message for your alert.
    ///   - enterAttributed: Implement the text for your enter button.
    ///   - enterHandler: Implement an action for your enter button, it defaults to dismiss.
    ///   - cancelAttributed: Implement the text for your cancel button.
    ///   - cancelHandler: Implement an action for your cancel button.
    ///   - viewController: Implement the viewcontroller where the method is being used
    func showAlert(image: UIImage? = nil, message: String,
                   enterAttributed: String , enterHandler: UIAction? = nil,
                   cancelAttributed: String? = nil, cancelHandler: UIAction? = nil,
                   on viewController: UIViewController) {
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        messageLabel.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        messageLabel.text = message
        messageLabel.textAlignment = .center
        
        alertView.addSubview(messageLabel)
        
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        enterButton.layer.cornerRadius = 12
        
        let attributesFont: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any]
        
        let attributedString = NSMutableAttributedString(string: enterAttributed, attributes: attributesFont)
        enterButton.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        enterButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        if let enterHandler = enterHandler {
            enterButton.addAction(enterHandler, for: .touchUpInside)
        }
        
        alertView.addSubview(enterButton)
        
        if image == nil {
            NSLayoutConstraint.activate([
                messageLabel.topAnchor.constraint(equalTo: alertView.topAnchor,
                                                  constant: CGFloat(16).generateSizeForScreen),
            ])
        } else {
            
            let alertImage = UIImageView()
            alertImage.translatesAutoresizingMaskIntoConstraints = false
            alertImage.image = image
            alertImage.clipsToBounds = true
            
            alertView.addSubview(alertImage)
            
            NSLayoutConstraint.activate([
                alertImage.widthAnchor.constraint(equalToConstant: CGFloat(16).generateSizeForScreen),
                alertImage.topAnchor.constraint(equalTo: alertView.topAnchor,
                                                constant: CGFloat(16).generateSizeForScreen),
                alertImage.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
                
                messageLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor,
                                                  constant: CGFloat(16).generateSizeForScreen),
            ])
        }
        
        if cancelAttributed == nil {
            NSLayoutConstraint.activate([
                enterButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor,
                                                    constant: CGFloat(-16).generateSizeForScreen)
            ])
        } else {
            let cancelButton = UIButton()
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            cancelButton.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
            cancelButton.layer.borderWidth = 1
            cancelButton.layer.borderColor = UIColor(named: ColorsBravve.textField.rawValue)?.cgColor
            
            cancelButton.layer.cornerRadius = 12
            
            let cancelAttributesFont: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue,
                                                    size: CGFloat(16).generateSizeForScreen) as Any,
                NSAttributedString.Key.foregroundColor: UIColor(named: ColorsBravve.textField.rawValue) as Any]
            
            let cancelAttributedString = NSMutableAttributedString(string: cancelAttributed ?? "",
                                                                   attributes: cancelAttributesFont)
            cancelButton.setAttributedTitle(NSAttributedString(attributedString: cancelAttributedString),
                                            for: .normal)
            
            if let cancelHandler = cancelHandler {
                cancelButton.addAction(cancelHandler, for: .touchUpInside)
            }
            
            alertView.addSubview(cancelButton)
            
            NSLayoutConstraint.activate([
                cancelButton.widthAnchor.constraint(equalToConstant: CGFloat(260).generateSizeForScreen),
                cancelButton.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
                cancelButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor,
                                                  constant: CGFloat(16).generateSizeForScreen),
                cancelButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
                cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor,
                                                     constant: CGFloat(-16).generateSizeForScreen),
            ])
        }
        NSLayoutConstraint.activate([
        
            alertView.widthAnchor.constraint(equalToConstant: CGFloat(300).generateSizeForScreen),
            alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
            
            messageLabel.widthAnchor.constraint(equalToConstant: CGFloat(267).generateSizeForScreen),
            messageLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            enterButton.widthAnchor.constraint(equalToConstant: CGFloat(260).generateSizeForScreen),
            enterButton.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            enterButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor,
                                             constant: CGFloat(16).generateSizeForScreen),
            enterButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
        ])
        
        UIView.animate(withDuration: 0.25,
                       animations: {
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
    }
    
    @objc func dismissAlert() {
        
        self.alertView.removeFromSuperview()
        self.backgroundView.removeFromSuperview()
    
    }
}

