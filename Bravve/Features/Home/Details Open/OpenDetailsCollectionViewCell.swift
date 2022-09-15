//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class OpenDetailsCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = CGFloat(25).generateSizeForScreen
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func createWorkPassLabel() {
        
        let titleView: UIView = {
            
            let titleLabel = UILabel()
            titleLabel.textColor = .white
            titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                     size: CGFloat(13).generateSizeForScreen)
            titleLabel.text = "WORKPASS"
            
            let titleView = UIView()
            titleView.addSubview(titleLabel)
            titleView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor,
                                            constant: CGFloat(2.5).generateSizeForScreen).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor,
                                                constant: CGFloat(2.5).generateSizeForScreen).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor,
                                                 constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor,
                                               constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
            
            return titleView
        }()
        
        contentView.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.topAnchor.constraint(equalTo: imageView.topAnchor,
                                       constant: CGFloat(25).generateSizeForScreen).isActive = true
        titleView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,
                                       constant: CGFloat(25).generateSizeForScreen).isActive = true
    }
}
