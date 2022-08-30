//
//  DetalhesAbertoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class DetailsOpenViewModel {
    
    func createStackView(_ text: String,
                         _ image: UIImage? = nil,
                         isHidden: Bool = false,
                         textColor: UIColor? = .white) -> UIStackView {
        
        let stackView = UIStackView()
        
        if let image = image {
            
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.image = image
            
            stackView.addArrangedSubview(imageView)
            
            imageView.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        }
        
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(12).generateSizeForScreen)
        label.textColor = textColor
        
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.isHidden = isHidden
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }
    
    func createSeeButtonsStackView(_ range: ClosedRange<Int>,
                                   itens: [UIStackView],
                                   titleColor: ColorsBravve = .buttonPink) -> UIButton {
        let button = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        attributeString = NSMutableAttributedString(
            string: "Ver Menos",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .selected)
        button.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                            for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowUp.rawValue),
                            for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)
        
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                                 multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        let handler = {(action: UIAction) in
            
            for i in range {

                itens[i].isHidden = !itens[i].isHidden
            }
            button.isSelected = !button.isSelected
        }
        
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return button
    }
    
    func createLabel(_ text: String?,
                     _ font: UIFont? = UIFont(name: FontsBravve.bold.rawValue,
                                              size: CGFloat(12).generateSizeForScreen),
                     textColor: UIColor? = UIColor(named: ColorsBravve.progressBarLabel.rawValue)) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.textColor = textColor
        
        return label
    }
}
