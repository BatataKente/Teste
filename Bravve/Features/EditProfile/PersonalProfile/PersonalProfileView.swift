//
//  PerfilPessoalView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import SwiftUI
import SDWebImage

class PersonalProfileView: UIViewController{
    
    private lazy var tabBar = TabBarClosed.init(self)
    
    //MARK: - wayImage
    let wayImage: UIImageView = {
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - profilePic
    let profilePic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    
    //MARK: - helloLabel
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Ana!"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(30).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - subtitleLabel
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ana.maria@teste.com.br"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: "profileLabel")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - backView
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(named: "borderAccounts")?.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - infoLabel
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Foursys"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - subInfoLabel
    let subInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - separatorView
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor =  UIColor(named: "borderAccounts")?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - bravveInfoLabel
    let bravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Bravve"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - subBravveInfoLabel
    let subBravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - infoImage
    let infoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info-circle")
        return image
    }()
    
    //MARK: - reservationLabel
    let reservationLabel: UILabel = {
        let label = UILabel()
        label.text = "Histórico de reservas"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - nextPageButton
    let nextPageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()

    //MARK: - separatorView2
    var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - helpImage
    let helpImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info-circle")
        return image
    }()
    
    //MARK: - helpLabel
    let helpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ajuda"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - nextPageButton2
    let nextPageButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    //MARK: - separatorView3
    var separatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - policyImage
    let policyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "book")
        return image
    }()
    
    //MARK: - policyLabel
    let policyLabel: UILabel = {
        let label = UILabel()
        label.text = "Política e Termos de uso"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - nextPageButton3
    let nextPageButton3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    //MARK: - separatorView4
    var separatorView4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - logoutImage
    let logoutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "exitProfile")
        return image
    }()
    
    //MARK: - logoutLabel
    let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Sair"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()

    //MARK: - nextPageButton4
    let nextPageButton4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowProfile"), for: .normal)
        return button
    }()
    
    //MARK: - separatorView5
    var separatorView5: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - smallview
    var smallView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: "borderCredit")?.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - numberLabel
    var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "112"
        label.textColor = UIColor(named: "buttonPink")
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    //MARK: - creditLabel
    var creditLabel: UILabel = {
        let label = UILabel()
        label.text = "créditos"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    //MARK: - smallView2
    var smallView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: "borderCredit")?.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: - numberLabel2
    var numberLabel2: UILabel = {
        let label = UILabel()
        label.text = "312"
        label.textColor = UIColor(named: "buttonPink")
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    //MARK: - creditLabel2
    var creditLabel2: UILabel = {
        let label = UILabel()
        label.text = "créditos"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        return label
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: - personalProfileViewModel
    private let personalProfileViewModel = PersonalProfileViewModel()
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[2]
    }
    
    //MARK: - loadView
    override func viewDidLoad() {
        super.viewDidLoad()
        personalProfileViewModel.delegate = self  
        personalProfileViewModel.userData()
        tabBar.selectedItem = tabBar.items?[2]

        view.backgroundColor = UIColor(named: "background")
        
        view.addSubviews([tabBar,
                          wayImage,
                          profilePic,
                          helloLabel,
                          subtitleLabel,
                          backView,
                          infoLabel,
                          subInfoLabel,
                          separatorView,
                          bravveInfoLabel,
                          subBravveInfoLabel,
                          infoImage,
                          reservationLabel,
                          nextPageButton,
                          separatorView2,
                          helpImage,
                          helpLabel,
                          nextPageButton2,
                          separatorView3,
                          policyImage,
                          policyLabel,
                          nextPageButton3,
                          separatorView4,
                          logoutImage,
                          logoutLabel,
                          nextPageButton4,
                          separatorView5,
                          smallView,
                          numberLabel,
                          creditLabel,
                          smallView2,
                          numberLabel2,
                          creditLabel2])
        
        nextPageButton.addTarget(self, action: #selector(reservationPage), for: .touchUpInside)
        nextPageButton2.addTarget(self, action: #selector(helpPage), for: .touchUpInside)
        nextPageButton3.addTarget(self, action: #selector(policyPage), for: .touchUpInside)
        nextPageButton4.addTarget(self, action: #selector(goOutPage), for: .touchUpInside)
        addConstraints()
          }
    
    //MARK: - ACTIONS AND METHODS
    
    //MARK: - reservationPage
    @objc func reservationPage(){
        
            let lastReservations = BookingHistoryView()
            lastReservations.modalPresentationStyle = .fullScreen
            self.present(lastReservations, animated: true)
        
    }
    
    //MARK: - helpPage
    @objc func helpPage(sender: UIButton){
        let vc = HelpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    //MARK: - policyPage
    @objc func policyPage(sender: UIButton){
        let vc = TermsAndConditionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    //MARK: - goOutPage
    @objc func goOutPage(sender: UIButton){
        let vc = HomeOpenView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    //MARK: - addConstraints
    func addConstraints(){

        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive =  true
        
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.widthAnchor.constraint(equalToConstant: CGFloat(121).generateSizeForScreen).isActive = true
        profilePic.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        profilePic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(39).generateSizeForScreen).isActive = true
        profilePic.sizeAnchorInSuperview(CGFloat(121).generateSizeForScreen)
        profilePic.layer.cornerRadius = view.frame.size.height / 14
        
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        helloLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: CGFloat(9).generateSizeForScreen).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: CGFloat(9).generateSizeForScreen).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: CGFloat(18.13).generateSizeForScreen).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints =  false
        backView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: CGFloat(40).generateSizeForScreen).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        backView.heightAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant:  CGFloat(20).generateSizeForScreen).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        subInfoLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(10).generateSizeForScreen).isActive = true
        subInfoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        subInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant:  CGFloat(-20).generateSizeForScreen).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant:  CGFloat(20).generateSizeForScreen).isActive = true
        separatorView.topAnchor.constraint(equalTo: backView.topAnchor, constant:  CGFloat(75).generateSizeForScreen).isActive = true
        
        bravveInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        bravveInfoLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: CGFloat(15).generateSizeForScreen).isActive = true
        bravveInfoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        bravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subBravveInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        subBravveInfoLabel.topAnchor.constraint(equalTo: bravveInfoLabel.bottomAnchor, constant: CGFloat(10).generateSizeForScreen).isActive = true
        subBravveInfoLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        subBravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: CGFloat(38).generateSizeForScreen).isActive = true
        infoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(33).generateSizeForScreen).isActive = true
        infoImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        reservationLabel.translatesAutoresizingMaskIntoConstraints = false
        reservationLabel.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: CGFloat(38).generateSizeForScreen).isActive = true
        reservationLabel.leadingAnchor.constraint(equalTo: infoImage.trailingAnchor, constant: CGFloat(12.5).generateSizeForScreen).isActive = true
        reservationLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-33).generateSizeForScreen).isActive = true
        nextPageButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: CGFloat(35).generateSizeForScreen).isActive = true
        nextPageButton.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        separatorView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  CGFloat(20).generateSizeForScreen).isActive = true
        separatorView2.topAnchor.constraint(equalTo: reservationLabel.bottomAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true

        helpImage.translatesAutoresizingMaskIntoConstraints = false
        helpImage.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: CGFloat(25).generateSizeForScreen).isActive = true
        helpImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  CGFloat(33).generateSizeForScreen).isActive = true
        helpImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        helpImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: CGFloat(25).generateSizeForScreen).isActive = true
        helpLabel.leadingAnchor.constraint(equalTo: helpImage.trailingAnchor, constant: CGFloat(12.5).generateSizeForScreen).isActive = true
        helpLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton2.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-33).generateSizeForScreen).isActive = true
        nextPageButton2.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: CGFloat(22).generateSizeForScreen).isActive = true
        nextPageButton2.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton2.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView3.translatesAutoresizingMaskIntoConstraints = false
        separatorView3.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        separatorView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        separatorView3.topAnchor.constraint(equalTo: helpLabel.bottomAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        
        policyImage.translatesAutoresizingMaskIntoConstraints = false
        policyImage.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: CGFloat(25).generateSizeForScreen).isActive = true
        policyImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(33).generateSizeForScreen).isActive = true
        policyImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        policyImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        policyLabel.translatesAutoresizingMaskIntoConstraints = false
        policyLabel.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: CGFloat(25).generateSizeForScreen).isActive = true
        policyLabel.leadingAnchor.constraint(equalTo: policyImage.trailingAnchor, constant: CGFloat(12.5).generateSizeForScreen).isActive = true
        policyLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton3.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-33).generateSizeForScreen).isActive = true
        nextPageButton3.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant:  CGFloat(22).generateSizeForScreen).isActive = true
        nextPageButton3.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton3.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView4.translatesAutoresizingMaskIntoConstraints = false
        separatorView4.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        separatorView4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        separatorView4.topAnchor.constraint(equalTo: policyLabel.bottomAnchor, constant:  CGFloat(20).generateSizeForScreen).isActive = true

        logoutImage.translatesAutoresizingMaskIntoConstraints = false
        logoutImage.topAnchor.constraint(equalTo: separatorView4.bottomAnchor, constant: CGFloat(25).generateSizeForScreen).isActive = true
        logoutImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(33).generateSizeForScreen).isActive = true
        logoutImage.heightAnchor.constraint(equalToConstant: CGFloat(12).generateSizeForScreen).isActive = true
        logoutImage.widthAnchor.constraint(equalToConstant: CGFloat(16).generateSizeForScreen).isActive = true
        
        logoutLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutLabel.topAnchor.constraint(equalTo: separatorView4.bottomAnchor, constant: CGFloat(23).generateSizeForScreen).isActive = true
        logoutLabel.leadingAnchor.constraint(equalTo: logoutImage.trailingAnchor, constant: CGFloat(12.5).generateSizeForScreen).isActive = true
        logoutLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton4.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-33).generateSizeForScreen).isActive = true
        nextPageButton4.topAnchor.constraint(equalTo: separatorView4.bottomAnchor, constant: CGFloat(22).generateSizeForScreen).isActive = true
        nextPageButton4.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton4.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView5.translatesAutoresizingMaskIntoConstraints = false
        separatorView5.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        separatorView5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        separatorView5.topAnchor.constraint(equalTo: logoutLabel.bottomAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        
        smallView.translatesAutoresizingMaskIntoConstraints = false
        smallView.topAnchor.constraint(equalTo: backView.topAnchor, constant: CGFloat(29.67).generateSizeForScreen).isActive = true
        smallView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: CGFloat(-17).generateSizeForScreen).isActive = true
        smallView.heightAnchor.constraint(equalToConstant: CGFloat(29).generateSizeForScreen).isActive = true
        smallView.widthAnchor.constraint(equalToConstant: CGFloat(94).generateSizeForScreen).isActive = true
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.leadingAnchor.constraint(equalTo: smallView.leadingAnchor, constant: CGFloat(12).generateSizeForScreen).isActive = true
        numberLabel.topAnchor.constraint(equalTo: smallView.topAnchor, constant: CGFloat(6.69).generateSizeForScreen).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
        
        creditLabel.translatesAutoresizingMaskIntoConstraints = false
        creditLabel.trailingAnchor.constraint(equalTo: smallView.trailingAnchor, constant: CGFloat(-12).generateSizeForScreen).isActive = true
        creditLabel.topAnchor.constraint(equalTo: smallView.topAnchor, constant: CGFloat(6.69).generateSizeForScreen).isActive = true
        creditLabel.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
        
        smallView2.translatesAutoresizingMaskIntoConstraints = false
        smallView2.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: CGFloat(18.87).generateSizeForScreen).isActive = true
        smallView2.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: CGFloat(-17).generateSizeForScreen).isActive = true
        smallView2.heightAnchor.constraint(equalToConstant: CGFloat(29).generateSizeForScreen).isActive = true
        smallView2.widthAnchor.constraint(equalToConstant: CGFloat(94).generateSizeForScreen).isActive = true
        
        numberLabel2.translatesAutoresizingMaskIntoConstraints = false
        numberLabel2.leadingAnchor.constraint(equalTo: smallView2.leadingAnchor, constant: CGFloat(12).generateSizeForScreen).isActive = true
        numberLabel2.topAnchor.constraint(equalTo: smallView2.topAnchor, constant: CGFloat(6.69).generateSizeForScreen).isActive = true
        numberLabel2.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true

        creditLabel2.translatesAutoresizingMaskIntoConstraints = false
        creditLabel2.trailingAnchor.constraint(equalTo: smallView2.trailingAnchor, constant: CGFloat(-12).generateSizeForScreen).isActive = true
        creditLabel2.topAnchor.constraint(equalTo: smallView2.topAnchor, constant: CGFloat(6.69).generateSizeForScreen).isActive = true
        creditLabel2.heightAnchor.constraint(equalToConstant: CGFloat(16.73).generateSizeForScreen).isActive = true
    }
}

//MARK: - PersonalProfileView
extension PersonalProfileView: PersonalProfileViewModelProtocol {
    
    //MARK: - setupPic
    func setupPic(URL: URL?, placeholderImage: UIImage?) {
        
        self.profilePic.sd_setImage(with: URL, placeholderImage: placeholderImage)
        
    }
    
    //MARK: - setupLabels
    func setupLabels(email: String?, firstName: String) {
        
        self.helloLabel.text = "Olá, \(firstName)!"
        self.subtitleLabel.text = email
        
    }
}
