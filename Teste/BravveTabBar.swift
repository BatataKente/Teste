//
//  UITabBarExtension.swift
//  Teste
//
//  Created by Josicleison on 04/08/22.
//

import UIKit

class BravveTabBar: UITabBar, UITabBarDelegate {

    var actualView: UIViewController

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        switch item {
            
            case tabBar.items?[0]:
            
                let homeOpenView = HomeOpenView()

                homeOpenView.modalPresentationStyle = .fullScreen
                actualView.present(homeOpenView, animated: true)
                
            default:

                let loginView = LoginView()

                loginView.modalPresentationStyle = .fullScreen
                actualView.present(loginView, animated: true)
        }
    }

    init(_ actualView: UIViewController, itemImagesNames: [String]) {

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
