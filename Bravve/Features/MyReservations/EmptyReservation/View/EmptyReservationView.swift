//
//  EmptyReservationView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 16/08/22.
//

import UIKit

class EmptyReservation: UIViewController {
    
    let navCustomBar = UIView()
    
    let topRightWay: UIImageView = {
        let image = UIImage(named: "wayReserv2")
        let imageTop = UIImageView(image: image)
        return imageTop
    }()

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nada por aqui, ainda!"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = .black
        return label
    }()
    
    let searchNewSpaceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Procurar um Espaço", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    let bottomLeftWay = UIImageView()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
        setDefaults()
        view.backgroundColor = UIColor(named: "background")
        
        navCustomBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") { _ in
            return
        }

    }
    
    private func addSubViews() {
        view.addSubview(navCustomBar)
        view.addSubview(topRightWay)
        view.addSubview(label)
        view.addSubview(searchNewSpaceButton)
        view.addSubview(bottomLeftWay)
        view.addSubview(tabBar)
        
    }
    
    private func setDefaults() {
        
        topRightWay.setWayToDefault(.wayReserv_2)
        bottomLeftWay.setWayToDefault(.wayReserv_1)
    }
    
    private func setConstraints() {
        
        setLabelConstraints()
        setButtonConstraints()
        setTabBarConstraints()
    }
    
    
    private func setLabelConstraints(){
        
        let constraint = [
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 343),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 114.5),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110.5),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setButtonConstraints(){
        
        let constraint = [
            searchNewSpaceButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            searchNewSpaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            searchNewSpaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            searchNewSpaceButton.heightAnchor.constraint(equalToConstant: 52)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setTabBarConstraints(){
        
        let constraint = [
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
}
