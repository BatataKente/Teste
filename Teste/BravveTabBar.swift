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
            
            case UIImage(named: ButtonsBravve.locationPink.rawValue):
            
                print("Toma!!!")
            
            case UIImage(named: ButtonsBravve.calendarGray.rawValue):
            
                print("Eu tenho a força!!")
            
            default:
            
                print("Kamehameha!")
        }
    }
    
    override init(frame: CGRect) {
        
        let firstTabBarItem = UITabBarItem()
        firstTabBarItem.image = UIImage(named: ButtonsBravve.locationPink.rawValue)
        
        let secondTabBarItem = UITabBarItem()
        secondTabBarItem.image = UIImage(named: ButtonsBravve.calendarGray.rawValue)
        
        let thirdyTabBarItem = UITabBarItem()
        thirdyTabBarItem.image = UIImage(named: ButtonsBravve.alert.rawValue)
        
        super.init(frame: frame)
        
        self.items = [firstTabBarItem, secondTabBarItem, thirdyTabBarItem]
        self.barTintColor = .red
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
