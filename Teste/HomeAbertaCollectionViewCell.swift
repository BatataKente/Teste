//
//  HomeAbertaCollectionViewCell.swift
//  Teste
//
//  Created by Josicleison on 24/07/22.
//

import UIKit

class HomeAbertaCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
