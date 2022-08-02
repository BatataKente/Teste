//
//  BulletPoint.swift
//  Teste
//
//  Created by user208023 on 7/26/22.
//

import UIKit

class BulletPoint: UIStackView {
    
    var labelText: String
    var label = UILabel()
    var ellipseImage = UIImageView()
    
    init(labelText: String, frame: CGRect = .zero) {
        self.labelText = labelText
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBulletPointStackView() -> UIStackView {
        
        ellipseImage.image = UIImage(named: "Ellipse gray")
        ellipseImage.contentMode = .scaleAspectFit
        ellipseImage.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = labelText
        label.font = UIFont(name: "Ubuntu-Light", size: 10)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        let bulletPointStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [ellipseImage, label])
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        return bulletPointStackView
    }
}
