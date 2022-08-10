//
//  BulletPointClass+Extension.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 10/08/22.
//

import UIKit

/// Class that creates a stackview with a bullet point layout
class CustomBulletPoint: UIStackView {
    
    private var labelText: String
    var label = UILabel()
    var ellipseImage = UIImageView()
    
    
    /// Custom initializer of the bullet point stackview
    /// - Parameters:
    ///   - labelText: The text of the bullet point
    ///   - frame: The frame of the bullet point
    init(labelText: String, frame: CGRect = .zero) {
        self.labelText = labelText
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Method to create the stackView containing the bullet point image and the bullet point label
    /// - Returns: UIStackView contanining an ellipse image and a bullet point label
    func createBulletPointStackView() -> UIStackView {
        
        ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        ellipseImage.contentMode = .scaleAspectFit
        ellipseImage.translatesAutoresizingMaskIntoConstraints = false
        
        ellipseImage.widthAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        ellipseImage.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        
        label.text = labelText
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        let bulletPointStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [ellipseImage, label])
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            stackView.spacing = CGFloat(5).generateSizeForScreen
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        return bulletPointStackView
    }
}
