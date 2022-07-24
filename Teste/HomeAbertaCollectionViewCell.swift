//
//  HomeAbertaCollectionViewCell.swift
//  Teste
//
//  Created by Josicleison on 24/07/22.
//

import UIKit

class HomeAbertaCollectionViewCell: UICollectionViewCell {
    
    let view: UIView = {
        
        let view = UIView()
        view.backgroundColor = .darkGray
        
        return view
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(view)
        
        view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
