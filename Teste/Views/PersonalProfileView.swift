//
//  PerfilPessoalView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PersonalProfileView: UIViewController{
    
    private lazy var tabBar = TabBarClosed(self, itemImagesNames: [ButtonsBravve.locationGray.rawValue,
                                                                   ButtonsBravve.calendarButtonGray.rawValue,
                                                                   ButtonsBravve.userLoginPink.rawValue
                                                                  ])
    
    let wayImage: UIImageView = {
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let profilePic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Ana!"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(30).generateSizeForScreen)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ana.maria@teste.com.br"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(red: 1, green: 0.125, blue: 0.475, alpha: 0.1).cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        return view
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Foursys"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        return label
    }()
    
    let subInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = .gray
        return label
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(red: 1, green: 0.125, blue: 0.475, alpha: 0.1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let bravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Bravve"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        return label
    }()
    
    let subBravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = .gray
        return label
    }()
    
    let infoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info-circle")
        return image
    }()
    
    let reservationLabel: UILabel = {
        let label = UILabel()
        label.text = "Histórico de reservas"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()
    
    let nextPageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()

    var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let helpImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info-circle")
        return image
    }()
    
    let helpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ajuda"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()
    
    let nextPageButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    var separatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let policyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "book")
        return image
    }()
    
    let policyLabel: UILabel = {
        let label = UILabel()
        label.text = "Política e Termos de uso"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()
    
    let nextPageButton3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    var separatorView4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let logoutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "exitProfile")
        return image
    }()
    
    let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Sair"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()

    let nextPageButton4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    var separatorView5: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    var smallView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1).cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "112"
        label.textColor = UIColor(named: "buttonPink")
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    var creditLabel: UILabel = {
        let label = UILabel()
        label.text = "créditos"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    var smallView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1).cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    
    var numberLabel2: UILabel = {
        let label = UILabel()
        label.text = "312"
        label.textColor = UIColor(named: "buttonPink")
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    var creditLabel2: UILabel = {
        let label = UILabel()
        label.text = "créditos"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.selectedItem = tabBar.items?[2]

        view.backgroundColor = UIColor(named: "background")
        
        view.addSubviews([tabBar, wayImage, profilePic, helloLabel, subtitleLabel, backView, infoLabel, subInfoLabel, separatorView, bravveInfoLabel, subBravveInfoLabel, infoImage, reservationLabel, nextPageButton, separatorView2, helpImage, helpLabel, nextPageButton2, separatorView3, policyImage, policyLabel, nextPageButton3, separatorView4, logoutImage, logoutLabel, nextPageButton4, separatorView5, smallView, numberLabel, creditLabel, smallView2, numberLabel2, creditLabel2])
        
        nextPageButton.addTarget(self, action: #selector(reservationPage), for: .touchUpInside)
        nextPageButton2.addTarget(self, action: #selector(helpPage), for: .touchUpInside)
        nextPageButton3.addTarget(self, action: #selector(policyPage), for: .touchUpInside)
        nextPageButton4.addTarget(self, action: #selector(goOutPage), for: .touchUpInside)
        addConstraints()
    }
    
    @objc func reservationPage(sender: UIButton){
        //TODO: Needs a logic to pressents two states of the same view, one empty and one with at least onde reservation. If number of reservations equals zero, then presents the empty view, else, presents the table view with the reservations.
        print("Do not have")
    }
    
    @objc func helpPage(sender: UIButton){
        let vc = HelpView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func policyPage(sender: UIButton){
        let vc = TermsAndConditionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func goOutPage(sender: UIButton){
        let vc = HomeOpenView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        print("OOOI")
    }
    
    func addConstraints(){
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        profilePic.widthAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        profilePic.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen).isActive = true
        profilePic.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        profilePic.constraintInsideTo(.top, view.safeAreaLayoutGuide, 39)
        
        helloLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        helloLabel.constraintOutsideTo(.top, profilePic, CGFloat(60).generateSizeForScreen)
        
        subtitleLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        subtitleLabel.constraintOutsideTo(.top, helloLabel, CGFloat(10).generateSizeForScreen)
        subtitleLabel.heightAnchor.constraint(equalToConstant: CGFloat(18.13).generateSizeForScreen).isActive = true
        
        backView.constraintOutsideTo(.top, subtitleLabel, CGFloat(40).generateSizeForScreen)
        backView.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        backView.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        backView.heightAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        
        infoLabel.constraintInsideTo(.top, backView, CGFloat(20).generateSizeForScreen)
        infoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        infoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subInfoLabel.constraintOutsideTo(.top, infoLabel, CGFloat(10).generateSizeForScreen)
        subInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        subInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView.constraintInsideTo(.right, backView, CGFloat(-20).generateSizeForScreen)
        separatorView.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        separatorView.constraintInsideTo(.top, backView, CGFloat(75).generateSizeForScreen)
        
        bravveInfoLabel.constraintOutsideTo(.top, separatorView, CGFloat(15).generateSizeForScreen)
        bravveInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        bravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subBravveInfoLabel.constraintOutsideTo(.top, bravveInfoLabel, CGFloat(10).generateSizeForScreen)
        subBravveInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        subBravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        infoImage.constraintOutsideTo(.top, backView, CGFloat(38).generateSizeForScreen)
        infoImage.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        infoImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        reservationLabel.constraintOutsideTo(.top, backView, CGFloat(38).generateSizeForScreen)
        reservationLabel.constraintOutsideTo(.left, infoImage, CGFloat(27).generateSizeForScreen)
        reservationLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton.constraintOutsideTo(.top, backView, CGFloat(35).generateSizeForScreen)
        nextPageButton.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView2.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView2.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView2.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView2.constraintOutsideTo(.top, reservationLabel, CGFloat(20).generateSizeForScreen)

        helpImage.constraintOutsideTo(.top, separatorView2, CGFloat(25).generateSizeForScreen)
        helpImage.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        helpImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        helpImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        helpLabel.constraintOutsideTo(.top, separatorView2, CGFloat(25).generateSizeForScreen)
        helpLabel.constraintOutsideTo(.left, helpImage, CGFloat(27).generateSizeForScreen)
        helpLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton2.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton2.constraintOutsideTo(.top, separatorView2, CGFloat(22).generateSizeForScreen)
        nextPageButton2.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton2.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView3.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView3.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView3.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView3.constraintOutsideTo(.top, helpLabel, CGFloat(20).generateSizeForScreen)
        
        policyImage.constraintOutsideTo(.top, separatorView3, CGFloat(25).generateSizeForScreen)
        policyImage.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        policyImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        policyImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        policyLabel.constraintOutsideTo(.top, separatorView3, CGFloat(25).generateSizeForScreen)
        policyLabel.constraintOutsideTo(.left, policyImage, CGFloat(27).generateSizeForScreen)
        policyLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton3.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton3.constraintOutsideTo(.top, separatorView3, CGFloat(22).generateSizeForScreen)
        nextPageButton3.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton3.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView4.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView4.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView4.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView4.constraintOutsideTo(.top, policyLabel, CGFloat(20).generateSizeForScreen)

        logoutImage.constraintOutsideTo(.top, separatorView4, CGFloat(25).generateSizeForScreen)
        logoutImage.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        logoutImage.heightAnchor.constraint(equalToConstant: CGFloat(12).generateSizeForScreen).isActive = true
        logoutImage.widthAnchor.constraint(equalToConstant: CGFloat(16).generateSizeForScreen).isActive = true
        
        logoutLabel.constraintOutsideTo(.top, separatorView4, CGFloat(23).generateSizeForScreen)
        logoutLabel.constraintOutsideTo(.left, logoutImage, CGFloat(27).generateSizeForScreen)
        logoutLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton4.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton4.constraintOutsideTo(.top, separatorView4, CGFloat(22).generateSizeForScreen)
        nextPageButton4.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton4.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView5.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView5.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView5.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView5.constraintOutsideTo(.top, logoutLabel, CGFloat(20).generateSizeForScreen)
        
        smallView.constraintInsideTo(.top, backView, CGFloat(29.67).generateSizeForScreen)
        smallView.constraintInsideTo(.right, backView, CGFloat(-17).generateSizeForScreen)
        smallView.heightAnchor.constraint(equalToConstant: CGFloat(29).generateSizeForScreen).isActive = true
        smallView.widthAnchor.constraint(equalToConstant: CGFloat(94).generateSizeForScreen).isActive = true
        
        numberLabel.constraintInsideTo(.left, smallView, CGFloat(12).generateSizeForScreen)
        numberLabel.constraintInsideTo(.top, smallView, CGFloat(6.69).generateSizeForScreen)
        numberLabel.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
        
        creditLabel.constraintInsideTo(.right, smallView, CGFloat(-12).generateSizeForScreen)
        creditLabel.constraintInsideTo(.top, smallView,  CGFloat(6.69).generateSizeForScreen)
        creditLabel.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
        
        smallView2.constraintInsideTo(.top, separatorView, CGFloat(18.87).generateSizeForScreen)
        smallView2.constraintInsideTo(.right, backView, CGFloat(-17).generateSizeForScreen)
        smallView2.heightAnchor.constraint(equalToConstant: CGFloat(29).generateSizeForScreen).isActive = true
        smallView2.widthAnchor.constraint(equalToConstant: CGFloat(94).generateSizeForScreen).isActive = true
        
        numberLabel2.constraintInsideTo(.left, smallView2, CGFloat(12).generateSizeForScreen)
        numberLabel2.constraintInsideTo(.top, smallView2, CGFloat(6.69).generateSizeForScreen)
        numberLabel2.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true

        creditLabel2.constraintInsideTo(.right, smallView2, CGFloat(-12).generateSizeForScreen)
        creditLabel2.constraintInsideTo(.top, smallView2, CGFloat(6.69).generateSizeForScreen)
        creditLabel2.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
    }
}
