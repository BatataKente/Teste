//
//  UITabBarExtension.swift
//  Teste
//
//  Created by Josicleison on 04/08/22.
//

import UIKit

class BravveTabBar: UITabBar, UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.image {
            
            case UIImage(named: ButtonsBravve.locationGray.rawValue):
            
                print("Toma!!!")
            
            default:
            
                print("Kamehameha!")
        }
    }
    
    override init(frame: CGRect) {
        
        let locationTabBarItem = UITabBarItem()
        locationTabBarItem.image = UIImage(named: ButtonsBravve.locationGray.rawValue)
        
        let signInTabBarItem = UITabBarItem()
        signInTabBarItem.image = UIImage(named: ButtonsBravve.exitGray.rawValue)
        
        super.init(frame: frame)
        
        self.tintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        self.items = [locationTabBarItem, signInTabBarItem]
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
