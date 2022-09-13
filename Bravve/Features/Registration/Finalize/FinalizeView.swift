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
        imageLogo.contentMode = .scaleAspectFill
        return imageLogo
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bravo!"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: FontsBravve.koho.rawValue, size: 70) // FONTE: KoHo
        titleLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        return titleLabel
    }()
    
    let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Você já pode aproveitar todas as \nvantagens de ser Bravve."
        subtitleLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 20) // FONTE: Ubuntu
        subtitleLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        subtitleLabel.numberOfLines = 10
        return subtitleLabel
    }()
    
    let imageCenter: UIImageView = {
        let image = UIImage(named: "wayFinalCadaster")
        let imageCenter = UIImageView(image: image)
        imageCenter.translatesAutoresizingMaskIntoConstraints = false
        imageCenter.contentMode = .scaleAspectFill
        return imageCenter
    }()
    
    let homeButton: UIButton = {
        let homeButton = UIButton(type: .custom)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
        homeButton.clipsToBounds = true
        let attributesFont: [NSAttributedString.Key : Any] = [
            
            NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any]

        let attributedString = NSMutableAttributedString(string: "Ir para a home",
                                                         attributes: attributesFont)
        homeButton.setAttributedTitle(NSAttributedString(attributedString: attributedString),
                                for: .normal)
        return homeButton
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        
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
        
        NSLayoutConstraint.activate([
        
            imageLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(65).generateSizeForScreen),
            imageLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            imageLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-150).generateSizeForScreen),
            imageLogo.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            imageLogo.widthAnchor.constraint(equalToConstant: CGFloat(199).generateSizeForScreen),
            
            titleLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: CGFloat(40).generateSizeForScreen),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(20).generateSizeForScreen),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
            
            imageCenter.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            imageCenter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(12.18).generateSizeForScreen),
            imageCenter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-16.43).generateSizeForScreen),
            imageCenter.heightAnchor.constraint(equalToConstant: CGFloat(350.67).generateSizeForScreen),
            imageCenter.widthAnchor.constraint(equalToConstant: CGFloat(339.55).generateSizeForScreen),
            
            homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            homeButton.heightAnchor.constraint(equalToConstant: CGFloat(52).generateSizeForScreen),
        ])
    }
    
    @objc func actionHomeButton() {
        let vc = HomeClosedView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
