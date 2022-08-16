//
//  FinalizarView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class FinalizeView: UIViewController {

    let imageLogo: UIImageView = {
        let image = UIImage(named: "logoWhite")
        let imageLogo = UIImageView(image: image)
        imageLogo.frame = CGRect(x: 0, y: 0, width: 199, height: 50)
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bravo!"
        titleLabel.font = UIFont(name: "KoHo-Bold", size: 70) // FONTE: KoHo
        titleLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        return titleLabel
    }()
    
    let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Você já pode aproveitar todas as \nvantagens de ser Bravve."
        subtitleLabel.font = UIFont(name: "Ubuntu-Bold", size: 20) // FONTE: Ubuntu
        subtitleLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        subtitleLabel.numberOfLines = 10
        return subtitleLabel
    }()
    
    let imageCenter: UIImageView = {
        let image = UIImage(named: "wayFinalCadaster")
        let imageCenter = UIImageView(image: image)
        imageCenter.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        imageCenter.translatesAutoresizingMaskIntoConstraints = false
        return imageCenter
    }()
    
    let homeButton: UIButton = {
        let homeButton = UIButton(type: .custom)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setTitle("Ir para a home", for: .normal)
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
        homeButton.layer.cornerRadius = 8
        homeButton.clipsToBounds = true
        return homeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
        view.backgroundColor = UIColor(red: 0.02, green: 0, blue: 0.37, alpha: 1)
        
        homeButton.addTarget(self, action: #selector(actionHomeButton), for: .touchUpInside)
    }
    
    
        
    private func addSubViews() {
        view.addSubview(imageLogo)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(imageCenter)
        view.addSubview(homeButton)
    }
    
    private func setConstraints() {
        setLogoConstraints()
        setTitleConstraints()
        setSubtitleConstraints()
        setImageCenterConstraints()
        setHomeButtonConstraints()
    }

    
    private func setLogoConstraints() {
        let constraint = [
            imageLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            imageLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            imageLogo.heightAnchor.constraint(equalToConstant: 50),
            imageLogo.widthAnchor.constraint(equalToConstant: 199)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setTitleConstraints() {
        let constraint = [
            titleLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setSubtitleConstraints() {
        let constraint = [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setImageCenterConstraints() {
        let constraint = [
            imageCenter.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageCenter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            imageCenter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            imageCenter.heightAnchor.constraint(equalToConstant: 400)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setHomeButtonConstraints() {
        let constraint = [
            homeButton.topAnchor.constraint(equalTo: imageCenter.bottomAnchor, constant: 22),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            homeButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    @objc func actionHomeButton() {
        let vc = HomeClosedView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
