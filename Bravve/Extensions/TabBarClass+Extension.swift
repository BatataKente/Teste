//
//  TabBarClass+Extension.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

/* a tab bar in the app pattern with their respective actions*/

import UIKit

class BravveTabBar: UITabBar, UITabBarDelegate {
    
    private var actualView: UIViewController
    
    private func ChoseScreen(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item {
            
        case tabBar.items?[0]:
            
            if let _ = actualView as? HomeOpenView {return}
            
            let homeOpenView = HomeOpenView()
            homeOpenView.modalPresentationStyle = .fullScreen
            actualView.present(homeOpenView, animated: true)
            
        default:
            
            if let _ = actualView as? LoginView {return}
            
            let loginView = LoginView()
            loginView.modalPresentationStyle = .fullScreen
            actualView.present(loginView, animated: true)
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        ChoseScreen(tabBar, didSelect: item)
    }
    
    init(_ actualView: UIViewController, itemImagesNames: [String] = [ButtonsBravve.locationPink.rawValue,
                                                                      ButtonsBravve.exitGray.rawValue]) {
        
        self.actualView = actualView
        
        super.init(frame: .zero)
        
        self.items = []
        
        for itemImageName in itemImagesNames {
            
            let tabBarItem = UITabBarItem()
            tabBarItem.image = UIImage(named: itemImageName)
            
            self.items?.append(tabBarItem)
        }
        
        self.tintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        self.unselectedItemTintColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
