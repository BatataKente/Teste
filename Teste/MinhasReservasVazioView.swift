//
//  MinhasReservasVazioView.swift
//  Teste
//
//  Created by user220210 on 8/16/22.
//

import UIKit

class MinhasReservasVazioView: UIViewController {
    
    let navCustomBar = UIView()
    
    let topRightWay = UIImageView()

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
        
    }
    
    private func setDefaults() {
        
        topRightWay.setWayToDefault(.wayReserv_2)
        bottomLeftWay.setWayToDefault(.wayReserv_1)
    }
    
    private func setConstraints() {
        
    }
    
}
