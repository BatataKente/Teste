//
//  CheckOutScreen.swift
//  Bravve
//
//  Created by user217685 on 8/3/22.
//

import UIKit

class CheckOutScreen: UIViewController{
 
    //MARK: - Labels
    
    let customBar = UIView()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "BOXOFFICE"
        lb.font = UIFont(name: "Ubuntu-Medium", size: 15)
        lb.backgroundColor = UIColor(named: "boxOffice")
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Numa esquina\ncharmosa, um hotel"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 20)
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var reserveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageReservs3")

        return image
    }()
    lazy var reserveImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageReservs4")

        return image
    }()
    lazy var infoLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Home by Kamy"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 20)
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UM Coffe Co."
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 12)
        lb.textColor = UIColor(named: "label")
        lb.textAlignment = .left
        return lb
    }()
    lazy var detailLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes do local"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 16)
        lb.textColor = UIColor(named: "label")
        lb.textAlignment = .left
        return lb
    }()
    lazy var iconImagePeople: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "users")

        return image
    }()
    lazy var numberPeopleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Até 6 pessoas"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 16)
        lb.textColor = UIColor(named: "label")
        lb.textAlignment = .left
        return lb
    }()
    lazy var buttonMainDoor: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta principal", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 14)
        button.backgroundColor = UIColor(named: "buttonPink")
        button.addTarget(self, action: #selector(buttonMaindoorTap), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonMaindoorTap(){
        
    }
    lazy var buttonOpenSpace: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta do espaço", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 14)
        button.backgroundColor = UIColor(named: "buttonPink")
        button.addTarget(self, action: #selector(buttonOpenSpaceTap), for: .touchUpInside)
        return button
    }()
    
    
    @objc func buttonOpenSpaceTap(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setupViews()
        setupDefaults()
        setupContraints()
        
       
    }
    func setupViews(){
        view.addSubview(titleLabel)
        view.addSubview(descriptLabel)
        view.addSubview(reserveImage)
        view.addSubview(reserveImage2)
        view.addSubview(infoLocalLabel)
        view.addSubview(nameLocalLabel)
        view.addSubview(detailLocalLabel)
        view.addSubview(iconImagePeople)
        view.addSubview(numberPeopleLabel)
        view.addSubview(buttonMainDoor)
        view.addSubview(buttonOpenSpace)
        view.addSubview(customBar)

    }
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Check out"){
            _ in
            
        }
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reserveImage.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reserveImage.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.80),
            reserveImage.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.37),
            reserveImage2.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage2.leadingAnchor.constraint(equalTo: reserveImage.trailingAnchor,constant: 16),
            reserveImage2.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.80),
            reserveImage2.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.37),
            infoLocalLabel.topAnchor.constraint(equalTo: reserveImage.bottomAnchor,constant: 30),
            infoLocalLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 16),
            nameLocalLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 16),
            detailLocalLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            iconImagePeople.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 16),
            iconImagePeople.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            numberPeopleLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 16),
            numberPeopleLabel.leadingAnchor.constraint(equalTo: iconImagePeople.trailingAnchor,constant: 4),
            numberPeopleLabel.centerYAnchor.constraint(equalTo: iconImagePeople.centerYAnchor),
            buttonMainDoor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonMainDoor.topAnchor.constraint(equalTo: numberPeopleLabel.bottomAnchor,constant: 16),
            buttonMainDoor.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.063),
            buttonMainDoor.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.50),
            buttonOpenSpace.leadingAnchor.constraint(equalTo: buttonMainDoor.trailingAnchor,constant: 3),
            buttonOpenSpace.topAnchor.constraint(equalTo: numberPeopleLabel.bottomAnchor,constant: 16),
            buttonOpenSpace.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.063),
            buttonOpenSpace.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.50),
         
            
        ])
    }
    


   
}

