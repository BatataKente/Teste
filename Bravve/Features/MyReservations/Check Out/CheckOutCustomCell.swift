//
//  CheckOutCustomCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/08/22.
//

import UIKit

class CheckOutCustomCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 25
        imageView.image = UIImage(named: ImagesBravve.example_1.rawValue)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    //  lazy var titleView: UIView = {
        
    //   let titleLabel = UILabel()
    //   titleLabel.textColor = .white
    //   titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
    //                            size: CGFloat(13).generateSizeForScreen)
    //   titleLabel.text = "WORKPASS"
        
    //  let titleView = UIView()
    //   titleView.addSubview(titleLabel)
    //   titleView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
    //   titleLabel.constraintInsideTo(.top, titleView,
    //                                  CGFloat(2.5).generateSizeForScreen)
    //   titleLabel.constraintInsideTo(.leading, titleView,
    //                                 CGFloat(2.5).generateSizeForScreen)
    //  titleLabel.constraintInsideTo(.trailing, titleView,
    //                                 CGFloat(2.5).generateSizeForScreen)
    //   titleLabel.constraintInsideTo(.bottom, titleView,
    //                                CGFloat(2.5).generateSizeForScreen)
        
    //  return titleView
    // }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubviews([imageView])
        
        imageView.fillSuperview()
        
        // titleView.constraintInsideTo(.top, imageView,
        //                            CGFloat(25).generateSizeForScreen)
        //  titleView.constraintInsideTo(.leading, imageView,
        //                            CGFloat(25).generateSizeForScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

