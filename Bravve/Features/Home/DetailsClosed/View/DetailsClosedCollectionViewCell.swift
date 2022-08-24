//
//  DetailsClosedCollectionViewCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 11/08/22.
//

import UIKit

class DetailsClosedCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleView: UIView = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        titleLabel.text = "WORKPASS"
        
        let titleView = UIView()
        titleView.addSubview(titleLabel)
        titleView.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        
        titleLabel.constraintInsideTo(.top, titleView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.leading, titleView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.trailing, titleView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.bottom, titleView,
                                      CGFloat(2.5).generateSizeForScreen)
        
        return titleView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubviews([imageView, titleView])
        
        imageView.fillSuperview()
        
        titleView.constraintInsideTo(.top, imageView,
                                     CGFloat(25).generateSizeForScreen)
        titleView.constraintInsideTo(.leading, imageView,
                                     CGFloat(25).generateSizeForScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
