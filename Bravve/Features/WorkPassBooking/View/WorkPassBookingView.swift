//
//  ReservaWorkPassView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 29/07/22.
//

import Foundation
import UIKit

class WorkPassViewController: UIViewController{
    
    
    private let tableView : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        tableView.register(WorkPassCell.self, forCellReuseIdentifier: WorkPassCell.reuseId)
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        return tableView
    }()
    
    private let navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let navBarBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImagesBravve.imageReservsNav.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var tabBar = TabBarClosed(self, itemImagesNames: [
                                            ButtonsBravve.locationPink.rawValue,
                                            ButtonsBravve.calendarButtonGray.rawValue,
                                            ButtonsBravve.userLoginGray.rawValue
                                           ])
    
    
    private let backBarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let siteNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let partnerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do local parceiro"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var navBarLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [siteNameLabel, partnerNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    private let cardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.walletBlue.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.calendarGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let pencilButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.pencilGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let revisionLabel: UILabel = {
        let label = UILabel()
        label.text = "Carteira"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(14).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paymentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.creditGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cardButton,revisionLabel, calendarButton, pencilButton, paymentButton])
        stackView.distribution = .equalSpacing
        stackView.spacing = CGFloat(7).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let locationDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Forma de pagamento"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationIcon: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: IconsBravve.questionCircleBlue_2.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Qual forma de pagamento deseja realizar?"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [locationIcon, addressLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = CGFloat(8).generateSizeForScreen
        return stackView
    }()
    
    private let locationStackViewSeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var pinkButton : UIButton = {
     let button = UIButton()
        button.setTitle("Proxima Etapa", for: .normal)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,size: CGFloat(16).generateSizeForScreen)
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.addSubviews([tableView,tabBar,navBarView, buttonStackView,locationDetailLabel, locationStackView, locationStackViewSeparator,pinkButton])
        navBarView.addSubviews([navBarBackgroundImageView, backBarButton, navBarLabelStackView])
        tableView.delegate = self
        tableView.dataSource = self
        tabBar.selectedItem = tabBar.items?[0]
        
        setupConstraints()
        
    }
    private func setupConstraints() {
      
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        
        pinkButton.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        pinkButton.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        pinkButton.constraintOutsideTo(.bottom, tabBar)
        pinkButton.heightAnchorInSuperview(CGFloat(52).generateSizeForScreen)
        
        NSLayoutConstraint.activate([
            
            
            tableView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: pinkButton.topAnchor),
            
            navBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navBarView.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: CGFloat(153).generateSizeForScreen),
            navBarBackgroundImageView.topAnchor.constraint(equalTo: navBarView.topAnchor),
            navBarBackgroundImageView.widthAnchor.constraint(equalTo: navBarView.widthAnchor),
            navBarBackgroundImageView.heightAnchor.constraint(equalTo: navBarView.heightAnchor),
            
            backBarButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
            backBarButton.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: CGFloat(32).generateSizeForScreen),
            backBarButton.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
            backBarButton.widthAnchor.constraint(equalToConstant: CGFloat(8.48).generateSizeForScreen),
            
            navBarLabelStackView.topAnchor.constraint(equalTo: backBarButton.bottomAnchor, constant: CGFloat(12).generateSizeForScreen),
            navBarLabelStackView.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor),
            navBarLabelStackView.widthAnchor.constraint(equalToConstant: CGFloat(168).generateSizeForScreen),
            navBarLabelStackView.heightAnchor.constraint(equalToConstant: CGFloat(40).generateSizeForScreen),
            
            buttonStackView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalToConstant: CGFloat(191).generateSizeForScreen),
            buttonStackView.heightAnchor.constraint(equalToConstant: CGFloat(27).generateSizeForScreen),
            
            locationIcon.widthAnchor.constraint(equalToConstant: CGFloat(10.49).generateSizeForScreen),
            locationIcon.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
            
            locationStackView.topAnchor.constraint(equalTo: locationDetailLabel.bottomAnchor, constant: CGFloat(11)),
            locationStackView.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor),
            locationStackView.widthAnchor.constraint(equalToConstant: CGFloat(334).generateSizeForScreen),
            locationStackView.heightAnchor.constraint(equalToConstant: CGFloat(28).generateSizeForScreen),
            
            locationDetailLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: CGFloat(14).generateSizeForScreen),
            locationDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen)
        ])
    }
    
}

extension WorkPassViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkPassCell", for: indexPath) as? WorkPassCell else { return UITableViewCell() }
        
        switch indexPath.row {
            
        case 1 :
            cell.firstLabel.text = "Foursys"
            cell.secondLabel.text = "Workpass"
            cell.thirdLabel.text = "X creditos"
            cell.circleButton.setImage(UIImage(named: ButtonsBravve.circle.rawValue), for: .normal)
            
        case 2 :
            cell.firstLabel.text = "Bravve"
            cell.secondLabel.text = "Workpass"
            cell.thirdLabel.text = "X creditos"
            cell.circleButton.setImage(UIImage(named: ButtonsBravve.circle.rawValue), for: .normal)
            
        default :
            cell.firstLabel.text = "Cartão de credito"
            cell.secondLabel.text = "Conta pessoal"
            cell.thirdLabel.isHidden = true
            cell.circleButton.setImage(UIImage(named: ButtonsBravve.circleSelected.rawValue), for: .normal)
            
        }
        
        return cell
    }
}
