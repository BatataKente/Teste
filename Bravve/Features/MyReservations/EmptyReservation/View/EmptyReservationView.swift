//
//  EmptyReservationView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 16/08/22.
//

import UIKit

class EmptyReservation: UIViewController {
    
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
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        return label
    }()
    
    let searchNewSpaceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        let attributesFont: [NSAttributedString.Key : Any] = [
            
            NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any]

        let attributedString = NSMutableAttributedString(string: "Procurar um Espaço",
                                                         attributes: attributesFont)
        button.setAttributedTitle(NSAttributedString(attributedString: attributedString),
                                for: .normal)
        return button
    }()
    
    let bottomLeftWay: UIImageView = {
        let image = UIImage(named: "wayReserv_1")
        let imageBottom = UIImageView(image: image)
        imageBottom.contentMode = .scaleAspectFill
        return imageBottom
    }()
        
    lazy var navCustomBar = UIView()
    
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
        tabBar.selectedItem = tabBar.items?[1]
        navCustomBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") { _ in
            self.dismiss(animated: true)
        }
        
        searchNewSpaceButton.addTarget(self, action: #selector(actionSearchNewSpaceButton), for: .touchUpInside)

    }
    
    @objc func actionSearchNewSpaceButton() {
        let vc = HomeClosedView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func addSubViews() {
        view.addSubview(topRightWay)
        view.addSubview(navCustomBar)
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
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(343).generateSizeForScreen),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(114.5).generateSizeForScreen),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-110.5).generateSizeForScreen),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setButtonConstraints(){
        
        let constraint = [
            searchNewSpaceButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CGFloat(8).generateSizeForScreen),
            searchNewSpaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22).generateSizeForScreen),
            searchNewSpaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22).generateSizeForScreen),
            searchNewSpaceButton.heightAnchor.constraint(equalToConstant: CGFloat(52).generateSizeForScreen)
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
